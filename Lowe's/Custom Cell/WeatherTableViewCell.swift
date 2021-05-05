//
//  WeatherTableViewCell.swift
//  Lowe's
//
//  Created by Hin Wong on 4/30/21.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var weatherConditionsLabel: UILabel!
    @IBOutlet weak var weatherTemperatureLabel: UILabel!
    
    var viewModel: ConditionCellViewModel? {
        didSet {
            weatherTemperatureLabel.text = viewModel?.temperature
            weatherConditionsLabel.text = viewModel?.condition
        }
    }
}
