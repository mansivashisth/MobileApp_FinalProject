//
//  MyToDo.swift
//  MyToDoApp
//
//  Created by Mansi Vashisth on 11/28/22.
//

import Foundation

struct MyToDo: Identifiable, Codable {
    var id: String = UUID().uuidString
    var item: String
    var completedTask: Bool = false
    
    static var sampleData: [MyToDo] {
        [
            MyToDo(item: "gardening"),
            MyToDo(item: "meditation",completedTask: true)
        ]
    }
}
