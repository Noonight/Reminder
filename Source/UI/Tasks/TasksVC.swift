//
//  TasksVC.swift
//  Reminder
//
//  Created by ayur on 08.08.2019.
//  Copyright © 2019 ayur-team. All rights reserved.
//

import UIKit

final class TasksVC: UIViewController {
    enum Texts {
        static let title = "Tasks"
    }

    private var addItemNavBar: UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNavTitle()
        self.setupNavAddBtn()
        self.view.backgroundColor = .red
    }
}

// MARK: EXTENSIONS

// MARK: SETUP

private extension TasksVC {

    func setupNavTitle() {
        self.navigationItem.title = Texts.title
    }

    func setupNavAddBtn() {
        self.addItemNavBar = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onAddItemPressed(_:)))
        self.navigationItem.rightBarButtonItem = addItemNavBar
    }

}

// MARK: ACTIONS

private extension TasksVC {

    @objc func onAddItemPressed(_ sender: UIBarButtonItem) {
        self.showCreateTaskModal()
    }

}

// MARK: HELPERS

private extension TasksVC {
    
}

// MARK: NAVIGATION

private extension TasksVC {
    func showCreateTaskModal() {
        let createTaskVC = CreateTaskVC()
        createTaskVC.modalPresentationStyle = .currentContext
        self.present(createTaskVC, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3, execute: {
                createTaskVC.dismiss(animated: true, completion: nil)
            })
        }
    }
}
