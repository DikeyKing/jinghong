//
//  JHCache.swift
//  精弘论坛
//
//  Created by Dikey on 10/11/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

import Foundation


@objc class JHCache  {
    
    var filePath:String?
    
    init() {
        
        self.filePath = self.cacheDirectory()
        
    }
    
    func cacheDirectory()->String{
        let documentsPath :AnyObject = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
        
        let destinationPath:String =  documentsPath.stringByAppendingString("/test.db")
        
        return destinationPath
    }
    
    func saveDataToMemory (dataObject: AnyObject){
        
        NSKeyedArchiver.archivedDataWithRootObject(dataObject)
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
