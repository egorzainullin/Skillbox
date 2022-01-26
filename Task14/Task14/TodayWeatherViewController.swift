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

class DayWeather: Object {
    @Persisted var temperature: Double
    
    @Persisted var weatherDescription: String
    
    override init() {
        self.temperature = 0.0
        self.weatherDescription = ""
    }
    
    init(temp: Double, weatherDescription: String)
    {
        self.temperature = temp
        self.weatherDescription = weatherDescription
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
    
    @IBOutlet weak var weatherLabel: UILabel!
    
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    
    let realm = try! Realm()
    
    var weatherArray: [DayWeather] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initWeather()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Loader.LoadWeather { daysForecast
            in
            self.weatherArray = []
            for dayForecast in daysForecast {
                let dayWeather = DayWeather(temp: dayForecast.main.temp, weatherDescription: dayForecast.weather[0].main)
                self.weatherArray.append(dayWeather)
            }
            self.updateWeather()
        }
    }
    
    func updateWeather() {
        if !weatherArray.isEmpty {
            weatherLabel.text = "\(weatherArray[0].temperature) K"
            weatherDescriptionLabel.text = weatherArray[0].weatherDescription
            try! realm.write {
                for weather in weatherArray {
                    realm.add(weather)
                }
            }
        }
    }
    
    func initWeather() {
        let objects = realm.objects(DayWeather.self)
        weatherArray = objects.map {$0}
        updateWeather()
    }
}
