//
//  DataStore.swift
//  MyToDoApp
//
//  Created by Mansi Vashisth on 11/28/22.
//

import Foundation

class DataStore: ObservableObject {
    @Published var myToDos:[MyToDo] = []
    
    init(){
        print(FileManager.docDirURL.path)
        if FileManager().docExist(named: fileName){
            loadMyToDos()
        }
    }
    
    func addMyToDo(_ myToDo: MyToDo){
        myToDos.append(myToDo)
        saveMyToDo()
    }
    func updateMyToDo(_ myToDo: MyToDo){
        guard let index = myToDos.firstIndex(where: {$0.id == myToDo.id}) else { return }
        myToDos[index] = myToDo
        saveMyToDo()
    }
    func deleteMyToDo(at indexSet: IndexSet){
        myToDos.remove(atOffsets: indexSet)
        saveMyToDo()
    }
    func loadMyToDos(){
        FileManager().readDocument(docName: fileName) { (result) in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    myToDos = try decoder.decode([MyToDo].self, from: data)
                } catch {
                    print(error.localizedDescription)
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    func saveMyToDo(){
        print("save items to system")
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(myToDos)
            let jsonString = String(decoding: data, as: UTF8.self)
            FileManager().saveDocument(contents: jsonString, docName : fileName) { (error) in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
