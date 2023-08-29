//
//  SchoolDetailsViewController + setuTitleLabel.swift
//  20230518-BrandonSuarez-NYCSchools
//
//  Created by Brandon Suarez on 8/29/23.
//

import UIKit


// MARK: - SetUp Title Label
extension  SchoolDetailsViewController {
    private enum Constants {
        static let numberOfLines = 2
        static let fontSize: CGFloat = 25.0
        static let verticalSpacing: CGFloat = 10
        static let horizontalSpacing: CGFloat = 10
        static let titleRightSpacing: CGFloat = 50
        static let titleHeight: CGFloat = 90
        
    }
    
    func setUpTitleLabel() {
        
        // Adding the title Label to the View
        view.addSubview(titleLabel)
        
        // Decorators
        titleLabel.font = .systemFont(ofSize: Constants.fontSize, weight: .bold)
        titleLabel.numberOfLines = Constants.numberOfLines
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.textColor = Color.main
        
        // Constraints
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.verticalSpacing),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.horizontalSpacing),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Constants.titleRightSpacing),
            titleLabel.heightAnchor.constraint(equalToConstant: Constants.titleHeight)
        ])
    }
}

