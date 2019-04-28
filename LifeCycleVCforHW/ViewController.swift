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
    @IBOutlet var allTextFeilds: [UITextView]!
    
    let allViewControllerLogs = AllViewControllerLogs.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//  customize buttons
        for button in self.allButtons {
            button.layer.cornerRadius = 15
            button.layer.borderWidth = 1
            button.layer.borderColor = button.tintColor.cgColor
        }
        
//  customize textFeild
        for textFeild in self.allTextFeilds {
            textFeild.layer.cornerRadius = 15
            textFeild.layer.borderWidth = 1
            textFeild.layer.borderColor = textFeild.tintColor.cgColor
        }
        collectLogs()
        printLogs()
    }
//  func collect logs
    func collectLogs(_ message: String = "",
                   line: Int = #line,
                   function: String = #function) {
        
        let currentValue = ("\(title ?? "nil"): line \(line) of \(function) \(message)")
        allViewControllerLogs.arrayOfLogs.append(currentValue)
    }
    
    func printLogs() {
        
        for textView in allTextFeilds {

            textView.text = allViewControllerLogs.arrayOfLogs.joined(separator: "\n")
            
            let range = NSMakeRange(textView.text.count - 1, 0)
            textView.scrollRangeToVisible(range)
        }
    }
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        collectLogs()
        printLogs()
        
//  customize tabBar title collors
        self.tabBarController?.tabBar.tintColor = view.backgroundColor
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        collectLogs()
        printLogs()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        collectLogs()
        printLogs()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        collectLogs()
        printLogs()
    }
    
}

