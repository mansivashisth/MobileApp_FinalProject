//
//  MyToDoFormView.swift
//  MyToDoApp
//
//  Created by Mansi Vashisth on 11/30/22.
//

import SwiftUI

struct MyToDoFormView: View {
    
    @EnvironmentObject var dataStore: DataStore
    @ObservedObject var formVM: MyToDoViewModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            Form {
                VStack(alignment: .leading) {
                    TextField("MyToDo", text: $formVM.item)
                    Toggle("CompletedTask", isOn: $formVM.completedTask)
                }
            }
            .navigationTitle("MyTasksToDo")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: cancelButton, trailing: updateSaveButton)
        }
    }
}

extension MyToDoFormView {
    func updateMyToDo() {
        let myToDo = MyToDo(id: formVM.id!, item: formVM.item, completedTask: formVM.completedTask)
        dataStore.updateMyToDo(myToDo)
        presentationMode.wrappedValue.dismiss()
    }
    func addMyToDo() {
        let myToDo = MyToDo(item: formVM.item)
        dataStore.addMyToDo(myToDo)
        presentationMode.wrappedValue.dismiss()
    }
    
    var cancelButton: some View {
        Button("Cancel") {
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    var updateSaveButton: some View {
        Button( formVM.updating ? "Update":"Save", action: formVM.updating ?  updateMyToDo : addMyToDo)
            //.disabled(formVM.updating)
    }
}

struct MyToDoFormView_Previews: PreviewProvider {
    static var previews: some View {
        MyToDoFormView(formVM: MyToDoViewModel())
            .environmentObject(DataStore())
    }
}
