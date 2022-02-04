//
//  TasksViewController.swift
//  Task4
//
//  Created by Егор Зайнуллин on 04.02.2022.
//

import UIKit
import Bond
import ReactiveKit

class TasksViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = TasksViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    private func bind() {
        viewModel.tasks.bind(to: tableView) {
            dataSource, indexPath, tableView in
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell") as! MainTableViewCell
            let element = dataSource[indexPath.row]
            cell.element = element
            cell.dateOfCreationLabel.text = element.dateOfCreation.description(with: Locale.current)
            cell.dateToDoLabel.text = element.dateToDo.description(with: Locale.current)
            cell.desriptionLabel.text = element.text
            return cell
        }
    }
}
