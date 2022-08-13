//
//  HeroesTableViewController.swift
//  SWEnvironment
//
//  Created by user on 13.08.2022.
//

import UIKit

class HeroesTableViewController: UITableViewController {
    
    private var heroes: [Hero] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
      fetchHeroes()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        heroes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "hero") else { return UITableViewCell() }
        
        let hero = heroes[indexPath.row]
        cell.textLabel?.text = hero.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let hero = heroes[indexPath.row]
        performSegue(withIdentifier: "showHeroes", sender: hero)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let heroDetailcVC = segue.destination as? HeroDetailsViewController else { return }
        heroDetailcVC.hero = sender as? Hero
    }
    
    private func fetchHeroes() {
        NetworkManager.shared.fetch(Heroes.self, from: Link.heroes.rawValue) { [weak self] result in
            switch result {
            case .success(let heroes):
                self?.heroes = heroes.results
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
    
}
