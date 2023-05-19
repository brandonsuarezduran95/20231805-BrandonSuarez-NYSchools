//
//  SchoolDetailsViewController.swift
//  NewYorkSchoolsTest
//
//  Created by Brandon Suarez on 5/18/23.
//

import UIKit

class SchoolDetailsViewController: UIViewController {
    
    // UI Elements
    let titleLabel = UILabel()
    let closeButton = UIButton(type: .custom)
    let infoLabel = UILabel()
    let tableView = UITableView()
    
    // Variables and Constants
    var satResultsData: [SatResult] = [] {
        didSet {
            print(satResultsData)
            print("data passed successfully")
        }
    }
    
    
    var currentDBNCode = "" {
        didSet {
            print("The current DBN is \(currentDBNCode)")
        }
    }
    
    var schoolName = ""
    
    // Results
    var mathResult: String = ""
    var writingResult: String = ""
    var readingResult: String = ""
    
    enum ImageName {
        static let math = "pencil.and.ruler.fill"
        static let writing = "pencil.line"
        static let reading = "book.closed"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.backGround
        setUpTitleLabel()
        setUpCloseButton()
        setUpInfoLabel()
        setUpTableView()
    }
    
    // MARK: - SetUp Title Label
    private func setUpTitleLabel() {
        
        // Adding the title Label to the View
        view.addSubview(titleLabel)
        
        // Decorators
        titleLabel.font = .systemFont(ofSize: 30, weight: .semibold)
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
    
    // MARK: - SetUp Close Button
    
    private func setUpCloseButton() {
        // Adding the Button to the View
        view.addSubview(closeButton)
        
        // Decorators
        closeButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
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
    
    // MARK: - Info Label
    
    private func setUpInfoLabel() {
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
    
    // MARK: - SetUp tableView
    
    private func setUpTableView() {
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
    
    // MARK: - Get SAT Data
    func configureWith(data: [SatResult], dbn: String, schoolName: String) {
        self.satResultsData = data
        self.currentDBNCode = dbn
        self.schoolName = schoolName
        sortSatResults()
    }
    
    // MARK: - Sorting the passed data
    private func sortSatResults() {
        let filteredResult = satResultsData.filter { result in
            
            if result.dbn == self.currentDBNCode {
                print("Found matching DBN: \(result.dbn)")
                return true
            }
            return false
        }

        setSchoolName()
        
        self.mathResult = filteredResult.first?.mathScore  ?? "N/A"
        self.writingResult = filteredResult.first?.writingScore ?? "N/A"
        self.readingResult = filteredResult.first?.readingScore ?? "N/A"
    }
    
    // MARK: - Setting School name
    private func setSchoolName() {
        self.titleLabel.text = self.schoolName
    }
}


extension SchoolDetailsViewController: UITableViewDelegate {
    
}


extension SchoolDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SatResultsCell", for: indexPath) as! SatResultsCell
        cell.selectionStyle = .none
        switch indexPath.row {
        case 0:
            cell.configure(imageName: ImageName.math, result: self.mathResult, title: "Math")
        case 1:
            cell.configure(imageName: ImageName.writing, result: self.writingResult, title: "Writting")
        case 2:
            cell.configure(imageName: ImageName.reading, result: self.readingResult, title: "Reading")
        default:
            break
        }
        return cell
    }
    
    
}
