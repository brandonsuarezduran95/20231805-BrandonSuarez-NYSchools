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
