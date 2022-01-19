//
//  TodayWeatherViewController.swift
//  Task14
//
//  Created by Егор Зайнуллин on 17.01.2022.
//

import UIKit
import RealmSwift

class Weather: Decodable {
    @Persisted var temp: Double = 273
}

class WeatherDesription: Decodable {
    @Persisted var main: String = ""
}

class DayWeather {
    var temperature: Double
    
    var description: MTLAccelerationStructureTriangleGeometryDescriptor
    
    init(temp: Double, weatherDescription: String)
    {
        self.temperature = temp
        self.description = weatherDescription
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
            debugPrint(daysForecast[0].main.temp)
            for dayForecast in daysForecast {
                let dayWeather = DayWeather(temp: dayForecast.main.temp, weatherDescription: dayForecast.weather.main)
                self.weatherArray.append(dayWeather)
            }
        }
    }
  
}
