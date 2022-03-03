//
//  ContentView.swift
//  Realm ToDo-1
//
//  Created by Stewart Lynch on 2022-03-02.
//

import SwiftUI
import RealmSwift

struct ToDoListView: View {
    @ObservedResults(ToDo.self) var toDos
    @State private var name = ""
    @FocusState private var focus: Bool?
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("New ToDo", text: $name)
                        .focused($focus, equals: true)
                        .textFieldStyle(.roundedBorder)
                    Spacer()
                    Button {
                        let newToDo = ToDo(name: name)
                        $toDos.append(newToDo)
                        name = ""
                        focus = nil
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(name.isEmpty)
                }
                .padding()
                List() {
                    ForEach(toDos) { toDo in
                        Text(toDo.name)
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Realm ToDos")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
