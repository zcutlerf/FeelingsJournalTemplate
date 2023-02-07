//
//  ContentView.swift
//  FeelingsJournalTemplate
//
//  Created by Zoe Cutler on 2/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Text("List users' Entries here.")
            }
            .navigationTitle("Journal")
            .toolbar {
                feelingsMenu
            }
        }
    }
}

extension ContentView {
    var feelingsMenu: some View {
        Text("I'm feeling...")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
