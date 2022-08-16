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
    
    init(name: String, height: String, mass: String, birth_year: String, homeworld: String) {
        self.name = name
        self.height = height
        self.mass = mass
        self.birth_year = birth_year
        self.homeworld = homeworld
    }
    
    init(heroData: [String : Any]) {
        name = heroData["name"] as? String ?? ""
        height = heroData["height"] as? String ?? ""
        mass = heroData["mass"] as? String ?? ""
        birth_year = heroData["birth_year"] as? String ?? ""
        homeworld = heroData["homeworld"] as? String ?? ""
    }
    
    static func getHeroes(from value: Any) -> [Hero] {
        guard var heroesData = value as? [String : Any] else { return [] }

        let heroesReceived = heroesData.removeValue(forKey: "results")
        
        guard let heroesList = heroesReceived as? [[String : Any]] else { return [] }
        
        var heroes: [Hero] = []
        
        for heroData in heroesList {
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
    
    init(name: String, rotation_period: String, diameter: String, climate: String, population: String) {
        self.name = name
        self.rotation_period = rotation_period
        self.diameter = diameter
        self.climate = climate
        self.population = population
    }
    
    init(planetData: [String : Any]) {
        name = planetData["name"] as? String ?? ""
        rotation_period = planetData["rotation_period"] as? String ?? ""
        diameter = planetData["diameter"] as? String ?? ""
        climate = planetData["climate"] as? String ?? ""
        population = planetData["population"] as? String ?? ""
    }
    
    static func getPlanets(from value: Any) -> [Planet] {
        guard var planetsData = value as? [String : Any] else { return [] }

        let planetsReceived = planetsData.removeValue(forKey: "results")
        
        guard let planetsList = planetsReceived as? [[String : Any]] else { return [] }
        
        var planets: [Planet] = []
        
        for planetData in planetsList {
            let planet = Planet(planetData: planetData)
            planets.append(planet)
        }
    
        return planets
    }
}
