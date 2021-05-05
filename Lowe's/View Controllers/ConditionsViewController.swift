//
//  ConditionsViewController.swift
//  Lowe's
//
//  Created by Hin Wong on 4/30/21.
//

import UIKit

class ConditionsViewController: UIViewController {

    @IBOutlet weak var weatherConditionsTable: UITableView!
    
    var conditionsVM: ConditionsViewModel?
    var cellVM: WeatherTableViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherConditionsTable.dataSource = self
        weatherConditionsTable.delegate = self
        weatherConditionsTable.rowHeight = 100
        navigationController?.navigationBar.barTintColor = .purple
    }


}

extension ConditionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conditionsVM?.getNumberOfTemperatures() ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = weatherConditionsTable.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherTableViewCell else { return UITableViewCell() }
        let detailsVM = conditionsVM?.getWeatherViewModel(indexPath: indexPath)
        cell.viewModel = detailsVM
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "WeatherDetailsVC") as? WeatherDetailsViewController {
            
            let detailsVM = WeatherDetailsViewModel(
                weather: (self.conditionsVM?.getWeathersAt(indexPath: indexPath))!,
                city: (conditionsVM?.getCity())!,
                main: (conditionsVM?.getMainAt(indexPath: indexPath))!)
            vc.detailsVM = detailsVM
            self.navigationController?.pushViewController(vc, animated: true)
        }
        

        
    }
}
