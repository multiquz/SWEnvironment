//
//  Model.swift
//  SWEnvironment
//
//  Created by user on 09.08.2022.
//

struct Heroes: Decodable {
    let count: Double
    let results: [Hero]
}

struct Planets: Decodable {
    let count: Double
    let results: [Planet]
}

struct Hero: Decodable {
    let name: String
    let height: String
    let mass: String
    let birth_year: String
    let homeworld: String
}

struct Planet: Decodable {
    let name: String
    let rotation_period: String
    let diameter: String
    let climate: String
    let population: String
}
