//
//  MoodCalendarView.swift
//  SmartHealthJournal
//
//  Created by ambigavathi.d on 07/07/25.
//

import SwiftUI
import SwiftData

struct MoodCalendarView: View {
    @Query var entries: [JournalEntry]
    
    var entriesByDay: [Date: JournalEntry] {
        Dictionary(grouping: entries) {
            Calendar.current.startOfDay(for: $0.timestamp)
        }
        .mapValues { $0.last! } // use last entry of the day
    }
    
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(datesForPast30Days(), id: \.self) { date in
                    if let entry = entriesByDay[date] {
                        Text(moodEmoji(entry.mood))
                            .font(.title2)
                            .frame(maxWidth: .infinity)
                            .padding(8)
                            .background(Circle().fill(moodColor(entry.mood).opacity(0.3)))
                    } else {
                        Text("")
                            .frame(maxWidth: .infinity)
                            .frame(height: 32)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Mood Calendar")
    }
    
    func datesForPast30Days() -> [Date] {
        (0..<30).compactMap {
            Calendar.current.date(byAdding: .day, value: -$0, to: Date())
        }
        .map { Calendar.current.startOfDay(for: $0) }
        .reversed()
    }
    
    func moodEmoji(_ mood: String) -> String {
        switch mood.lowercased() {
        case "positive": return "😊"
        case "neutral": return "😐"
        case "negative": return "😞"
        default: return "📝"
        }
    }
    
    func moodColor(_ mood: String) -> Color {
        switch mood.lowercased() {
        case "positive": return .green
        case "neutral": return .gray
        case "negative": return .red
        default: return .blue
        }
    }
}


#Preview {
    MoodCalendarView()
}
