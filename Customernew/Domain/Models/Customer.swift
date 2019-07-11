//
//  Customer.swift
//  Customernew
//
//  Created by Jordan Capa on 7/11/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Customer {
    
    let name: String
    let surname: String
    let age: String
    let birthdate: String
    
    init(name: String, surname: String, age:String, birthdate:String) {
        self.name = name
        self.surname = surname
        self.age = age
        self.birthdate = birthdate
    }
    
    // Init for reading from Database snapshot
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
        surname = snapshotValue["surname"] as! String
        age = snapshotValue["age"] as! String
        birthdate = snapshotValue["birthdate"] as! String
    }
    
    // Func converting model for easier writing to database
    func toAnyObject() -> Any {
        return [
            "name": name,
            "surname": surname,
            "age": age,
            "birthdate": birthdate
        ]
    }
}
