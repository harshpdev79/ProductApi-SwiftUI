//
//  ProductApi_SwiftUIApp.swift
//  ProductApi SwiftUI
//
//  Created by Harsh Prajapat on 05/07/24.
//

import SwiftUI

@main
struct ProductApi_SwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ProductView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
