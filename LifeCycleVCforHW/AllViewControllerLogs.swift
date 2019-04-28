//
//  AllViewControllerLogs.swift
//  LifeCycleVCforHW
//
//  Created by Savonevich Constantine on 4/28/19.
//  Copyright © 2019 Savonevich Konstantin. All rights reserved.
//

//  Singletone pattern (consists all needable logs)
class AllViewControllerLogs  {
    
    static let shared = AllViewControllerLogs()
    var arrayOfLogs = [String]()
}
