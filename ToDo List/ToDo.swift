//
//  ToDo.swift
//  ToDo List
//
//  Created by Alan Tran on 7/1/20.
//  Copyright © 2020 Protoalpha. All rights reserved.
//

import Foundation

struct ToDo {
    var name: String
    var isOn: Bool

    init(name: String, isOn: Bool = false) {
        self.name = name
        self.isOn = isOn
    }
}
