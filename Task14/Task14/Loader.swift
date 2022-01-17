//
//  Loader.swift
//  Task14
//
//  Created by Егор Зайнуллин on 17.01.2022.
//

import Foundation
import Alamofire

class Loader {
    static func LoadTodayWeather(completion: @escaping (TodayResponse) -> Void) {
        let token = "7919aa47590713addd9411706f86b5d1"
        let cityName = "Saint Petersburg"
        let link = "api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(token)"
        AF.request(link).responseDecodable(of: TodayResponse.self) { response in
            if let data = response.value {
                debugPrint(data)
                completion(data)
            }
            else {
                debugPrint("error")
            }
        }
    }
}
