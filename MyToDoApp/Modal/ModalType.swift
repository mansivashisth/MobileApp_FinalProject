//
//  ModalType.swift
//  MyToDoApp
//
//  Created by Mansi Vashisth on 11/30/22.
//

import SwiftUI

enum ModalType: Identifiable, View {
    case new
    case update(MyToDo)
    var id: String{
        switch self {
        case .new:
            return "new"
        case .update:
            return "update"
        }
    }
    
    var body: some View {
        switch self {
        case .new:
            return MyToDoFormView(formVM: MyToDoViewModel())
            
        case .update(let myToDo):
            return MyToDoFormView(formVM: MyToDoViewModel(myToDo))
        }
    }
    
}
