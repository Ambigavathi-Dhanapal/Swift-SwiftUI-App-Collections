//
//  NotificationManager.swift
//  SmartHealthJournal
//
//  Created by ambigavathi.d on 07/07/25.
//

// MARK: - NotificationManager.swift
import Foundation
import UserNotifications

class NotificationManager {
    static let shared = NotificationManager()
    
    private init() {}
    
    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
            if granted {
                print("🔔 Notifications authorized")
            } else {
                print("⚠️ Notifications denied")
            }
        }
    }
    
    func scheduleDailyReminder(hour: Int, minute: Int) {
        let content = UNMutableNotificationContent()
        content.title = "📝 Time to reflect!"
        content.body = "Don't forget to journal your day."
        content.sound = .default
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: "daily_journal_reminder", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("❌ Failed to schedule reminder: \(error.localizedDescription)")
            } else {
                print("✅ Daily reminder scheduled at \(hour):\(minute)")
            }
        }
    }
}

