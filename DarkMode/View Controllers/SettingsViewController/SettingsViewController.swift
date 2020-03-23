//
//  SettingsViewController.swift
//  DarkMode
//
//  Created by Umut Can Arduc on 9.10.2019.
//  Copyright © 2019 Umut Can Arduc. All rights reserved.
//

import UIKit

protocol DarkModeAppliable {
    func changeDarkModeState(isEnabled: Bool)
}

class SettingsViewController: BaseViewController {
    @IBOutlet weak var darkModeSwicth: UISwitch!
    
    var isDarkMode1: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.darkModeSwicth.isOn = UserDefaults.standard.bool(forKey: "isDarkMode")
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }

    @IBAction func darkModeSwicth(_ sender: UISwitch) {
        
        if sender.isOn {
            self.isDarkMode1 = true
        } else {
            self.isDarkMode1 = false
        }
        
        self.setDarkMode { () -> Void? in
            self.reloadInputViews()
        }
    }
    
    func setDarkMode(completionHandler: () -> Void?) {
        
        UserDefaults.standard.set(self.isDarkMode1, forKey: "isDarkMode")
        
        
        self.navigationController?.viewControllers.forEach({ [weak self] (viewController) in

            let vc = viewController as? DarkModeAppliable
            vc?.changeDarkModeState(isEnabled: self?.isDarkMode1 ?? false )
            
            let appliables = getDarkModeAppliables(view: viewController.view)
            
            for appliable in appliables {
                appliable.changeDarkModeState(isEnabled: self?.isDarkMode1 ?? false)
                
            }
        })
        
    }
    
    func getDarkModeAppliables(view: UIView) -> [DarkModeAppliable] {
        
        var results = [DarkModeAppliable]()
        
        for subview in view.subviews as [UIView] {
            if let appliable = subview as? DarkModeAppliable {
                results += [appliable]
            } else {
                results += getDarkModeAppliables(view: subview)
            }
        }
        return results
    }
}
