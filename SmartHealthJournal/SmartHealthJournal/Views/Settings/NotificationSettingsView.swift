//
//  NotificationSettingsView.swift
//  SmartHealthJournal
//
//  Created by ambigavathi.d on 08/07/25.
//

import SwiftUI
import UserNotifications

struct NotificationSettingsView: View {
    @AppStorage("isNotificationEnabled") private var isNotificationEnabled = false
    @AppStorage("reminderTime") private var reminderTime: Double = Date().timeIntervalSince1970 // stored as timeInterval
    
    var selectedTime: Date {
        get { Date(timeIntervalSince1970: reminderTime) }
        set { reminderTime = newValue.timeIntervalSince1970 }
    }
    
    var body: some View {
        Form {
            Section(header: Text("Daily Reminder")) {
                Toggle(isOn: $isNotificationEnabled) {
                    Text("Enable Daily Notification")
                }
                .onChange(of: isNotificationEnabled) { enabled in
                    if enabled {
                        let calendar = Calendar.current
                        let hour = calendar.component(.hour, from: selectedTime)
                        let minute = calendar.component(.minute, from: selectedTime)
                        NotificationManager.shared.requestPermission()
                        NotificationManager.shared.scheduleDailyReminder(hour: hour, minute: minute)
                    } else {
                        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["daily_journal_reminder"])
                        print("🔕 Reminder cancelled")
                    }
                }
                
                if isNotificationEnabled {
                    DatePicker("Reminder Time", selection: Binding(
                        get: { selectedTime },
                        set: { newValue in
                            reminderTime = newValue.timeIntervalSince1970
                            let hour = Calendar.current.component(.hour, from: newValue)
                            let minute = Calendar.current.component(.minute, from: newValue)
                            NotificationManager.shared.scheduleDailyReminder(hour: hour, minute: minute)
                        }),
                               displayedComponents: .hourAndMinute
                    )
                    .datePickerStyle(.wheel)
                }
            }
        }
        .navigationTitle("Reminders")
    }
}
