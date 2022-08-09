//
//  Model.swift
//  SWEnvironment
//
//  Created by user on 09.08.2022.
//

struct People: Decodable {
    let count: Double?
    let results: [Result]?
}

struct Result: Decodable {
    let name: String?
    let height: String?
    let mass: String?
    let birth_year: String?
    let homeworld: String?
}
