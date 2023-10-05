//
//  ParisSportifsApp.swift
//  ParisSportifs
//
//  Created by Achraf Ben Tekaya on 05/10/2023.
//

import SwiftUI

@main
struct ParisSportifsApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(homeVM: HomeViewModel())
        }
    }
}
