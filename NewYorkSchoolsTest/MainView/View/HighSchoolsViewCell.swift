//
//  HighSchoolsViewCell.swift
//  NewYorkSchoolsTest
//
//  Created by Brandon Suarez on 5/18/23.
//

import Foundation
import UIKit

class HighSchoolCell: UITableViewCell {
    
    // Title Label
    let title = UILabel()
    // ArrowImage
    let arrowImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpTitle()
        setUpImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetUpTitle
    private func setUpTitle() {
        // Adding Title to the ContentView
        contentView.addSubview(title)
        
        // Decorators
        title.text = "Placeholder"
        title.font = .systemFont(ofSize: Constants.fontSize, weight: .light)
        title.lineBreakMode = .byClipping
        title.numberOfLines = Constants.numberOfLines
        
        // Constraints
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.verticalSpacing),
            title.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.horizontalSpacing),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.verticalSpacing),
            title.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.titleRightSpacing)
        ])
    }
    
    // MARK: - setUp Image
    
    private func setUpImage() {
        // Adding Image to the ContentView
        contentView.addSubview(arrowImage)
        
        // Decorators
        arrowImage.image = UIImage(systemName: "arrowtriangle.right.fill")
        arrowImage.tintColor = .black
        
        // Constraints
        arrowImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            arrowImage.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            arrowImage.heightAnchor.constraint(equalToConstant: Constants.imageHeight),
            arrowImage.leftAnchor.constraint(equalTo: title.rightAnchor, constant: Constants.horizontalSpacing),
            arrowImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.horizontalSpacing),
        ])
        
    }
    
    // MARK: - Configure Cell
    
    func configure(title: String) {
        self.title.text = title
    }
}

// MARK: - Constants

extension HighSchoolCell {
    private enum Constants {
        static let fontSize: CGFloat = 18.0
        static let numberOfLines: Int = 2
        static let verticalSpacing: CGFloat = 10
        static let horizontalSpacing: CGFloat = 10
        static let titleRightSpacing: CGFloat = 30
        static let imageHeight: CGFloat = 20
    }
}
