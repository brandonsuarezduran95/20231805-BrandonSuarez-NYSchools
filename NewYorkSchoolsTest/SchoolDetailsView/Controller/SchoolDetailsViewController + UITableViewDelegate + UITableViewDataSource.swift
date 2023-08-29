//
//  SchoolDetailsViewController + UITableViewDelegate + UITableViewDataSource.swift
//  20230518-BrandonSuarez-NYCSchools
//
//  Created by Brandon Suarez on 8/29/23.
//

import UIKit

// MARK: - Delegate
extension SchoolDetailsViewController: UITableViewDelegate {
    
}

// MARK: - Data Source
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
