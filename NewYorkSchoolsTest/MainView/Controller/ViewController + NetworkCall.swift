//
//  ViewController + NetworkCall.swift
//  NewYorkSchoolsTest
//
//  Created by Brandon Suarez on 5/18/23.
//

import Foundation

extension ViewController {
    // Fetch NYC High School Data
    func fetchHighSchoolsData() {
        self.playAnimation()
        // Network Service
        NetworkService().fetchSchoolsData { result in
            switch result {
                // Success On fetching from API
            case .success( let schoolsData):
                DispatchQueue.main.async {
                    self.schoolsData = schoolsData
                    self.tableView.reloadData()
                }
                // Failure on fetching from API
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
    
    // Fetch Sat Results Data
    func fetchSatResultsData() {
        //Network Service
        NetworkService().fetchSatData { result in
            switch result {
                // Success On fetching from API
            case .success(let satData):
                DispatchQueue.global().async {
                    self.satResultsData = satData
                }
                // Failure on fetching from API
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
}
