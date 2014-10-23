//
//  JHCache.swift
//  精弘论坛
//
//  Created by Dikey on 10/11/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//
//todo ：需要把写缓存放到后台进行

import Foundation

@objc class JHCache :NSObject{
    //缓存文件名
    
    class var sharedInstance : JHCache {
        struct Static {
            static let instance : JHCache = JHCache()
        }
        return Static.instance
    }
    
    var memoryCache  = NSMutableDictionary()
    var recentlyAccessedKeys = NSMutableArray()
    let kCacheMemoryLimit = 20
    
    override init() {
        super.init()
        
        let memoryCache:NSMutableDictionary = NSMutableDictionary()
        let recentlyAccessedKeys:NSMutableArray = NSMutableArray()
        let kCacheMemoryLimit = 10
        
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
        
        
        for (key, value) in self.memoryCache {
            println("key is \(key)")
        }
        
    }
    
    func  getCachedItem(fileName:String)->NSArray{
        
        var cachedItemArray = NSArray()
        
        //假如内存中有数据，从内存缓存中返回
        //取到的数据是NSData，最后返回的应该是解析成NSArray的数据
        
        if let memoryCache: NSData = self.memoryCache.objectForKey(fileName) as? NSData{
            //假如存在 NSData
            cachedItemArray = NSKeyedUnarchiver.unarchiveObjectWithData(memoryCache as NSData)! as NSArray
            return cachedItemArray
        }
        
        //假如内存中没有数据，从硬盘缓存中读取
        //path	String	"/var/mobile/Containers/Data/Application/6494B6BE-4C4C-4F3B-8BD5-6759DB8DAA9B/Library/CachesTopicAuthorCache1628780"
        
        let path = self.cacheDirectory(fileName)
        if let diskCache: NSArray = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? NSArray{
            
            cachedItemArray = diskCache
            //self.saveDataToMemory(dataFormCache!)
            return cachedItemArray
        }

        return cachedItemArray
    }
    
    
    func clearCache(){
        self.memoryCache.removeAllObjects()
    }
    
    //私有方法，实现方法
    func receivedMemoryWarningAndSaveDataToDisk(notification: NSNotification){
        
        //将所有数据缓存到Disk,并且清空缓存
        //遍历 self.memoryCache 中allKeys ，保存

        for (key, value) in self.memoryCache {
            self.saveMemoryCacheToDisk(value as NSData, fileName: key as String)
        }
        
        self.memoryCache.removeAllObjects()

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
