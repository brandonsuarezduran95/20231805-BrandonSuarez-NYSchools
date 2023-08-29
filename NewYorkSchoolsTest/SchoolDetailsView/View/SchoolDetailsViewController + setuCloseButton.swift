//
//  SchoolDetailsViewController + setuCloseButton.swift
//  20230518-BrandonSuarez-NYCSchools
//
//  Created by Brandon Suarez on 8/29/23.
//

import UIKit

extension SchoolDetailsViewController {
    // MARK: - SetUp Close Button
    
    func setUpCloseButton() {
        // Adding the Button to the View
        view.addSubview(closeButton)
        
        // Decorators
        closeButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        closeButton.contentVerticalAlignment = .fill
        closeButton.contentHorizontalAlignment = .fill
        closeButton.imageView?.contentMode = .scaleToFill
        closeButton.tintColor = .black
        closeButton.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
        
        // Constraints
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            closeButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            closeButton.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 10),
            closeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            closeButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    // Button Action
    
    @objc
    private func didTapCloseButton(_ sender: UIButton){
        self.dismiss(animated: true)
    }
}
