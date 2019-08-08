//
//  CreateTaskVC.swift
//  Reminder
//
//  Created by ayur on 08.08.2019.
//  Copyright © 2019 ayur-team. All rights reserved.
//

import UIKit

final class CreateTaskVC: UIViewController {
    private enum Texts {
        static let title = "Create Task"
    }
    
    private var viewModel = CreateTaskVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavTitle()
        self.view.backgroundColor = .cyan
    }
}

// MARK: EXTENSIONS

// MARK: SETUP

extension CreateTaskVC {
    
    private func setupNavTitle() {
        self.navigationItem.title = Texts.title
    }
    
}
