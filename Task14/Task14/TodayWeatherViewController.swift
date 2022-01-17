//
//  TodayWeatherViewController.swift
//  Task14
//
//  Created by Егор Зайнуллин on 17.01.2022.
//

import UIKit
import RealmSwift

class Weather: Object, Decodable {
    @Persisted var temp: Double = 273
}

class WeatherDesription: Object, Decodable {
    @Persisted var main: String = ""
}

class TodayResponse: Decodable {
    var main: Weather
    var weather: WeatherDesription
}

class TodayWeatherViewController: UIViewController {
    
    var weatherDescription: WeatherDesription = WeatherDesription()
    
    var weather: Weather = Weather()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    let realm = try! Realm()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Loader.LoadTodayWeather(completion: {
            response in
            self.weather = response.main
            self.weatherDescription = response.weather
            debugPrint(self.weather)
        })
    }
  
}
