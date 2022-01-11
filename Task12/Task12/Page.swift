//
//  Page.swift
//  Task12
//
//  Created by Егор Зайнуллин on 11.01.2022.
//

import Foundation

struct Info: Decodable {
    var count: String
    
    var pages: String
    
    var next: String?

    var prev: String?
}

struct Results: Decodable {
    var id: Int
}

struct Page: Decodable {
    var info: Info
    var results: [Results]
    // мой вариант такой был var results: [Character]
}

