//
//  JHCache.swift
//  精弘论坛
//
//  Created by Dikey on 10/11/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

import Foundation

class JHCache : NSObject {
    
    func cacheDirectory()->String{
        let documentsPath :AnyObject = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
        let destinationPath:String =  documentsPath.stringByAppendingString("/test.db")
        
        return destinationPath
    }
    
    func clearAllCache(){
        
    }
    
    func saveMemoryCacheToDisk(){
        
    }
    
    func cacheDateToFile( date:NSData , fileName:String){
        
    }
    
    func getCachedItems()->AnyObject{
        let object: AnyObject? =  NSKeyedUnarchiver.unarchiveObjectWithFile(self.cacheDirectory())
        return object!
    }
}
