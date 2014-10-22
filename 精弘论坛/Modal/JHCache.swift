//
//  JHCache.swift
//  精弘论坛
//
//  Created by Dikey on 10/11/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

import Foundation

@objc class JHCache :NSObject{

    var memoryCache  = NSMutableDictionary()
    var recentlyAccessedKeys = NSMutableArray()
    let kCacheMemoryLimit = 20
    
    override init() {
        super.init()
        
//        let memoryCache:NSMutableDictionary = NSMutableDictionary()
//        let recentlyAccessedKeys:NSMutableArray = NSMutableArray()
//        let kCacheMemoryLimit = 10
        
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: "receivedMemoryWarningAndSaveDataToDisk:", name: UIApplicationDidReceiveMemoryWarningNotification, object: nil)

//        NSNotificationCenter.defaultCenter().addObserver(self, selector: "receivedMemoryWarningAndSaveDataToDisk:", name: UIApplicationDidEnterBackgroundNotification, object: nil)
        
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: "receivedMemoryWarningAndSaveDataToDisk:", name: UIApplicationWillTerminateNotification, object: nil)
    }
    
    func cacheDataToFile (data:AnyObject, fileName:String){
        
        //假如已经存在，替换
        let archiverData = NSKeyedArchiver.archivedDataWithRootObject(data) //NSArray->NSData
        self.memoryCache.setObject(archiverData, forKey:fileName)
        
        if((self.recentlyAccessedKeys.containsObject(fileName))){
            [self.recentlyAccessedKeys.removeObject(fileName)];
        }
        self.recentlyAccessedKeys.insertObject(fileName, atIndex: 0)
        
        //数量限制，假如超过十个就将最少使用的一个保存到闪存
        if(self.recentlyAccessedKeys.count > kCacheMemoryLimit){
            
            if let lastObject:AnyObject = self.recentlyAccessedKeys.lastObject{
                let lastObjectData: NSData! = self.memoryCache.objectForKey(lastObject) as NSData
                let path = self.cacheDirectory(fileName)
                lastObjectData.writeToFile(path, atomically:true)

                self.recentlyAccessedKeys.removeLastObject()
                self.memoryCache.removeObjectForKey(lastObject)
            }
        }
        
//        self.saveAllMemoryCacheToDisk();
        
        print("JHMemorycache.count is \(self.memoryCache.count)")
    }
    
    func  getCachedItem(fileName:String)->AnyObject{
        
        var cachedItemArray:NSArray = NSArray()
        
        //假如内存中有数据，从内存缓存中返回
        if let memoryCache: AnyObject = self.memoryCache.objectForKey(fileName){ //NSData
        let unarchivedData: AnyObject = NSKeyedUnarchiver.unarchiveObjectWithData(memoryCache as NSData)!
            cachedItemArray = unarchivedData as NSArray
        }
        
        //假如内存中没有数据，从闪存中读取
        let path = self.cacheDirectory(fileName)

//        if let dataFormCache:AnyObject = NSData.dataWithContentsOfFile(path, options: NSDataReadingOptions.DataReadingMappedIfSafe, error: nil){
//            let unarchivedData: AnyObject = NSKeyedUnarchiver.unarchiveObjectWithData(dataFormCache as NSData)!
//            cachedItemArray = unarchivedData as NSArray
//            self.saveDataToMemory(dataFormCache)
//            return unarchivedData as NSArray
//        }
        
//        dataWithContentsOfFile(_:options:error:)' is unavailable:
//        use  'NSData(contentsOfFile:options:error:)'
        

        //path	String	"/var/mobile/Containers/Data/Application/6494B6BE-4C4C-4F3B-8BD5-6759DB8DAA9B/Library/CachesTopicAuthorCache1628780"	
        
        if let dataFormCache:AnyObject = NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe, error: nil)        {
            let unarchivedData: AnyObject = NSKeyedUnarchiver.unarchiveObjectWithData(dataFormCache as NSData)!
            cachedItemArray = unarchivedData as NSArray
            self.saveDataToMemory(dataFormCache)
            return unarchivedData as NSArray
        }

        
        
        return cachedItemArray
    }
    
    
    func clearCache(){
        self.memoryCache.removeAllObjects()
    }
    
    //私有方法，实现方法
    func receivedMemoryWarningAndSaveDataToDisk(notification: NSNotification){
        
        self.memoryCache.removeAllObjects()
        //将所有数据缓存到Disk,并且清空缓存
        //遍历 self.memoryCache 中allKeys ，保存

        for (key, value) in self.memoryCache {
            self.saveMemoryCacheToDisk(value as NSData, fileName: key as String)
        }
        println("收到了内存警告")
    }
    
    func saveAllMemoryCacheToDisk(){
        
//        self.memoryCache.removeAllObjects()
        //将所有数据缓存到Disk,并且清空缓存
        
        for (key, value) in self.memoryCache {
            self.saveMemoryCacheToDisk(value as NSData, fileName: key as String)
        }
    }
    
    //根据文件名，得到缓存文件的路径
    private func cacheDirectory(fileName:String)->String{
        //得到缓存文件路径名 ，比如 NSCacheDirectory/Appcache/fileName.tmp
        
        let documentsPath :AnyObject = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
        
        let destinationPath:String =  documentsPath.stringByAppendingString(fileName)
        
        return destinationPath
    }
    
    private func saveDataToMemory (dataObject: AnyObject){
                
        //传入的object 固化成NSDate
        let archivedData = NSKeyedArchiver.archivedDataWithRootObject(dataObject)
        
        //?那么如何重用这个data呢？
    }
    
   private func saveMemoryCacheToDisk(data:NSData ,fileName:String){
        // 保存缓存到文件
    let path = self.cacheDirectory(fileName)
    NSKeyedArchiver.archiveRootObject(data, toFile: path)
    }
}
