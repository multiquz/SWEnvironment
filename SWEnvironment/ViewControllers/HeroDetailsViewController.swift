//
//  HeroDetailsViewController.swift
//  SWEnvironment
//
//  Created by user on 13.08.2022.
//

import UIKit

class HeroDetailsViewController: UIViewController {

    var hero: Hero!
    
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var massLabel: UILabel!
    @IBOutlet var birthYearLabel: UILabel!
    @IBOutlet var homeworldLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = hero.name
        heightLabel.text = "Height is \(hero.height) cm"
        massLabel.text = "Mass is \(hero.mass) kg"
        birthYearLabel.text = "Was born in \(hero.birth_year)"
        homeworldLabel.text = "You can look homeworld info at \(hero.homeworld)"
        
    }
   
}
