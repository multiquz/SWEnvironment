//
//  PlanetDetailsViewController.swift
//  SWEnvironment
//
//  Created by user on 13.08.2022.
//

import UIKit

class PlanetDetailsViewController: UIViewController {

    var planet: Planet!
    
    @IBOutlet var rotationLabel: UILabel!
    @IBOutlet var diameterLabel: UILabel!
    @IBOutlet var climateLabel: UILabel!
    @IBOutlet var populatiionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = planet.name
        rotationLabel.text = "Rotation period is \(planet.rotation_period) standard hours"
        diameterLabel.text = "Planet diameter is \(planet.diameter) km"
        climateLabel.text = "Climate is characterized as \(planet.climate)"
        populatiionLabel.text = "Amount of inhabitants: \(planet.population)"
    }
    

}
