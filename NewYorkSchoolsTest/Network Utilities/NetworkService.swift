//
//  NetworkService.swift
//  NewYorkSchoolsTest
//
//  Created by Brandon Suarez on 5/18/23.
//

import Foundation

// The Network Service class will help fetching from both APIs
class NetworkService {
    // Fetch from the School API
    func fetchSchoolsData(completion: @escaping (Result<[School], NetworkError>) -> Void) {
        guard let url = URL(string: Url.highSchoolAddress) else {
            return completion(.failure(.badURL))
        }
        NetworkManager().fetchRequest(type: [School].self, url: url, completion: completion)
    }
    
    // Fetch from the SAT API
    func fetchSatData(completion: @escaping (Result<[SatResult], NetworkError>)-> Void) {
        guard let url = URL(string: Url.satResultsAddress) else {
            return completion(.failure(.badURL))
        }
        
        NetworkManager().fetchRequest(type: [SatResult].self, url: url, completion: completion)
    }
}
