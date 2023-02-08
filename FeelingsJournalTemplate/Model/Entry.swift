//
//  Entry.swift
//  FeelingsJournalTemplate
//
//  Created by Zoe Cutler on 2/7/23.
//

import Foundation

/// The model for one particular Entry (or moment) that the user was feeling.
struct Entry: Identifiable, Codable {
    var id = UUID()
    var date: Date
    var feeling: Feeling
}
