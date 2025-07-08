//
//  EditJournalView.swift
//  SmartHealthJournal
//
//  Created by ambigavathi.d on 07/07/25.
//

import SwiftUI
import SwiftData
import NaturalLanguage

struct EditJournalView: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable var entry: JournalEntry
    
    var body: some View {
        Form {
            Section(header: Text("Title")) {
                TextField("Title", text: $entry.title)
            }
            
            Section(header: Text("Your Mood (Optional)") ) {
                TextField("Describe Mood (e.g., Happy, Tired)", text: $entry.mood)
            }
            
            Section(header: Text("Entry")) {
                TextEditor(text: $entry.text)
                    .frame(height: 150)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray.opacity(0.3)))
            }
            
            Button("Update Entry") {
                    // Predict new sentiment based on edited content
                let newSentiment = analyzeSentiment(
                    title: entry.title,
                    mood: entry.mood,
                    content: entry.text
                )
                
                entry.sentiment = newSentiment                
                try? entry.modelContext?.save()
                dismiss()
            }
        }
        .navigationTitle("Edit Entry")
    }
}

#Preview {
    let entry = JournalEntry(
        title: "Preview",
        text: "Some text",
        mood: "Neutral",
        sentiment: "neutral"
    )
    
    return EditJournalView(entry: entry)
        .modelContainer(for: JournalEntry.self, inMemory: true)
}


