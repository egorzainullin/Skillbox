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

class DayWeather {
    var weather: Weather
    
    var weatherDescription: WeatherDesription
    
    init(weather: Weather, weatherDescription: WeatherDesription)
    {
        self.weather = weather
        self.weatherDescription = weatherDescription
    }
}

class DayResponse: Decodable {
    var main: Weather
    var weather: WeatherDesription
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
            for dayForecast in daysForecast {
                let dayWeather = DayWeather(weather: dayForecast.main, weatherDescription: dayForecast.weather)
                self.weatherArray.append(dayWeather)
            }
        }
    }
  
}
