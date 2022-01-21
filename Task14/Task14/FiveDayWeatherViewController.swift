//
//  FiveDayWeatherViewController.swift
//  Task14
//
//  Created by Егор Зайнуллин on 21.01.2022.
//

import UIKit

class FiveDayWeatherViewController: UIViewController {

    @IBOutlet weak var weather1Label: UILabel!
    
    @IBOutlet weak var weatherDescription1Label: UILabel!
    
    @IBOutlet weak var weather2Label: UILabel!
    
    @IBOutlet weak var weatherDescription2Label: UILabel!
    
    @IBOutlet weak var weather3Label: UILabel!
    
    @IBOutlet weak var weatherDescription3Label: UILabel!
    
    @IBOutlet weak var weather4Label: UILabel!
    
    @IBOutlet weak var weatherDescription4Label: UILabel!
    
    @IBOutlet weak var weather5Label: UILabel!
    
    @IBOutlet weak var weatherDescription5Label: UILabel!
    
    var weatherArray: [DayWeather] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func updateWeather() {
        if !weatherArray.isEmpty {
            
        }
    }
}
