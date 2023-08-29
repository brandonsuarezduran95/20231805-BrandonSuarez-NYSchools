//
//  ViewController + setupTableView.swift
//  20230518-BrandonSuarez-NYCSchools
//
//  Created by Brandon Suarez on 8/29/23.
//

import UIKit

extension ViewController {
    // MARK: - SetUp TableView
    
    func setUpTableView() {
        // Adding TableView to the Subviews
        view.addSubview(tableView)
        
        // Delegates
        tableView.delegate = self
        tableView.dataSource = self
        
        // Decorators
        tableView.backgroundColor = Color.backGround
        
        // Registering the cell
        tableView.register(HighSchoolCell.self, forCellReuseIdentifier: "HighSchoolCell")
        
        // Constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
