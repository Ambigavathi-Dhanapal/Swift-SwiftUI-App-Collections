//
//  HomeListView.swift
//  SmartHealthJournal
//
//  Created by ambigavathi.d on 07/07/25.
//

import SwiftUI
import SwiftData

struct HomeListView: View {
    @AppStorage("isAuthenticated") private var isAuthenticated = false
    @Query(sort: \JournalEntry.timestamp, order: .reverse) var entries: [JournalEntry]
    
    var body: some View {
        NavigationStack {
            
            List {
                Section(header: Text("Your Journal")) {
                    NavigationLink(destination: JournalListView()) {
                        Label("Journal", systemImage: "pencil.and.outline")
                    }
                    
                    if !entries.isEmpty {
                        NavigationLink(destination: MoodSentimentToggleChartView(entries: entries)) {
                            Label("Mood - Sentiment ChartView", systemImage: "chart.bar.fill")
                        }
                    } else {
                        Label("Mood Chart (No Data)", systemImage: "chart.bar.fill")
                            .foregroundColor(.gray)
                    }
                    
                    NavigationLink(destination: MoodCalendarView()) {
                        Label("Calendar", systemImage: "calendar")
                    }
                }
                
                Section(header: Text("Wellness Insights")) {
                    NavigationLink(destination: DashboardView()) {
                        Label("Dashboard", systemImage: "waveform.path.ecg")
                    }
                }
                
                Section(header: Text("Settings")) {
                    NavigationLink(destination: SettingsView()) {
                        Label("Settings", systemImage: "gearshape")
                    }
                    
                }
                
                Section(header: Text("OCR Journal")) {
                    NavigationLink(destination: OCRJournalView()) {
                        Label("OCRJournal", systemImage: "text.viewfinder")
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("SmartHealthJournal")
        }
    }
}



#Preview {
    HomeListView()
}
