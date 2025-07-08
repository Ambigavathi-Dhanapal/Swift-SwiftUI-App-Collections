
# 📓 SmartHealthJournal

SmartHealthJournal is a SwiftUI-based iOS wellness journaling app designed to help users track daily thoughts, moods, sentiments, and overall mental well-being. It combines journaling, mood tracking, health data sync, and intelligent sentiment analysis into a sleek, intuitive interface.

---

## ✨ Features

### 📝 Daily Journaling
- Add entries with a **title**, **journal text**, and **mood tag**.
- Supports editing and deleting entries.
- Sentiment is automatically analyzed using Apple’s **Natural Language framework**.

### 🌈 Mood & Sentiment Tracking
- Bar charts to visualize frequency:
- By Mood (Positive, Neutral, Negative)
- By Sentiment (Positive, Neutral, Negative)
- Toggle between **Mood Chart** and **Sentiment Chart** using intuitive tabs.

### 🔍 OCR Journal Entry 
- Use the camera or photo library to extract text from handwritten or printed notes and save it as a journal entry using **VisionKit**.

### ❤️ Apple HealthKit Integration
- Sync your **heart rate**, **steps**, and **sleep analysis** into the dashboard.
- Write back mood insights into HealthKit (if authorized).
- Secure permission handling with `NSHealthShareUsageDescription`.

### 🔔 Daily Reminders
- User can enable daily journaling reminders using **local notifications**.
- Schedule your own reminder time (e.g., 9:00 PM).
- Notifications show even when app is running using a custom delegate.

### 🔐 Data Privacy & Sync
- Entries are stored locally using **SwiftData** (in-memory for preview/testing).
- CSV Export (for backup/sharing) includes title, text, mood, sentiment, and timestamp.

---

## 🧱 Tech Stack

- **SwiftUI** – UI & Navigation
- **SwiftData** – Local persistence
- **Combine** – Reactive bindings
- **UserNotifications** – Local reminders
- **Vision** – OCR support (in development)
- **HealthKit** – Wellness data sync
- **Natural Language** – Built-in sentiment analysis

---

## 🚀 Setup Instructions

1. Clone the repository and open in Xcode 15+.
2. Ensure the following permissions are in `Info.plist`:
```
<key>NSHealthShareUsageDescription</key>
<string>This app uses HealthKit to access your wellness data.</string>
<key>NSHealthUpdateUsageDescription</key>
<string>This app writes your journal moods into Health data.</string>
<key>NSUserNotificationUsageDescription</key>
<string>SmartHealthJournal needs permission to send you daily reminders.</string>
```
3. Run the app on a **real device** for HealthKit or OCR features.
4. Schedule daily notifications from the Settings screen.
5. Start journaling!

---

## 📌 Upcoming Features

- [ ] Mood prediction via ML model
- [ ] Dark mode enhancements
- [ ] Widgets & Siri Shortcuts

---

## 🙌 Author

Made with ❤️ by [Ambigavathi Dhanapal]

---
            
