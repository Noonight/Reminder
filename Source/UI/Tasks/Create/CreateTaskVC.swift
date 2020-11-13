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
        static let doneNavBtn = "Done"
    }

    private var viewModel = CreateTaskVM()

    private let containerView: UIView = {
        var container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .yellow
        return container
    }()
    private var doneItemNavBar: UIBarButtonItem!
    private let taskTitleTF: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Title"
        textField.borderStyle = .roundedRect
        return textField
    }()
    private let datePickerButton: DatePickerModalButtonView = {
        var datePickerBtn = DatePickerModalButtonView()
        datePickerBtn.translatesAutoresizingMaskIntoConstraints = false
        return datePickerBtn
    }()
    private let taskDateDP: UIDatePicker = {
        var datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    private let taskDescriptionTV: UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNavTitle()
        self.setupNavDoneBtn()
        self.setupView()
        self.view.backgroundColor = .white

    }

    private func setupView() {
        view.addSubview(containerView)
        NSLayoutConstraint.activate(
            [view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
             view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: containerView.topAnchor),
             view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
             view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)]
        )

        containerView.addSubview(taskTitleTF)
        NSLayoutConstraint.activate(
            [containerView.leadingAnchor.constraint(equalTo: taskTitleTF.leadingAnchor, constant: -8),
             containerView.topAnchor.constraint(equalTo: taskTitleTF.topAnchor, constant: -8),
             containerView.trailingAnchor.constraint(equalTo: taskTitleTF.trailingAnchor, constant: 8)]
        )

//        containerView.addSubview(taskDateDP)
//        NSLayoutConstraint.activate(
//            [containerView.leadingAnchor.constraint(equalTo: taskDateDP.leadingAnchor, constant: -8),
//             containerView.trailingAnchor.constraint(equalTo: taskDateDP.trailingAnchor, constant: -8)]
//        )
//        taskDateDP.topAnchor.constraint(equalTo: taskTitleTF.bottomAnchor, constant: 8).isActive = true

        containerView.addSubview(datePickerButton)
        NSLayoutConstraint.activate(
            [containerView.leadingAnchor.constraint(equalTo: datePickerButton.leadingAnchor, constant: -8),
             containerView.trailingAnchor.constraint(equalTo: datePickerButton.trailingAnchor, constant: -8)]
        )
        datePickerButton.topAnchor.constraint(equalTo: taskTitleTF.bottomAnchor, constant: 8).isActive = true

        containerView.addSubview(taskDescriptionTV)
        NSLayoutConstraint.activate(
            [containerView.leadingAnchor.constraint(equalTo: taskDescriptionTV.leadingAnchor, constant: -8),
             containerView.trailingAnchor.constraint(equalTo: taskDescriptionTV.trailingAnchor, constant: -8)]
        )
        taskDescriptionTV.topAnchor.constraint(equalTo: datePickerButton.bottomAnchor, constant: 8).isActive = true
        taskDescriptionTV.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 8).isActive = true
    }
}

// MARK: EXTENSIONS

// MARK: SETUP

private extension CreateTaskVC {
    
    func setupNavTitle() {
        self.navigationItem.title = Texts.title
    }

    func setupNavDoneBtn() {
        self.doneItemNavBar = UIBarButtonItem(title: Texts.doneNavBtn, style: .done, target: self, action: #selector(onDoneItemPressed(_:)))
//        self.doneItemNavBar.action = #selector(onDoneItemPressed(_:))
        self.navigationItem.rightBarButtonItem = doneItemNavBar
    }
}

// MARK: ACTIONS

private extension CreateTaskVC {
    @objc func onDoneItemPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
        print("Dismiss the window")
    }
}
