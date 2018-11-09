//
//  ViewController.swift
//  UpstackChallenge
//
//  Created by Ryan Bush on 11/9/18.
//  Copyright © 2018 Cold and Logical LLC. All rights reserved.
//

import UIKit

final class ViewController: UITableViewController {

        // MARK: - Instance Variables
        lazy var todos: [Todo] = [];

        // MARK: - View Hierarchy
        override func viewDidLoad() {
                super.viewDidLoad()
                // Do any additional setup after loading the view, typically from a nib.

                var todoService = TodosService();
                todoService.fetchTodos(completion: { todos in
                        self.todos = todos
                        DispatchQueue.main.async {
                                self.tableView.reloadData();
                        }
                });
        }
}

extension UIViewController: UITableViewDelegate {

}
