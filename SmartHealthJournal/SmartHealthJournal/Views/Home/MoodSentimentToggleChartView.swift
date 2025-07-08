//
//  MoodSentimentToggleChartView.swift
//  SmartHealthJournal
//
//  Created by ambigavathi.d on 07/07/25.
//

import SwiftUI
import Charts

struct MoodSentimentToggleChartView: View {
    var entries: [JournalEntry]
    @State private var selectedChart = "Sentiment"
    
    private let chartTypes = ["Sentiment", "Mood"]
    
    var body: some View {
        VStack(spacing: 12) {
            Picker("Chart Type", selection: $selectedChart) {
                ForEach(chartTypes, id: \.self) { chart in
                    Text(chart)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            
            if selectedChart == "Mood" {
                MoodChartView(entries: entries)
            } else {
                SentimentChartView(entries: entries)
            }
        }
        .navigationTitle("Mood & Sentiment Charts")
        .padding()
    }
}

#Preview {
    let mockEntries = [
        JournalEntry(title: "Joy", text: "Loved today!", mood: "Happy", sentiment: "Positive"),
        JournalEntry(title: "Bored", text: "Nothing special", mood: "Neutral", sentiment: "Neutral"),
        JournalEntry(title: "Angry", text: "Frustrating experience", mood: "Irritated", sentiment: "Negative")
    ]
    return MoodSentimentToggleChartView(entries: mockEntries)
}
