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
        let token = ""
        let link = "http://api.openweathermap.org/data/2.5/forecast?id=524901&lang=ru&appid=\(token)"
        let request = AF.request(link)
        debugPrint(request.response) // почему response nil
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
