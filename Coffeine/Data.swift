//
//  Data.swift
//  Coffeine
//
//  Created by admin on 22.04.2020.
//  Copyright © 2020 Natali. All rights reserved.
//

import Foundation
import RealmSwift

class Data: Object {
    
    @objc dynamic var time = Date()
    @objc dynamic var gramPerCup: Int = 70
    //
}

