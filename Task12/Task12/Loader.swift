//
//  Loader.swift
//  Task12
//
//  Created by Егор Зайнуллин on 10.01.2022.
//

import Foundation
import Alamofire

class Loader {
    static func loadCharacters(completion: @escaping ([Character]) -> Void) {
        let urlLink = "https://rickandmortyapi.com/api/character"
        AF.request(urlLink).responseDecodable(of: Page.self) { response in
            if let data = response.value {
                debugPrint(data)
            }
            else {
                debugPrint("error")
            }
        }
    }
}
   
