//
//  Page.swift
//  Task12
//
//  Created by Егор Зайнуллин on 11.01.2022.
//

import Foundation

class Info: Decodable {
    var count: String
    
    var pages: String
    
    var next: String?

    var prev: String?
}


class Page: Decodable {
    var info: Info
//    var results how to decode ????
}

