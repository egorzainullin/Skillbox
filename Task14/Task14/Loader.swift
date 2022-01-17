//
//  Loader.swift
//  Task14
//
//  Created by Егор Зайнуллин on 17.01.2022.
//

import Foundation
import Alamofire

class Loader {
    static func LoadTodayWeather(completion: @escaping ([DayResponse]) -> Void) {
        let token = "7919aa47590713addd9411706f86b5d1"
        let cityName = "London"
        let link = "api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(token)"
        let request = AF.request(link)
        debugPrint(request.response)
        AF.request(link).responseDecodable(of: Result.self) { response in
            if let data = response.value {
                debugPrint(data)
                // TODO: edit and add
                completion(data.list)
            }
            else {
                debugPrint("error")
            }
        }
    }
}
