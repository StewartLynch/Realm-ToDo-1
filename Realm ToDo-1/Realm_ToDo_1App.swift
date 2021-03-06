//
//  Realm_ToDo_1App.swift
//  Realm ToDo-1
//
//  Created by Stewart Lynch on 2022-03-02.
//

import SwiftUI

@main
struct Realm_ToDo_1App: App {
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .onAppear {
                    print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
                     UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                }
        }
    }
}
