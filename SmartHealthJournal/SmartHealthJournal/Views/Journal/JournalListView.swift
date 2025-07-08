//
//  JournalListView.swift
//  SmartHealthJournal
//
//  Created by ambigavathi.d on 07/07/25.
//


import SwiftUI
import SwiftData

struct JournalListView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \JournalEntry.timestamp, order: .reverse) private var allEntries: [JournalEntry]
    
    @State private var selectedSentiment = "All"
    
    private let sentimentTabs = ["All", "Positive", "Negative", "Neutral"]
    
    var filteredEntries: [JournalEntry] {
        if selectedSentiment == "All" {
            return allEntries
        } else {
            return allEntries.filter {
                $0.sentiment.lowercased() == selectedSentiment.lowercased()
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                    // Sentiment filter tabs
                HStack {
                    ForEach(sentimentTabs, id: \.self) { sentiment in
                        Button(action: {
                            selectedSentiment = sentiment
                        }) {
                            Text(sentiment)
                                .fontWeight(selectedSentiment == sentiment ? .bold : .regular)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(
                                    Capsule().fill(selectedSentiment == sentiment ? Color.accentColor.opacity(0.2) : Color.clear)
                                )
                        }
                        .foregroundColor(.accentColor)
                    }
                }
                .padding(.top, 12)
                
                    // Journal Entries List
                List {
                    ForEach(filteredEntries) { entry in
                        NavigationLink(destination: EditJournalView(entry: entry)) {
                            VStack(alignment: .leading, spacing: 6) {
                                Text(entry.title)
                                    .font(.headline)
                                
                                Text(entry.text)
                                    .font(.subheadline)
                                    .lineLimit(2)
                                
                                HStack {
                                    Text("Sentiment: \(entry.sentiment.capitalized)")
                                        .font(.caption2)
                                        .foregroundColor(entry.sentiment.lowercased() == "positive" ? .green :
                                                            entry.sentiment.lowercased() == "negative" ? .red : .gray)
                                    
                                    Spacer()
                                    
                                    Text(entry.timestamp.formatted(date: .abbreviated, time: .shortened))
                                        .font(.caption2)
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("📝Journal")
            .toolbar {
                NavigationLink(destination: AddJournalView()) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: JournalEntry.self, configurations: config)
        let context = container.mainContext
        
        let mockEntries: [JournalEntry] = [
            JournalEntry(title: "Happy Day", text: "Had a great time with friends!", mood: "Positive", sentiment: "Positive"),
            JournalEntry(title: "Rough Start", text: "Woke up late and missed bus.", mood: "Negative", sentiment: "Negative"),
            JournalEntry(title: "Balanced", text: "Work was okay, cooked dinner", mood: "Neutral", sentiment: "Neutral"),
            JournalEntry(title: "Excited", text: "Looking forward to the weekend!", mood: "Positive", sentiment: "Positive")
        ]
        
        for entry in mockEntries {
            context.insert(entry)
        }
        
        return JournalListView().modelContainer(container)
    } catch {
        return Text("⚠️ Failed to preview: \(error.localizedDescription)")
    }
}


