//
//  SmartHealthJournalApp.swift
//  SmartHealthJournal
//
//  Created by ambigavathi.d on 07/07/25.
//

import SwiftUI
import SwiftData
import UserNotifications

@main
struct SmartHealthJournalApp: App {
    
    init() {
            // Set the notification delegate so banner appears while app is running
        UNUserNotificationCenter.current().delegate = NotificationDelegate.shared
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView() // Your initial view
        }
        .modelContainer(for: JournalEntry.self) // ⬅️ Required for SwiftData to work
    }
}

import Foundation

class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
    static let shared = NotificationDelegate()
    
    private override init() {
        super.init()
    }
    
        // Show banner and sound even when app is in foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])
    }
}
