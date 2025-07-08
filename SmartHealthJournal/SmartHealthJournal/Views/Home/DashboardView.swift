//
//  DashboardView.swift
//  SmartHealthJournal
//
//  Created by ambigavathi.d on 07/07/25.
//

import SwiftUI
import SwiftData

struct DashboardView: View {
    @Query(sort: \JournalEntry.timestamp, order: .reverse) var entries: [JournalEntry]
    
    var recentEntries: [JournalEntry] {
        let last30Days = Calendar.current.date(byAdding: .day, value: -30, to: Date())!
        return entries.filter { $0.timestamp >= last30Days }
    }
    @State private var stepsToday: Double = 0

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Wellness Dashboard").font(.title2).bold()
                Text("Steps Today: \(Int(stepsToday))")
                    .font(.headline)
                
                Button("Sync with Health") {
                    HealthKitManager.shared.requestAuthorization()
                    HealthKitManager.shared.fetchStepCount { steps in
                        DispatchQueue.main.async {
                            stepsToday = steps
                        }
                    }
                }
            }
            .padding()
            VStack(spacing: 20) {
                Text("🧘 Mood & Journal Dashboard")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                
                    // Entry count summary
                HStack {
                    Text("📝 Entries in last 30 days: \(recentEntries.count)")
                        .font(.subheadline)
                    Spacer()
                }
                .padding(.horizontal)
                
                    // Mood frequency bar chart (reused)
                MoodSentimentToggleChartView(entries: recentEntries)
                
                    // Mood trend line chart
                MoodTrendLineChartView(entries: recentEntries)
                
                    // Calendar shortcut
                NavigationLink(destination: MoodCalendarView()) {
                    HStack {
                        Text("📆 View Mood Calendar")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.horizontal)
                }
                
                Spacer()
            }
        }
        .navigationTitle("Dashboard")
    }
}

#Preview {
    DashboardView()
}
