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
    
    let logsOfViewController = LogsOfViewController.shared
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
        // test if switch isOn
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
        
        //  date for logs
        let currentDate = DateFormatter.localizedString(from: Date(),
                                                        dateStyle: .none,
                                                        timeStyle: .medium)
        
        let currentValue = ("\(currentDate) \(title ?? "nil"):    line \(line) of \(function) \(message)")
        logsOfViewController.arrayOfLogs.append(currentValue)
    }
    //  func print logs
    func printLogs() {
        for textView in allTextViews {
            textView.text = logsOfViewController.arrayOfLogs.joined(separator: "\n")
            
            // let autoScroll to visible range
            let range = NSMakeRange(textView.text.count, 0)
            textView.scrollRangeToVisible(range)
        }
    }
}

// MARK: - func clear logs if necessary button pressed
extension ViewController {
    
    @IBAction func clearLogs(sender: UIButton!){
        
        logsOfViewController.arrayOfLogs.removeAll()
        logsOfViewController.arrayOfLogs.append("---Logs cleared---")
        printLogs()
    }
}

// MARK: - override functions for taking logs
extension ViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // check array for print last user action if it was
        if logsOfViewController.arrayOfLogs.count != 0  &&
            logsOfViewController.arrayOfLogs.count == 1 {
            printLogs()
        }
        
        // test if switch isOn
        if currentStatusOfSwitches.statusOfSwitches[1] == true {
            collectLogs()
            printLogs()
        }
        //  customize tabBar title collors
        self.tabBarController?.tabBar.tintColor = view.backgroundColor
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //  check array for print last user action if it was
        if  logsOfViewController.arrayOfLogs.last == "---Changes accepted---"{
            printLogs()
        }
        
        // test if switch isOn
        if currentStatusOfSwitches.statusOfSwitches[2] == true {
            collectLogs()
            printLogs()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // test if switch isOn
        if currentStatusOfSwitches.statusOfSwitches[3] == true {
            collectLogs()
            printLogs()
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // test if switch isOn
        if currentStatusOfSwitches.statusOfSwitches[4] == true {
            collectLogs()
            printLogs()
        }
    }
}

// MARK: - Navigation & Customization
extension ViewController {
    
    @IBAction override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationViewController = segue.destination as? SettingsViewController else { return }
        
        //  customize backgroundColor
        destinationViewController.self.view.backgroundColor = self.view.backgroundColor
        
        //  customize labels
        for label in destinationViewController.labelCollection {
            label.textColor = currentColor
        }
        //  customize buttons
        for button in destinationViewController.buttonCollection {
            button.tintColor = currentColor
        }
        //  customize switches
        for switcher in destinationViewController.switchCollection {
            switcher.onTintColor = currentColor
        }
    }
}
