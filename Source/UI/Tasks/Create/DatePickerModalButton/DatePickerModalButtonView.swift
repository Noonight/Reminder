//
//  DatePickerModalButtonView.swift
//  Reminder
//
//  Created by ayur on 14/11/2020.
//  Copyright © 2020 ayur-team. All rights reserved.
//

import UIKit

class DatePickerModalButtonView: UIView {
    private enum Sizes {
        static let fullHeight: CGFloat = 400
        static let lowHeight: CGFloat = 60
    }

    private let containerView: UIView = {
        var container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .gray
        return container
    }()
    private let button: UIButton = {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.text = "Choose Date"
        return btn
    }()
    private let datePicker: UIDatePicker = {
        var datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()

    var heightConstraint: NSLayoutConstraint!
    var choosedDate: Date = Date() {
        didSet {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd:MM:yyyy"
            button.titleLabel?.text = dateFormatter.string(from: choosedDate)
        }
    }
    var isOpened: Bool = false

    // MARK: SETUP

    private func setupView() {
        addSubview(containerView)
        NSLayoutConstraint.activate(
            [leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
             topAnchor.constraint(equalTo: containerView.topAnchor),
             trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
             bottomAnchor.constraint(equalTo: containerView.bottomAnchor)]
        )
        heightConstraint = containerView.heightAnchor.constraint(equalTo: heightAnchor)
        heightConstraint.isActive = true // height of the view
        heightConstraint.constant = Sizes.lowHeight

        containerView.addSubview(button)
        NSLayoutConstraint.activate(
            [containerView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: -8),
             containerView.topAnchor.constraint(equalTo: button.topAnchor, constant: -8),
             containerView.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: 8)]
        )
        containerView.addSubview(datePicker)
        NSLayoutConstraint.activate(
            [containerView.leadingAnchor.constraint(equalTo: datePicker.leadingAnchor),
             containerView.trailingAnchor.constraint(equalTo: datePicker.trailingAnchor)]
        )
        datePicker.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 8).isActive = true
    }

    private func setupBtn() {
        button.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
    }

    // MARK: ACTIONS

    @objc func btnClick(_ sender: UIButton) {
        if isOpened {
            isOpened.toggle()
            layoutIfNeeded()
            UIView.animate(withDuration: 0.2) {
                self.heightConstraint.constant = Sizes.lowHeight
                self.layoutIfNeeded()
            }
        } else {
            isOpened.toggle()
            layoutIfNeeded()
            UIView.animate(withDuration: 0.2) {
                self.heightConstraint.constant = Sizes.fullHeight
                self.layoutIfNeeded()
            }
        }
    }

    // MARK: BASE

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupBtn()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
