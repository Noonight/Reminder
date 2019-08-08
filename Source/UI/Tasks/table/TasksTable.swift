//
//  TasksTale.swift
//  Reminder
//
//  Created by ayur on 08.08.2019.
//  Copyright © 2019 ayur-team. All rights reserved.
//

import UIKit

final class TasksTable: NSObject {
    enum CellIdentifiers {
        static let cell = "cell_tasks_table"
    }

    var dataSource: [String] = []

    override init() { }

    init(dataSource: [String]) {
        self.dataSource = dataSource
    }

}

// MARK: EXTENSIONS

// MARK: TABLE DELEGATE

extension TasksTable: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: TABLE DATA SOURCE

extension TasksTable: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.cell, for: indexPath)

        return cell
    }

}
