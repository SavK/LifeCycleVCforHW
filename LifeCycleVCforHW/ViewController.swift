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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for button in self.allButtons {
            button.layer.cornerRadius = 15
            button.layer.borderWidth = 1
            button.layer.borderColor = button.tintColor.cgColor
        }
        
        for textFeild in self.allTextFeilds {
            textFeild.layer.cornerRadius = 15
            textFeild.layer.borderWidth = 1
            textFeild.layer.borderColor = textFeild.tintColor.cgColor
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.tintColor = view.backgroundColor
    }

}

