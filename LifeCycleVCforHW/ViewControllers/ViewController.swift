//
//  ViewController.swift
//  LifeCycleVCforHW
//
//  Created by Savonevich Constantine on 4/27/19.
//  Copyright © 2019 Savonevich Konstantin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var allButtons: [UIButton]!
    @IBOutlet var allTextViews: [UITextView]!
    
    let allViewControllerLogs = AllViewControllerLogs.shared
    var currentColor: UIColor?
    let currentStatusOfSwitches = CurrentStatusOfSwitches.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  customize buttons
        for button in self.allButtons {
            button.layer.cornerRadius = 15
            button.layer.borderWidth = 1
            button.layer.borderColor = button.tintColor.cgColor
            currentColor = button.tintColor
        }
        
        //  customize textView
        for textView in self.allTextViews {
            textView.layer.cornerRadius = 15
            textView.layer.borderWidth = 1
            textView.layer.borderColor = textView.tintColor.cgColor
        }
        
        if currentStatusOfSwitches.statusOfSwitches[0] == true {
            collectLogs()
            printLogs()
        }
    }
}

// MARK: - functions fof taking and print logs
extension ViewController {
    //  func collect logs
    func collectLogs(_ message: String = "",
                     line: Int = #line,
                     function: String = #function) {
        
        let currentValue = ("\(title ?? "nil"): line \(line) of \(function) \(message) at: \(Date.init())")
        allViewControllerLogs.arrayOfLogs.append(currentValue)
    }
    //  func print logs
    func printLogs() {
        for textView in allTextViews {
            textView.text = allViewControllerLogs.arrayOfLogs.joined(separator: "\n")
            
            let range = NSMakeRange(textView.text.count - 1, 0)
            textView.scrollRangeToVisible(range)
        }
    }
}

extension ViewController {
    
    @IBAction func clearLogs(sender: UIButton!){
        
        allViewControllerLogs.arrayOfLogs.removeAll()
        allViewControllerLogs.arrayOfLogs.append("---Logs cleared---")
        printLogs()
    }
}

// MARK: - override functions for taking logs
extension ViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if allViewControllerLogs.arrayOfLogs.count != 0  &&
            allViewControllerLogs.arrayOfLogs.count == 1 {
            printLogs()
        }
        
        if currentStatusOfSwitches.statusOfSwitches[1] == true {
            collectLogs()
            printLogs()
        }
        //  customize tabBar title collors
        self.tabBarController?.tabBar.tintColor = view.backgroundColor
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if currentStatusOfSwitches.statusOfSwitches[2] == true {
            collectLogs()
            printLogs()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if currentStatusOfSwitches.statusOfSwitches[3] == true {
            collectLogs()
            printLogs()
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if currentStatusOfSwitches.statusOfSwitches[4] == true {
            collectLogs()
            printLogs()
        }
    }
}

extension ViewController {
    
    @IBAction override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationViewController = segue.destination as? SettingsViewController else { return }
        destinationViewController.self.view.backgroundColor = self.view.backgroundColor
        for label in destinationViewController.labelCollection {
            label.textColor = currentColor
        }
        
        for button in destinationViewController.buttonCollection {
            button.tintColor = currentColor
        }
        
        for switcher in destinationViewController.switchCollection {
            switcher.onTintColor = currentColor
        }
        
    }
    
    @IBAction func unwindToMainScreen(for unwindSegue: UIStoryboardSegue) {
        
        guard let sourceViewController = unwindSegue.source as? SettingsViewController
            else {return }
 
        if currentStatusOfSwitches.statusOfSwitches != sourceViewController.findEnableSwitch() {
        
        currentStatusOfSwitches.statusOfSwitches.removeAll()
        currentStatusOfSwitches.statusOfSwitches = sourceViewController.findEnableSwitch()
        allViewControllerLogs.arrayOfLogs.removeAll()
        allViewControllerLogs.arrayOfLogs.append("---Changes accepted---")
        printLogs()
        }
    }
}
