//
//  FeelingsJournalTemplateApp.swift
//  FeelingsJournalTemplate
//
//  Created by Zoe Cutler on 2/7/23.
//

import SwiftUI

@main
struct FeelingsJournalTemplateApp: App {
    @StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
