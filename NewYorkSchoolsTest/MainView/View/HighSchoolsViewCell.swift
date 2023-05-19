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
        title.font = .systemFont(ofSize: 18, weight: .light)
        title.lineBreakMode = .byClipping
        title.numberOfLines = 2
        
        // Constraints
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            title.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            title.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30)
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
            arrowImage.heightAnchor.constraint(equalToConstant: 20),
            arrowImage.leftAnchor.constraint(equalTo: title.rightAnchor, constant: 10),
            arrowImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
        ])
        
    }
    
    // MARK: - Configure Cell
    
    func configure(title: String) {
        self.title.text = title
    }
}
