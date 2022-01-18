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

class DayResponse: Object, Decodable {
    @Persisted var main: Weather
    @Persisted var weather: WeatherDesription
}

class Result: Decodable {
    var list: [DayResponse] = []
}

class TodayWeatherViewController: UIViewController {
    
    var weatherArray: [DayResponse] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    let realm = try! Realm()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Loader.LoadTodayWeather(completion: { daysForecst
            in
            self.weatherArray = daysForecst
        })
    }
  
}
