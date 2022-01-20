//
//  TodayWeatherViewController.swift
//  Task14
//
//  Created by Егор Зайнуллин on 17.01.2022.
//

import UIKit
import RealmSwift

class Weather: Decodable {
    var temp: Double = 273
}

class WeatherDescription: Decodable {
    var main: String = ""
}

class DayWeather {
    var temperature: Double
    
    var description: String
    
    var order = 0
    
    init(temp: Double, weatherDescription: String)
    {
        self.temperature = temp
        self.description = weatherDescription
    }
}

class DayResponse: Decodable {
    var main: Weather
    var weather: [WeatherDescription]
}

class Result: Decodable {
    var list: [DayResponse] = []
}

class TodayWeatherViewController: UIViewController {
    
    var weatherArray: [DayWeather] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    let realm = try! Realm()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Loader.LoadTodayWeather { daysForecast
            in
            self.weatherArray = []
            debugPrint(daysForecast[0].main.temp)
            for dayForecast in daysForecast {
                let dayWeather = DayWeather(temp: dayForecast.main.temp, weatherDescription: dayForecast.weather[0].main)
                self.weatherArray.append(dayWeather)
            }
        }
    }
  
}
