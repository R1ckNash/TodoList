//
//  SwipeTableViewController.swift
//  TodoList
//
//  Created by Илья Лясин
//

import UIKit
import SwipeCellKit

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {

    let appearance = UINavigationBarAppearance()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 100.0
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 0.97, green: 0.62, blue: 0.12, alpha: 1.00)
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance =
        navigationController?.navigationBar.standardAppearance

    }

    // MARK: - TableView DataSource Methods

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = (tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
                    as? SwipeTableViewCell)!

        cell.delegate = self
        return cell
    }

    func tableView(_ tableView: UITableView,
                   editActionsForRowAt indexPath: IndexPath,
                   for orientation: SwipeActionsOrientation) -> [SwipeAction]? {

        guard orientation == .right else { return nil }

        let deleteAction = SwipeAction(style: .default, title: "Delete") { _, indexPath in
            self.updateModel(at: indexPath)
        }

        deleteAction.image = UIImage(named: "trash-circle")
        deleteAction.textColor = .red
        deleteAction.backgroundColor = .white

        return [deleteAction]
    }

    func tableView(_ tableView: UITableView,
                   editActionsOptionsForRowAt indexPath: IndexPath,
                   for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructiveAfterFill
        return options
    }

    func updateModel(at indexPath: IndexPath) {}
}
