//
//  ContentView.swift
//  MyToDoApp

// refereces 
//  Created by Mansi Vashisth on 11/28/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataStore: DataStore
    @State private var modalType: ModalType? = nil
    var body: some View {
        NavigationView {
            List() {
                ForEach(dataStore.myToDos) { myToDo in
                    Button{
                        modalType = .update(myToDo)
                    } label: {
                        Text(myToDo.item)
                            .font(.title3)
                            .strikethrough(myToDo.completedTask)
                            .foregroundColor(myToDo.completedTask ? .cyan : Color(.label))
                    }
                }
                .onDelete(perform: dataStore.deleteMyToDo)
            }
            .listStyle(InsetGroupedListStyle())
            .toolbar{
                ToolbarItem(placement: .principal){
                    Text("My Tasks To Do")
                        .font(.largeTitle)
                        .foregroundColor(.indigo)
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        modalType = .new
                    } label: {
                       Image(systemName: "plus.circle.fill")
                    }
                }
            }
        }
        .sheet(item: $modalType) { $0}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DataStore())
    }
}
