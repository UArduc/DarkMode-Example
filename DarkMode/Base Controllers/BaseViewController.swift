//
//  BaseViewController.swift
//  DarkMode
//
//  Created by Umut Can Arduc on 9.10.2019.
//  Copyright © 2019 Umut Can Arduc. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, DarkModeAppliable {
    func changeDarkModeState(isEnabled: Bool) {
        self.themeMode(isDarkMode: isEnabled)
    }
    
    var isDarkMode: Bool = false
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
        themeMode(isDarkMode: self.isDarkMode)
    }
    
    func themeMode(isDarkMode: Bool) {
        if isDarkMode {
            self.view.backgroundColor = .black
        } else {
            self.view.backgroundColor = .white
        }
    }
}
