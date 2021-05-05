//
//  WeatherDetailsViewController.swift
//  Lowe's
//
//  Created by Hin Wong on 4/30/21.
//

import UIKit

class WeatherDetailsViewController: UIViewController {
    
    @IBOutlet weak var weatherTempLabel: UILabel!
    @IBOutlet weak var feelsLikeTempLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    
    var detailsVM: WeatherDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateLabels()
        navigationItem.title = detailsVM.cityName()
        navigationController?.navigationBar.barTintColor = .purple
    }
    
    private func updateLabels() {
        weatherTempLabel.text = detailsVM?.temperature()
        feelsLikeTempLabel.text = detailsVM?.feelsLike()
        weatherTypeLabel.text = detailsVM?.weatherType()
        weatherDescriptionLabel.text = detailsVM?.weatherDescrption()
    }


}
