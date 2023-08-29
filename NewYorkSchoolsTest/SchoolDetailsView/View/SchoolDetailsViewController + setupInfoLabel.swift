//
//  SchoolDetailsViewController + setupInfoLabel.swift
//  20230518-BrandonSuarez-NYCSchools
//
//  Created by Brandon Suarez on 8/29/23.
//

import UIKit

extension SchoolDetailsViewController {
    // MARK: - Info Label
    
    func setUpInfoLabel() {
        // Adding to view
        view.addSubview(infoLabel)
        
        // Decorators
        infoLabel.text = "SAT Results"
        infoLabel.font = .systemFont(ofSize: 25, weight: .regular)
        infoLabel.textColor = Color.main
        
        // Constraints
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            infoLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            infoLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            infoLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}
