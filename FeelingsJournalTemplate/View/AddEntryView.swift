//
//  AddEntryView.swift
//  FeelingsJournalTemplate
//
//  Created by Zoe Cutler on 2/8/23.
//

import SwiftUI

struct AddEntryView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var selectedFeeling: Feeling = Feeling.happy
    
    var body: some View {
        VStack {
            Form {
                Picker("I'm feeling...", selection: $selectedFeeling) {
                    ForEach(Feeling.allCases, id: \.rawValue) { feeling in
                        Text(feeling.rawValue)
                            .tag(feeling)
                    }
                }
            }
            
            Button {
                //TODO: Add action
            } label: {
                Text("Add")
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle("New Entry")
    }
}

struct AddEntryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddEntryView()
                .environmentObject(ViewModel())
        }
    }
}
