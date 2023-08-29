//
//  ViewController + UITableViewDataSource + UITableViewDelegate.swift
//  20230518-BrandonSuarez-NYCSchools
//
//  Created by Brandon Suarez on 8/29/23.
//

import UIKit


// MARK: - Delegate
extension ViewController: UITableViewDelegate {
    
    // Header view
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerTitleLabel = UILabel()
        headerTitleLabel.text = "NYC Schools"
        headerTitleLabel.font = .systemFont(ofSize: 30, weight: .bold )
        headerTitleLabel.textColor = Color.main
        
        let containerView = UIView()
        containerView.backgroundColor = Color.backGround
        containerView.addSubview(headerTitleLabel)
        
        // headerTitleLabel Constraints
        headerTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            headerTitleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10),
            headerTitleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor,constant: -10),
            headerTitleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
        ])
        
        return containerView
    }
    
    // Selecting row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Creating the second ViewController
        let schoolDetailsViewController = SchoolDetailsViewController()
        schoolDetailsViewController.modalPresentationStyle = .fullScreen
        
        // School Name
        let schoolName = schoolsData[indexPath.row].schoolName
        
        // Passing the dbn corresponding data
        let currentDBN = schoolsData[indexPath.row].dbn
        schoolDetailsViewController.configureWith(data: satResultsData, dbn: currentDBN, schoolName: schoolName)
        
        // Presenting the Second View Controller
        self.present(schoolDetailsViewController, animated: true, completion: nil)
        
    }
}

// MARK: - DataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        schoolsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let school = schoolsData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighSchoolCell", for: indexPath) as! HighSchoolCell
        cell.selectionStyle = .none
        
        // Decorator for the color of the Cell
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .white
        } else {
            cell.backgroundColor = Color.backGround
        }
            
        cell.configure(title: school.schoolName)
        return cell
    }
}

