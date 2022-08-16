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
    
    init(heroData: [String : Any]) {
        name = heroData["name"] as? String ?? ""
        height = heroData["height"] as? String ?? ""
        mass = heroData["mass"] as? String ?? ""
        birth_year = heroData["birth_year"] as? String ?? ""
        homeworld = heroData["homeworld"] as? String ?? ""
    }
    
    static func getHeroes(from value: Any) -> [Hero] {
        guard let heroesData = value as? [[String : Any]] else { return [] }
        var heroes: [Hero] = []
        for heroData in heroesData {
            let hero = Hero(heroData: heroData)
            heroes.append(hero)
        }
        return heroes
    }
}

struct Planet: Decodable {
    let name: String
    let rotation_period: String
    let diameter: String
    let climate: String
    let population: String
    
    init(planetData: [String : Any]) {
        name = planetData["name"] as? String ?? ""
        rotation_period = planetData["rotation_period"] as? String ?? ""
        diameter = planetData["diameter"] as? String ?? ""
        climate = planetData["climate"] as? String ?? ""
        population = planetData["population"] as? String ?? ""
    }
    
    static func getPlanets(from value: Any) -> [Planet] {
        guard let planetsData = value as? [[String : Any]] else { return [] }
        return planetsData.compactMap { Planet(planetData: $0) }
    }
}
