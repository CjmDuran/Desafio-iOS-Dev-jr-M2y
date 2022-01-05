//
//  APIservice.swift
//  Desafio DeviOS jr - M2y
//
//  Created by Carlos Duran on 29/12/21.
//

import Foundation

struct movieResult: Codable {
    let results: [Movie]
}


struct Movie: Codable {
    let poster_path: String
    let release_date: String
    let title: String
    let id: Int
    let vote_count: Double
    let popularity: Double
}


