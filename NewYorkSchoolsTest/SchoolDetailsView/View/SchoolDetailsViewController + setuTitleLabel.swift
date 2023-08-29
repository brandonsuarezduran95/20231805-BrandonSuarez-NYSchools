//
//  SchoolDetailsViewController + setuTitleLabel.swift
//  20230518-BrandonSuarez-NYCSchools
//
//  Created by Brandon Suarez on 8/29/23.
//

import UIKit


// MARK: - SetUp Title Label
extension  SchoolDetailsViewController {
    
    func setUpTitleLabel() {
        
        // Adding the title Label to the View
        view.addSubview(titleLabel)
        
        // Decorators
        titleLabel.font = .systemFont(ofSize: 25, weight: .bold)
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.textColor = Color.main
        
        // Constraints
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            titleLabel.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
}

