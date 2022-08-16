//
//  PlanetsTableViewController.swift
//  SWEnvironment
//
//  Created by user on 13.08.2022.
//

import UIKit
import Alamofire

class PlanetsTableViewController: UITableViewController {
    
    private var planets: [Planet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   //     fetchPlanets()
        fetchPlanetsManually()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        planets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "planet") else { return UITableViewCell() }
        
        let planet = planets[indexPath.row]
        cell.textLabel?.text = planet.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let planet = planets[indexPath.row]
        performSegue(withIdentifier: "showPlanets", sender: planet)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let planetDetailsVC = segue.destination as? PlanetDetailsViewController else { return }
        planetDetailsVC.planet = sender as? Planet
    }
    
    
    private func fetchPlanets() {
        NetworkManager.shared.fetch(Planets.self, from: Link.planets.rawValue) { [weak self] result in
            switch result {
            case .success(let planets):
                self?.planets = planets.results
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
                self?.showAlert()
            }
        }
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "OOPS", message: "Something went wrong. Check debugger", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func fetchPlanetsManually() {
        AF.request(Link.planets.rawValue)
            .validate()
            .responseJSON { [weak self] dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    self?.planets = Planet.getPlanets(from: value)
                    self?.tableView.reloadData()
                case .failure(let error):
                    print(error)
                }

            }
    }
}
