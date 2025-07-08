//
//  SettingsView.swift
//  SmartHealthJournal
//
//  Created by ambigavathi.d on 07/07/25.
//

import SwiftUI
import SwiftData
import UniformTypeIdentifiers

struct SettingsView: View {
    @AppStorage("remindersEnabled") private var remindersEnabled = false
    @Environment(\.modelContext) private var context
    @Query(sort: \JournalEntry.timestamp) private var entries: [JournalEntry]
    
    @State private var showShareSheet = false
    @State private var csvURL: URL?
    
    var body: some View {
        Form {
            Section {
                NavigationLink("🔔 Reminder Settings", destination: NotificationSettingsView())
//                Toggle(isOn: $remindersEnabled) {
//                    Label("Daily Reminder at 1:30 PM", systemImage: "bell")
//                }
//                .onChange(of: remindersEnabled) { _, newValue in
//                    if newValue {
//                        NotificationManager.shared.requestPermission()
//                        NotificationManager.shared.scheduleDailyReminder(
//                            hour: Constants.defaultReminderHour,
//                            minute: Constants.defaultReminderMinute
//                        )
//                    } else {
//                        UNUserNotificationCenter.current()
//                            .removePendingNotificationRequests(withIdentifiers: ["daily_journal_reminder"])
//                    }
//                }
            }
            
            Section {
                Button {
                    exportEntries()
                } label: {
                    Label("Export Entries", systemImage: "square.and.arrow.up")
                }
            }
            
            Section {
                NavigationLink(destination: AboutView()) {
                    Label("About App", systemImage: "info.circle")
                }
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showShareSheet) {
            if let csvURL {
                ShareSheet(activityItems: [csvURL])
            }
        }
    }
    
        // MARK: - Export as CSV
    func exportEntries() {
        guard !entries.isEmpty else {
            print("⚠️ No entries to export.")
            return
        }
        
        if let fileURL = CSVExporter.export(entries: entries) {
            self.csvURL = fileURL
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.showShareSheet = true
            }
        } else {
            print("❌ Export failed.")
        }
    }
}

#Preview {
    SettingsView()
}
