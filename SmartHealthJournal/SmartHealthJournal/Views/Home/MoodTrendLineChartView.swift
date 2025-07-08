//
//  MoodTrendLineChartView.swift
//  SmartHealthJournal
//
//  Created by ambigavathi.d on 07/07/25.
//

import SwiftUI
import Charts

struct MoodTrendLineChartView: View {
    var entries: [JournalEntry]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Mood Trend (Last 30 Days)")
                .font(.headline)
                .padding(.horizontal)
            
            if entries.isEmpty {
                Text("No data available").padding()
            } else {
                Chart {
                    ForEach(entries, id: \.id) { entry in
                        LineMark(
                            x: .value("Date", entry.timestamp),
                            y: .value("Mood Score", scoreForMood(entry.mood))
                        )
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(.blue)
                    }
                }
                .chartYScale(domain: 0...2)
                .chartYAxis {
                    AxisMarks(values: [0, 1, 2]) { val in
                        AxisValueLabel {
                            switch val.as(Int.self) {
                            case 0: Text("😞")
                            case 1: Text("😐")
                            case 2: Text("😊")
                            default: Text("")
                            }
                        }
                    }
                }
                .frame(height: 200)
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(12)
                .padding(.horizontal)
            }
        }
    }
    
    func scoreForMood(_ mood: String) -> Int {
        switch mood.lowercased() {
        case "positive": return 2
        case "neutral": return 1
        case "negative": return 0
        default: return 1
        }
    }
}
