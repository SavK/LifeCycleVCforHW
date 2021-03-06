//
//  LogsAndSwitches.swift
//  LifeCycleVCforHW
//
//  Created by Savonevich Constantine on 4/28/19.
//  Copyright © 2019 Savonevich Konstantin. All rights reserved.
//

//  Singletone pattern (consists all needable logs and status of switches)
class LogsOfViewController  {
    
    static let shared = LogsOfViewController()
    var arrayOfLogs = [String]()
}

class CurrentStatusOfSwitches  {
    
    static let shared = CurrentStatusOfSwitches()
    var statusOfSwitches = [Bool](repeating: true, count: 5)
}
