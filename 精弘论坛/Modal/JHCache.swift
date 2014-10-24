//
//  JHCache.swift
//  精弘论坛
//
//  Created by Dikey on 10/11/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//
//todo ：需要把写缓存放到后台进行
//根据过期时间删除？

import Foundation

@objc class JHCache :NSObject{
    
    class var sharedInstance : JHCache {
        struct Static {
            static let instance : JHCache = JHCache()
        }
        return Static.instance
    }
    
    
    var memoryCache  = NSMutableDictionary() //一个Key对应一个NSData对象
    var recentlyAccessedKeys = NSMutableArray() //保存最近使用的Keys
    let kCacheMemoryLimit = 20
    let fileManager = NSFileManager()
    let kCACHE_VERSION = "CACHE_VERSION"
    
    override init() {
        
        super.init()
        
        self.checkAppVersionAndCacheDirectory()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "receivedMemoryWarningAndSaveDataToDisk:", name: UIApplicationDidReceiveMemoryWarningNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "receivedMemoryWarningAndSaveDataToDisk:", name: UIApplicationDidEnterBackgroundNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "receivedMemoryWarningAndSaveDataToDisk:", name: UIApplicationWillTerminateNotification, object: nil)
        
    }
    
    func cacheDataToFile (data:NSArray, fileName:String){
        
        //假如已经存在，替换
        let archiverData = NSKeyedArchiver.archivedDataWithRootObject(data) //NSArray->NSData
        self.memoryCache.setObject(archiverData, forKey:fileName)
        
        if((self.recentlyAccessedKeys.containsObject(fileName))){
            [self.recentlyAccessedKeys.removeObject(fileName)];
        }
        self.recentlyAccessedKeys.insertObject(fileName, atIndex: 0)
        
        //数量限制，假如超过数量就将最少使用的一个保存到闪存
        if(self.recentlyAccessedKeys.count > kCacheMemoryLimit){

            if let lastObject:AnyObject = self.recentlyAccessedKeys.lastObject{
                let lastObjectData: NSData! = self.memoryCache.objectForKey(lastObject) as NSData
                let path = self.cacheDirectory(fileName)
                lastObjectData.writeToFile(path, atomically:true)

                self.recentlyAccessedKeys.removeLastObject()
                self.memoryCache.removeObjectForKey(lastObject)
            }
        }
        
        for (key, value) in self.memoryCache {
            println("key is \(key)")
        }
    }
    
    func  getCachedItem(fileName:String)->NSArray{
        
        var cachedItemArray = NSArray()
             //假如内存中有数据，从内存缓存中返回 取到的数据是NSData，最后返回的应该是解析成NSArray的数据
        if let memoryCache: NSData = self.memoryCache.objectForKey(fileName) as? NSData{
            cachedItemArray = NSKeyedUnarchiver.unarchiveObjectWithData(memoryCache as NSData)! as NSArray
            return cachedItemArray
        }else{
            //假如内存中没有数据，从硬盘缓存中读取
         
            let path = self.cacheDirectory(fileName)
            if let diskCacheFromFile = NSFileManager.defaultManager().contentsAtPath(path){
                println("读取硬盘成功")
                cachedItemArray = NSKeyedUnarchiver.unarchiveObjectWithData(diskCacheFromFile)! as NSArray
                self.memoryCache.setObject(diskCacheFromFile, forKey:fileName)//保存一份到内存
                return cachedItemArray
            }
        }
    
        return cachedItemArray
    }
    
    func clearCache(){
        self.memoryCache.removeAllObjects()
        self.recentlyAccessedKeys.removeAllObjects()
        let Path :AnyObject = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
        let cachePathString:String = Path.stringByAppendingPathComponent("JHCache")
        fileManager.removeItemAtPath(cachePathString, error: nil)
    }
    
    func receivedMemoryWarningAndSaveDataToDisk(notification: NSNotification){
        self.saveAllMemoryCacheToDisk();
    }//这个方法不能为私有

    
    //私有方法，实现方法
    private func saveAllMemoryCacheToDisk(){
        //遍历 self.memoryCache 中allKeys ，保存
        for (key, value) in self.memoryCache {
            self.saveMemoryCacheToDisk(value as NSData, fileName: key as String)
        }
        
        self.memoryCache.removeAllObjects()
        self.recentlyAccessedKeys.removeAllObjects()
    }
    
    //根据文件名，得到缓存文件的路径
    private func cacheDirectory(fileName:String)->String{
    // data/Containers/Application/6615CDA5-3BC3-4B5D-9243-6E02FC141DCB/tmp/JHCache
        let documentsPath :AnyObject = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
        let cachePathString:String =  documentsPath.stringByAppendingPathComponent("JHCache")
        let destinationPath:String =  cachePathString.stringByAppendingPathComponent(fileName)
        return destinationPath
    }
    
   private func saveMemoryCacheToDisk(data:NSData ,fileName:String){
    let path = self.cacheDirectory(fileName)
        let isSucceeded = data.writeToFile(path, atomically: true)
        if data.writeToFile(path, atomically: true){
            println("缓存到硬盘成功")
        }else{
            println("缓存到硬盘失败")
        }
    }
    
    private func checkAppVersionAndCacheDirectory(){
        
        let appVersionCFString: AnyObject  = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString")!
        let appVersionString = appVersionCFString as NSString
        let appVersion = appVersionString.doubleValue
        let cachedVersion = NSUserDefaults.standardUserDefaults().doubleForKey(kCACHE_VERSION)
       
        if cachedVersion < appVersion || cachedVersion == 0{
            self.clearCache()
            NSUserDefaults.standardUserDefaults().setDouble(appVersion, forKey: kCACHE_VERSION)
        }
        
        
//        NSString *archivePath = [[AppCache cacheDirectory] stringByAppendingPathComponent:@"MenuItems.archive"];
//        
//        NSTimeInterval stalenessLevel = [[[[NSFileManager defaultManager] attributesOfItemAtPath:archivePath error:nil] fileModificationDate] timeIntervalSinceNow];
//        
//        return stalenessLevel > kMenuStaleSeconds;
        
        let documentsPath :AnyObject = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
        let cachePathString:String =  documentsPath.stringByAppendingPathComponent("JHCache")
        
        if !fileManager.fileExistsAtPath(cachePathString){
            fileManager.createDirectoryAtPath(cachePathString, withIntermediateDirectories: true, attributes: nil, error: nil)
        }else{
            let stalenessLevel:NSDictionary = fileManager.attributesOfItemAtPath(cachePathString, error: nil)!
            let createdData: AnyObject? = stalenessLevel.objectForKey("NSFileCreationDate")
            //
        }
        
    }
}
