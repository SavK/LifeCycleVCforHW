//
//  SettingsViewController.swift
//  LifeCycleVCforHW
//
//  Created by Savonevich Constantine on 4/28/19.
//  Copyright © 2019 Savonevich Konstantin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var labelCollection: [UILabel]!
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet var switchCollection: [UISwitch]!
    @IBOutlet weak var infoButton: UIButton!
    
    
    let currentStatusOfSwitches = CurrentStatusOfSwitches.shared
    let logsOfViewController = LogsOfViewController.shared
    
//  variable for alert if some of swiches change his status
    var countOfAlert = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        switchFinder(statusOfSwitches: currentStatusOfSwitches.statusOfSwitches)
    }
}

// MARK: - func for load correct status of switchers
extension SettingsViewController {
    
    func switchFinder(statusOfSwitches: Array<Bool>) {
        
        let countOfStatus = currentStatusOfSwitches.statusOfSwitches.count - 1
        for index in 0...countOfStatus {
            switchCollection[index].isOn = currentStatusOfSwitches.statusOfSwitches[index]
        }
    }
}

// MARK: - InfoButton sends alert if some of swiches change his status
extension SettingsViewController {
    @IBAction func infoButtonPressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Caution!",
                                      message: "If you deselect  some source of logs on the settings page,"
                                        + " the logs may display incorrectly.", preferredStyle: .alert)
        
        let okAlert = UIAlertAction(title: "I understand", style: .default, handler: nil)
        
        alert.addAction(okAlert)
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - func for remember last status of switches
extension SettingsViewController {
    
    func findEnableSwitch() -> Array<Bool> {
        
        currentStatusOfSwitches.statusOfSwitches.removeAll()
        for switcher in switchCollection {
            currentStatusOfSwitches.statusOfSwitches.append(switcher.isOn)
        }
        return currentStatusOfSwitches.statusOfSwitches
    }
}

// MARK: - func sends alert, if disabeld switch (alert only for first action)
extension SettingsViewController {
    
    @IBAction func switchPressed(sender: UISwitch!) {
        if !sender.isOn {
            countOfAlert += 1
        }
        if countOfAlert == 1 {
            infoButtonPressed(infoButton)
        }
    }
}

// MARK: - back to previuos page and check switches status on correct
extension SettingsViewController {
    
    @IBAction func backButtonPressed(button: UIButton!) {
//  back to previous page
        dismiss(animated: true, completion: nil)
        
//  check switches status on correct
        if currentStatusOfSwitches.statusOfSwitches != findEnableSwitch() {
            currentStatusOfSwitches.statusOfSwitches.removeAll()
            currentStatusOfSwitches.statusOfSwitches = findEnableSwitch()
            logsOfViewController.arrayOfLogs.removeAll()
            logsOfViewController.arrayOfLogs.append("---Changes accepted---")
        }
    }
}
