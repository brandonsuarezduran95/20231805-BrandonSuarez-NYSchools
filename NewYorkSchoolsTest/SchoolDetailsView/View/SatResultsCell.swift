//
//  SatResultsCell.swift
//  NewYorkSchoolsTest
//
//  Created by Brandon Suarez on 5/18/23.
//

import UIKit

class SatResultsCell: UITableViewCell {
    
    // UI Elements
    private let resultImageView = UIView()
    private let titleLabel = UILabel()
    private let resultLabel = UILabel()
    
    // Result Type
    enum ResultType {
        case math, writing, reading
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpImageView()
        setUpTitleLabel()
        setUpResultLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetUp Result Image
    private func setUpImageView() {
        // adding to view hierarchy
        contentView.addSubview(resultImageView)
        
        // Decorators
        resultImageView.layer.cornerRadius = 10
        resultImageView.clipsToBounds = true
        resultImageView.backgroundColor = .lightGray
        
        // Constraint
        resultImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resultImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            resultImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            resultImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            resultImageView.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - SetUp Title Label
    private func setUpTitleLabel() {
        // adding to view hierarchy
        contentView.addSubview(titleLabel)
        
        // Decorators
        titleLabel.text = "PlaceHolder"
        titleLabel.font = .systemFont(ofSize: 20, weight: .regular)
        
        // Constraint
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leftAnchor.constraint(equalTo: resultImageView.rightAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    // MARK: - SetUp Result Label
    private func setUpResultLabel() {
        // adding to view hierarchy
        contentView.addSubview(resultLabel)
        
        // Decorators
        resultLabel.text = "PlaceHolder B"
        resultLabel.font = .systemFont(ofSize: 15, weight: .thin)
        
        // Constraint
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            resultLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            resultLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            resultLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    // MARK: Configure Cell
    
    func configure(imageName: String, result: String, title: String) {
        setImage(imageName: imageName)
        resultLabel.text = result
        titleLabel.text = title
    }
    
    private func setImage(imageName: String) {
        let image = UIImage(systemName: imageName)
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .white
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        resultImageView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: resultImageView.topAnchor, constant: 5),
            imageView.leftAnchor.constraint(equalTo: resultImageView.leftAnchor, constant: 5),
            imageView.rightAnchor.constraint(equalTo: resultImageView.rightAnchor, constant: -5),
            imageView.bottomAnchor.constraint(equalTo: resultImageView.bottomAnchor, constant: -5)
        ])
    }
}

