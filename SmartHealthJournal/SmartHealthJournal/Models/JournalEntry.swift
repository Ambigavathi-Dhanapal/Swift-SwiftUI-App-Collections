//
//  JournalEntry.swift
//  SmartHealthJournal
//
//  Created by ambigavathi.d on 07/07/25.
//

import Foundation
import SwiftData

@Model
class JournalEntry {
    var title: String
    var text: String
    var mood: String
    var sentiment: String
    var timestamp: Date
    
    init(title: String, text: String, mood: String, sentiment: String, timestamp: Date = .now) {
        self.title = title
        self.text = text
        self.mood = mood
        self.sentiment = sentiment
        self.timestamp = timestamp
    }
}

