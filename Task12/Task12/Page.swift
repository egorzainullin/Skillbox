//
//  Page.swift
//  Task12
//
//  Created by Егор Зайнуллин on 11.01.2022.
//

import Foundation

class Info: Decodable {
    
}

class Results: Decodable {
    var characters: [Character]
}

class Page: Decodable {
    var info: Info
    var results: [Character]
}

