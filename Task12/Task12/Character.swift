//
//  Character.swift
//  Task12
//
//  Created by Егор Зайнуллин on 10.01.2022.
//

import Foundation

struct Character: Decodable {
    var id: Int
    
    var name: String

    var status: String = ""

    var species: String = ""

    var type: String = ""

    var gender: String = ""

    var location: Location

    var image: String = ""

    var episode: [String] = []

    var url: String = ""

    var created: String = ""
}
