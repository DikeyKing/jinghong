//
//  JHCache.swift
//  精弘论坛
//
//  Created by Dikey on 10/11/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

import Foundation

//enum {
//    CACHEPATH_RECENTTOPICS = 1;
//    CACHEPATH_BOARD = 2
//}

@objc class JHCache  {
    
    var filePath:String?
    
    init() {
        
        self.filePath = self.cacheDirectory()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "receivedMemoryWarningAndSaveDataToDisk:", name: UIApplicationDidReceiveMemoryWarningNotification, object: nil)
    
    }
    
    func receivedMemoryWarningAndSaveDataToDisk(notification: NSNotification){
        println("收到了内存警告")
    }
    
    //可以考虑cacheDirectory 传入 缓存名 String
    
    func cacheDirectory()->String{
        let documentsPath :AnyObject = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
        
        let destinationPath:String =  documentsPath.stringByAppendingString("/test.db")
        return destinationPath
    }
    
    func saveDataToMemory (dataObject: AnyObject)->NSData{
        
        //传入的object 固化成NSDate
        let archivedData = NSKeyedArchiver.archivedDataWithRootObject(dataObject)
        //?那么如何重用这个data呢？

        return archivedData
    }
    

    
    func saveMemoryCacheToDisk( data:NSData , fileName:String){
        // 保存缓存到文件
        let fileName = self.cacheDirectory()
        NSKeyedArchiver.archiveRootObject(data, toFile: fileName)
    }
    
    func getCachedItems()->AnyObject{
        //返回缓存的文件
        let object: AnyObject? =  NSKeyedUnarchiver.unarchiveObjectWithFile(self.cacheDirectory())
        
        return object!
    }
    
    func clearAllCache(){
        
    }
}
