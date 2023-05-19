//
//  School.swift
//  NewYorkSchoolsTest
//
//  Created by Brandon Suarez on 5/18/23.
//

import Foundation

struct School: Codable, Hashable {
    let dbn: String
    let schoolName: String
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
    }
}
