//
//  BaseUILabel.swift
//  DarkMode
//
//  Created by Umut Can Arduc on 9.10.2019.
//  Copyright © 2019 Umut Can Arduc. All rights reserved.
//

import UIKit

class BaseUILabel: UILabel, DarkModeAppliable {
    func changeDarkModeState(isEnabled: Bool) {
        themeMode(isDarkMode: isEnabled)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        themeMode(isDarkMode: UserDefaults.standard.bool(forKey: "isDarkMode"))
    }

    func themeMode(isDarkMode: Bool) {
        if isDarkMode {
            self.textColor = .white
        } else {
            self.textColor = .black
        }
    }
}
