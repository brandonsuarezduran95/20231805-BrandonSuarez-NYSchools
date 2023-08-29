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
        resultImageView.layer.cornerRadius = Constants.cornerRadius
        resultImageView.clipsToBounds = true
        resultImageView.backgroundColor = .lightGray
        
        // Constraint
        resultImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resultImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.verticalSpacing),
            resultImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            resultImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.verticalSpacing),
            resultImageView.widthAnchor.constraint(equalToConstant: Constants.imageWidth)
        ])
    }
    
    // MARK: - SetUp Title Label
    private func setUpTitleLabel() {
        // adding to view hierarchy
        contentView.addSubview(titleLabel)
        
        // Decorators
        titleLabel.text = "PlaceHolder"
        titleLabel.font = .systemFont(ofSize: Constants.titleLabelFont, weight: .regular)
        
        // Constraint
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.verticalSpacing),
            titleLabel.leftAnchor.constraint(equalTo: resultImageView.rightAnchor, constant: Constants.horizontalSpacing),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: Constants.titleLabelHeight)
        ])
    }
    
    // MARK: - SetUp Result Label
    private func setUpResultLabel() {
        // adding to view hierarchy
        contentView.addSubview(resultLabel)
        
        // Decorators
        resultLabel.text = "PlaceHolder B"
        resultLabel.font = .systemFont(ofSize: Constants.resultLabelFontSize, weight: .thin)
        
        // Constraint
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.resultLabelTopSpacing),
            resultLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            resultLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            resultLabel.heightAnchor.constraint(equalToConstant: Constants.titleLabelHeight)
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
            imageView.topAnchor.constraint(equalTo: resultImageView.topAnchor, constant: Constants.imageHorizontalSpacing),
            imageView.leftAnchor.constraint(equalTo: resultImageView.leftAnchor, constant: Constants.imageVerticalSpacing),
            imageView.rightAnchor.constraint(equalTo: resultImageView.rightAnchor, constant: -Constants.imageVerticalSpacing),
            imageView.bottomAnchor.constraint(equalTo: resultImageView.bottomAnchor, constant: -Constants.imageHorizontalSpacing)
        ])
    }
}

// MARK: Constants
extension SatResultsCell {
    private enum Constants {
        static let cornerRadius: CGFloat = 10
        static let verticalSpacing: CGFloat = 20
        static let horizontalSpacing: CGFloat = 20
        
        static let imageWidth: CGFloat = 50
        
        static let titleLabelFont: CGFloat = 20
        static let titleLabelHeight: CGFloat = 20
        
        static let resultLabelFontSize: CGFloat = 15
        static let resultLabelTopSpacing: CGFloat = 10
        
        static let imageVerticalSpacing: CGFloat = 5
        static let imageHorizontalSpacing: CGFloat = 5
        
    }
}
