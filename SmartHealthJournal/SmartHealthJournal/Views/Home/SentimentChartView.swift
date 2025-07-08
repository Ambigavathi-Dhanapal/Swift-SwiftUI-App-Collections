//
//  SentimentChartView.swift
//  SmartHealthJournal
//
//  Created by ambigavathi.d on 07/07/25.
//

import SwiftUI
import Charts

struct SentimentChartView: View {
    let entries: [JournalEntry]
    
    var sentimentCounts: [String: Int] {
        Dictionary(grouping: entries.map { $0.sentiment.capitalized }) { $0 }
            .mapValues { $0.count }
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Sentiment Frequency")
                .font(.title2)
                .bold()
            
            if sentimentCounts.isEmpty {
                Text("No sentiment data available.")
                    .foregroundColor(.gray)
            } else {
                Chart {
                    ForEach(sentimentCounts.sorted(by: { $0.key < $1.key }), id: \.key) { sentiment, count in
                        BarMark(
                            x: .value("Sentiment", sentiment),
                            y: .value("Count", count)
                        )
                        .foregroundStyle(sentimentColor(sentiment))
                    }
                }
                .chartXAxisLabel("Sentiment")
                .chartYAxisLabel("Count")
                .frame(height: 300)
                .padding(.horizontal)
            }
        }
        .padding()
    }
    
    func sentimentColor(_ sentiment: String) -> Color {
        switch sentiment.lowercased() {
        case "positive": return .green
        case "negative": return .red
        case "neutral": return .gray
        default: return .blue
        }
    }
}


#Preview {
    let entries: [JournalEntry] = [
        JournalEntry(title: "Joyful", text: "Had fun at the beach", mood: "Positive", sentiment: "Positive"),
        JournalEntry(title: "Angry", text: "Missed my bus", mood: "Negative", sentiment: "Negative"),
        JournalEntry(title: "Chill", text: "Watched a movie", mood: "Neutral", sentiment: "Neutral"),
        JournalEntry(title: "Hopeful", text: "Things improving", mood: "Positive", sentiment: "Positive"),
        JournalEntry(title: "Tired", text: "Long day", mood: "Negative", sentiment: "Negative"),
        JournalEntry(title: "Balanced", text: "Calm evening", mood: "Neutral", sentiment: "Neutral")
    ]
    
    SentimentChartView(entries: entries)
}
