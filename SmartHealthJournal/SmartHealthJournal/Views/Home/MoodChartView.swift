//
//  MoodChartView.swift
//  SmartHealthJournal
//
//  Created by ambigavathi.d on 07/07/25.
//

    //
    //  MoodChartView.swift
    //  SmartHealthJournal
    //

    //
    //  MoodChartView.swift
    //  SmartHealthJournal
    //

import SwiftUI
import Charts

struct MoodChartView: View {
    var entries: [JournalEntry]
    
    struct MoodSentimentStat: Identifiable, Hashable {
        let id = UUID()
        let mood: String
        let sentiment: String
        let count: Int
    }
    
        // Group and count entries by mood + sentiment
    var moodSentimentStats: [MoodSentimentStat] {
        var counter: [String: [String: Int]] = [:]
        
        for entry in entries {
            let mood = entry.mood.capitalized
            let sentiment = entry.sentiment.capitalized
            
            if counter[mood] == nil {
                counter[mood] = [:]
            }
            
            counter[mood]?[sentiment, default: 0] += 1
        }
        
        return counter.flatMap { mood, sentimentsDict in
            sentimentsDict.map { sentiment, count in
                MoodSentimentStat(mood: mood, sentiment: sentiment, count: count)
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Mood + Sentiment Breakdown")
                .font(.title3)
                .bold()
            
            if moodSentimentStats.isEmpty {
                Text("No entries yet.")
                    .foregroundColor(.gray)
            } else {
                Chart(moodSentimentStats) { stat in
                    BarMark(
                        x: .value("Mood", stat.mood),
                        y: .value("Count", stat.count)
                    )
                    .foregroundStyle(by: .value("Sentiment", stat.sentiment))
                    .cornerRadius(4)
                }
                .chartXAxisLabel("Mood")
                .chartYAxisLabel("Entries")
                .chartForegroundStyleScale([
                    "Positive": .green,
                    "Negative": .red,
                    "Neutral": .gray
                ])
                .frame(height: 300)
                .padding(.horizontal)
            }
        }
        .padding()
        .navigationTitle("Mood Chart")
    }
}

#Preview {
    let mockEntries: [JournalEntry] = [
        JournalEntry(title: "Joyful", text: "Had fun at the beach!", mood: "Positive", sentiment: "Positive"),
        JournalEntry(title: "Frustrated", text: "Missed a meeting", mood: "Negative", sentiment: "Negative"),
        JournalEntry(title: "Chill", text: "Watched a movie", mood: "Neutral", sentiment: "Neutral"),
        JournalEntry(title: "Hopeful", text: "Things are getting better", mood: "Positive", sentiment: "Positive"),
        JournalEntry(title: "Tired", text: "Long workday", mood: "Negative", sentiment: "Negative"),
        JournalEntry(title: "Relaxed", text: "Meditated today", mood: "Neutral", sentiment: "Neutral")
    ]
    
    MoodChartView(entries: mockEntries)
}
