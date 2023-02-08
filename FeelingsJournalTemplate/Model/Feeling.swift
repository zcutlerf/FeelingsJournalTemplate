//
//  Feeling.swift
//  FeelingsJournalTemplate
//
//  Created by Zoe Cutler on 2/7/23.
//

import Foundation

/// An enum that defines the feelings available to our users.
enum Feeling: String, CaseIterable {
    case happy = "Happy"
    case sad = "Sad"
    case angry = "Angry"
    case itsComplicated = "It's Complicated"
    
    var emoji: String {
        switch self {
        case .happy:
            return "😍"
        case .sad:
            return "😭"
        case .angry:
            return "😡"
        case .itsComplicated:
            return "⁉️"
        }
    }
}
