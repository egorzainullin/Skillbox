//
//  FiveDayWeatherViewController.swift
//  Task14
//
//  Created by Егор Зайнуллин on 21.01.2022.
//

import UIKit
import RealmSwift

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
        initWeather()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Loader.LoadWeather(completion: { daysForecast
            in
            self.weatherArray = []
            for dayForecast in daysForecast {
                let dayWeather = DayWeather(temp: dayForecast.main.temp, weatherDescription: dayForecast.weather[0].main)
                self.weatherArray.append(dayWeather)
            }
            self.updateWeather()
        })
    }
    
    func updateWeather() {
        if !weatherArray.isEmpty {
            weather1Label.text = "\(weatherArray[0].temperature) K"
            weatherDescription1Label.text = weatherArray[0].weatherDescription
            weather2Label.text = "\(weatherArray[1].temperature) K"
            weatherDescription2Label.text = weatherArray[1].weatherDescription
            weather3Label.text = "\(weatherArray[2].temperature) K"
            weatherDescription3Label.text = weatherArray[2].weatherDescription
            weather4Label.text = "\(weatherArray[3].temperature) K"
            weatherDescription4Label.text = weatherArray[3].weatherDescription
            weather5Label.text = "\(weatherArray[4].temperature) K"
            weatherDescription5Label.text = weatherArray[4].weatherDescription
        }
    }
    
    let realm = try! Realm()
    
    func initWeather() {
        let objects = realm.objects(DayWeather.self)
        weatherArray = objects.map { $0 }
        updateWeather()
    }
}
