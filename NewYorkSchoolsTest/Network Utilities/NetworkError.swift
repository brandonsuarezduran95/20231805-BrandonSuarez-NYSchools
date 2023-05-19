//
//  NetworkError.swift
//  NewYorkSchoolsTest
//
//  Created by Brandon Suarez on 5/18/23.
//

import Foundation

enum NetworkError: String, Error {
    case decodingError = "Decoding Error"
    case badURL = "Bad URL"
    case badData = "Bad Data"
    case noData = "No Data"
}
