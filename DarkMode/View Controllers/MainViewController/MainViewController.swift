//
//  BaseViewController.swift
//  DarkMode
//
//  Created by Umut Can Arduc on 9.10.2019.
//  Copyright © 2019 Umut Can Arduc. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func goToDarkTapped(_ sender: Any) {
        self.navigationController?.pushViewController(SettingsViewController(), animated: true)
    }
    @IBAction func secondVCTapped(_ sender: Any) {
        self.navigationController?.pushViewController(SecondViewController(), animated: true)
    }
}
