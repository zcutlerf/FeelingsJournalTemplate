//
//  ContentView.swift
//  FeelingsJournalTemplate
//
//  Created by Zoe Cutler on 2/7/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var isShowingAddEntrySheet = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.entries) { entry in
                    HStack {
                        Text(entry.feeling.emoji)
                            .font(.largeTitle)
                        
                        VStack(alignment: .leading) {
                            Text("I was \(entry.feeling.rawValue)")
                                .fontWeight(.semibold)
                            Text("on \(entry.date.formatted(date: .abbreviated, time: .shortened))")
                        }
                    }
                }
            }
            .navigationTitle("Journal")
            .toolbar {
                feelingsToolbarItem
            }
            .sheet(isPresented: $isShowingAddEntrySheet) {
                AddEntryView()
            }
        }
    }
}

extension ContentView {
    var feelingsToolbarItem: some ToolbarContent {
        ToolbarItem {
            Button {
                isShowingAddEntrySheet.toggle()
            } label: {
                Label("I'm feeling...", systemImage: "plus")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
