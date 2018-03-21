//
//  DataModel.swift
//  NetworkControlEncapsulation
//
//  Created by Appinventiv on 3/20/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import Foundation

struct DataModel
{
    var name : String
    var id : String
    var company : String
    var location : String
    init(name : String, id : String, company : String, location : String) {
        self.name = name
        self.id = id
        self.company = company
        self.location = location
    }
}
