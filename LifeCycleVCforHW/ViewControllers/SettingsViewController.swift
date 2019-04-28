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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switchFinder(statusOfSwitches: currentStatusOfSwitches.statusOfSwitches)
    }
}

extension SettingsViewController {
    
    func switchFinder(statusOfSwitches: Array<Bool>) {
        
        let countOfStatus = currentStatusOfSwitches.statusOfSwitches.count - 1
        
        for index in 0...countOfStatus {
            switchCollection[index].isOn = currentStatusOfSwitches.statusOfSwitches[index]
        }
    }
}
extension SettingsViewController {
    @IBAction func infoButtonPressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Caution!",
                                      message:
            """
If you deselect print from some features on the settings page,
the logs may stop on some kind of view controller.
""",
                                      preferredStyle: .alert)
        
        let okAlert = UIAlertAction(title: "I understand", style: .default, handler: nil)
        
        alert.addAction(okAlert)
        present(alert, animated: true, completion: nil)
    }
}

extension SettingsViewController {
    
    func findEnableSwitch() -> Array<Bool> {
        
        currentStatusOfSwitches.statusOfSwitches.removeAll()
        for switcher in switchCollection {
            currentStatusOfSwitches.statusOfSwitches.append(switcher.isOn)
        }
        return currentStatusOfSwitches.statusOfSwitches
    }
}
