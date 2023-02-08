//
//  EntryDetailView.swift
//  FeelingsJournalTemplate
//
//  Created by Zoe Cutler on 2/7/23.
//

import SwiftUI

struct EntryDetailView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct EntryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EntryDetailView()
            .environmentObject(ViewModel())
    }
}
