//
//  ViewController.swift
//  SWEnvironment
//
//  Created by user on 09.08.2022.
//

import UIKit

enum Link: String {
    case people = "https://swapi.dev/api/people"
    case planets = "https://swapi.dev/api/planets"
    case starships = "https://swapi.dev/api/starships"
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchPeople()
        
    }
    
    
    private func fetchPeople() {
        guard let url = URL(string: Link.people.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }

            do {
                let people = try JSONDecoder().decode(People.self, from: data)
                print(people)
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
}



