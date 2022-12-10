//
//  MyToDoListViewModel.swift
//  MyToDoApp
//
//  Created by Mansi Vashisth on 11/29/22.
//

import Foundation

class MyToDoViewModel: ObservableObject {
    @Published var item = " "
    @Published var completedTask = false
    var id: String?
    
    var updating: Bool {
        id != nil
    }
    
    var isDisabled: Bool {
        item.isEmpty
    }
    
    init() {}
    
    init(_ currentMyToDo:  MyToDo) {
        self.item = currentMyToDo.item
        self.completedTask = currentMyToDo.completedTask
        id = currentMyToDo.id
    }
}
