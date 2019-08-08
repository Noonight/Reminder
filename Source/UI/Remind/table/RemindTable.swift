//
//  RemindTable.swift
//  Reminder
//
//  Created by ayur on 07.08.2019.
//  Copyright © 2019 ayur-team. All rights reserved.
//

import UIKit

final class RemindTable: NSObject {
    enum CellIdentifiers {
        static let cell = "cell_remind_table"
    }

    var dataSource: [String] = []

    override init() { }

    init(dataSource: [String]) {
        self.dataSource = dataSource
    }

}

// MARK: EXTENSIONS

// MARK: DELEGATE

extension RemindTable: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: DATA SOURCE

extension RemindTable: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.cell, for: indexPath)

        return cell
    }

}
