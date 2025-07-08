//
//  AddJournalView.swift
//  SmartHealthJournal
//
//  Created by ambigavathi.d on 07/07/25.
//

import SwiftUI
import SwiftData
import NaturalLanguage

struct AddJournalView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var title = ""
    @State private var text = ""
    @State private var mood = ""
    
    
    var body: some View {
        Form {
            TextField("Title (e.g. Today's Health Check-In)", text: $title)
            TextField("Mood (e.g. Happy, Tired, etc)", text: $mood)
            TextEditor(text: $text)
                .frame(height: 150)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray.opacity(0.5)))
            
            Button("Save Entry") {
                let predictedSentiment = analyzeSentiment(title: title, mood: mood, content: text)
                
                let entry = JournalEntry(
                    title: title,
                    text: text,
                    mood: mood,
                    sentiment: predictedSentiment
                )
                
                context.insert(entry)
                try? context.save()
                dismiss()
            }
            .disabled(title.isEmpty || text.isEmpty)
        }
        .navigationTitle("New Entry")
    }
            
}

