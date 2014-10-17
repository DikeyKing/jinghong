//
//  JHLeftViewController.swift
//  精弘论坛
//
//  Created by Dikey on 10/17/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

import Foundation
import UIKit

class JHLeftViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 0
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        var cell:UITableViewCell?
        
        return cell!
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
}