//
//  Persistance.swift
//  Task14
//
//  Created by Егор Зайнуллин on 15.01.2022.
//

import Foundation

class Persistence {
    private let kNameKey: String = "Persistance.kNameKey"
    
    private let kSursnameKey: String = "Persistance.kSursnameKey"
    
    static let shared = Persistence()
    
    var name: String {
        get { UserDefaults.standard.string(forKey: kNameKey) ?? "" }
        set { UserDefaults.standard.set(newValue, forKey: kNameKey) }
    }
   
    var sursname: String {
        get { UserDefaults.standard.string(forKey: kSursnameKey) ?? "" }
        set { UserDefaults.standard.set(newValue, forKey: kSursnameKey) }
    }
}
