//
//  Character.swift
//  Task12
//
//  Created by Егор Зайнуллин on 10.01.2022.
//

import Foundation

struct Character: Decodable {
    var id: String
    
    var name: String

    var status: String = ""

    var species: String = ""

    var type: String = ""

    var gender: String = ""

    var origin: String = ""

    var location: String = ""

    var image: String = ""

    var episode: [String] = []

    var url = ""

    var created = ""
}
