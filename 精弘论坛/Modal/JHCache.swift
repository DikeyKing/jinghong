//
//  JHCache.swift
//  精弘论坛
//
//  Created by Dikey on 10/11/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

import Foundation

@objc class JHCache :NSObject {
    
    var memoryCache:NSMutableDictionary?
    var recentlyAccessedKeys:NSMutableArray?
    
    let kCacheMemoryLimit = 10
    
    override init() {
        
        super.init()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "receivedMemoryWarningAndSaveDataToDisk:", name: UIApplicationDidReceiveMemoryWarningNotification, object: nil)
    
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "receivedMemoryWarningAndSaveDataToDisk:", name: UIApplicationDidEnterBackgroundNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "receivedMemoryWarningAndSaveDataToDisk:", name: UIApplicationWillTerminateNotification, object: nil)
    }
    
    func cacheDataToFile (data:NSArray, fileName:String){
        
        //假如已经存在，替换
        let archiverData = NSKeyedArchiver.archivedDataWithRootObject(data)
        self.memoryCache?.setObject(archiverData, forKey: fileName)

        if((self.recentlyAccessedKeys?.containsObject(fileName)) != nil){
            [self.recentlyAccessedKeys?.removeObject(fileName)];
        }
        self.recentlyAccessedKeys?.insertObject(fileName, atIndex: 0)
        
        //数量限制，假如超过十个就将最少使用的一个保存到闪存
        if(self.recentlyAccessedKeys?.count > kCacheMemoryLimit){
            
            if let lastObject:AnyObject? = self.recentlyAccessedKeys?.lastObject{
                let lastObjectData: NSData! = self.memoryCache!.objectForKey(lastObject!) as NSData
                let path = self.cacheDirectory(fileName)
                lastObjectData.writeToFile(path, atomically:true)

                self.recentlyAccessedKeys?.removeLastObject()
                self.memoryCache?.removeObjectForKey(lastObject!)
            }
        }
        
    }
    
    
    func  getCachedItem(fileName:String)->NSArray{
        
        var dataFormCache:AnyObject?
        var unarchivedData: AnyObject?
        
        //假如内存中有数据，从内存缓存中返回
        if var dataFormCache: AnyObject = self.memoryCache?.objectForKey(fileName){
        unarchivedData = NSKeyedUnarchiver.unarchiveObjectWithData(dataFormCache as NSData)
            return unarchivedData as NSArray
        }
        
        //假如内存中没有数据，从闪存中读取
        let path = self.cacheDirectory(fileName)
        if var dataFormCache:AnyObject = NSData.dataWithContentsOfFile(path, options: NSDataReadingOptions.DataReadingMappedIfSafe, error: nil){
            
            unarchivedData = NSKeyedUnarchiver.unarchiveObjectWithData(dataFormCache as NSData)
            self.saveDataToMemory(dataFormCache)
        }

        return dataFormCache as NSArray
    }
    
    
    //私有方法，实现方法
    
    private func receivedMemoryWarningAndSaveDataToDisk(notification: NSNotification){
        
        println("收到了内存警告")
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
    
   private func saveMemoryCacheToDisk( data:NSData , fileName:String){
        // 保存缓存到文件
        let path = self.cacheDirectory(fileName)
        NSKeyedArchiver.archiveRootObject(data, toFile: path)
    }
    
//
//   private func getCachedItems(fileName:String)->AnyObject{
//        //返回缓存的文件
//        let object: AnyObject? =  NSKeyedUnarchiver.unarchiveObjectWithFile(self.cacheDirectory(fileName))
//        
//        return object!
//    }
    

}
