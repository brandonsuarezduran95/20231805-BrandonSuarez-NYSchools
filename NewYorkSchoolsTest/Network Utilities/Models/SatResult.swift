//
//  SatResult.swift
//  NewYorkSchoolsTest
//
//  Created by Brandon Suarez on 5/18/23.
//

import Foundation

struct SatResult: Codable {
    
    // Mapping
    let dbn: String
    let schoolName: String
    let testTakers: String
    let readingScore: String
    let mathScore: String
    let writingScore: String
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case testTakers = "num_of_sat_test_takers"
        case readingScore = "sat_critical_reading_avg_score"
        case mathScore = "sat_math_avg_score"
        case writingScore = "sat_writing_avg_score"
    }

}


