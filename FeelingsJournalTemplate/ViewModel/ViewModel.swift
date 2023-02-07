//
//  EntryService.swift
//  FeelingsJournalTemplate
//
//  Created by Zoe Cutler on 2/7/23.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var entries: [Entry] = []
    
    /// Safely adds a new entry based on what the user is currently feeling.
    func addEntry(for feeling: Feeling) {
        
    }
    
    /// Writes feelings to the app's documents directory.
    func save() {
        
    }
    
    /// Gets the URL for the app's documents directory.
    private func archiveURL() throws -> URL {
        let documentsDirectory = try FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: false)
        return documentsDirectory.appendingPathComponent("entries", conformingTo: .propertyList)
    }
    
    /// Loads the saved entries from the app's documents directory.
    func load() {
        
    }
    
    func update(_ entry: Entry) {
        
    }
    
    private func indexForEntry(with id: Entry.ID) -> Int? {
        return nil
    }
}
