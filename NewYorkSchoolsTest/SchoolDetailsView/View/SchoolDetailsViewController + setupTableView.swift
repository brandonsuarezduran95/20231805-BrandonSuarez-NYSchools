//
//  SchoolDetailsViewController + setupTableView.swift
//  20230518-BrandonSuarez-NYCSchools
//
//  Created by Brandon Suarez on 8/29/23.
//

import UIKit

extension SchoolDetailsViewController {
    // MARK: - SetUp tableView
    
    func setUpTableView() {
        // Adding to view hierarchy
        view.addSubview(tableView)
        
        // Decorators
        tableView.register(SatResultsCell.self, forCellReuseIdentifier: "SatResultsCell")
        tableView.rowHeight = 90
        
        // Delegates
        tableView.dataSource = self
        tableView.delegate = self
        
        // Constraint
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 10),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
