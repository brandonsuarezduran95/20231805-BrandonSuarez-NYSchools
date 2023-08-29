//
//  SchoolDetailsViewController + setupTableView.swift
//  20230518-BrandonSuarez-NYCSchools
//
//  Created by Brandon Suarez on 8/29/23.
//

import UIKit

extension SchoolDetailsViewController {
    // MARK: - SetUp tableView
    private enum Constants {
        static let rowHeigh: CGFloat = 90
        static let verticalSpacing: CGFloat = 10
        static let horizontalSpacing: CGFloat = 10
        
    }
    
    func setUpTableView() {
        // Adding to view hierarchy
        view.addSubview(tableView)
        
        // Decorators
        tableView.register(SatResultsCell.self, forCellReuseIdentifier: "SatResultsCell")
        tableView.rowHeight = Constants.rowHeigh
        
        // Delegates
        tableView.dataSource = self
        tableView.delegate = self
        
        // Constraint
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: Constants.verticalSpacing),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.horizontalSpacing),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Constants.horizontalSpacing),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
