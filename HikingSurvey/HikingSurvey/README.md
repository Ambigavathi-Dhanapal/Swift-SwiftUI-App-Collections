# 🥾 HikingSurvey

A fun and interactive iOS app built with **SwiftUI** to gather user opinions on hiking and visualize them using **sentiment analysis** and **Swift Charts**.

This project is adapted from Apple’s Swift Student Challenge tutorial with enhancements like real-time sentiment scoring and dynamic chart updates.

---

## ✨ Features

- 📥 Accepts user feedback on hiking (free text input)
- 🤖 Scores each response with a sentiment value using a custom `Scorer` class
- 🎯 Displays sentiment visually via a pie chart using `SectorMark`
- 🟢 Categorizes opinions as `Positive`, `Moderate`, or `Negative`
- 🧠 Dynamic and animated Swift Charts with a hiking icon overlay
- ⚙️ SwiftUI-first layout with a clean, scrollable interface
- 💡 Includes sample seed responses on launch

---

## 🧩 Folder Structure (Suggestion)

HikingSurvey/
├── Views/
│ ├── ContentView.swift
│ ├── ChartView.swift
│ └── ResponseView.swift
├── Models/
│ ├── Response.swift
│ └── Sentiment.swift
├── Logic/
│ └── Scorer.swift
├── Assets.xcassets/
├── Info.plist
└── HikingSurveyApp.swift


---

## 🛠 Tech Stack

- Swift 5
- SwiftUI
- Charts (Swift Charts Framework)
- Modular Architecture

---

## 📈 Sentiment Analysis Logic

Each input is scored based on word weight using the `Scorer.swift` file. The final score maps to a sentiment enum (`Positive`, `Moderate`, `Negative`) defined in `Sentiment.swift`.

---

## 🧪 How to Run

1. Clone this repo
2. Open `HikingSurvey.xcodeproj` or `.xcodeworkspace`
3. Run in **Xcode 15+** on iOS 17+ simulator or device

---

## 📚 Reference

This app is based on the [Swift Student Challenge Tutorial](https://developer.apple.com/tutorials/app-dev-training/getting-started-with-app-development)

---

## 👩🏻‍💻 Author

**Ambigavathi Dhanapal**  
iOS/macOS Developer | ML Enthusiast  
GitHub: [@Ambigavathi-Dhanapal](https://github.com/Ambigavathi-Dhanapal)

---

> ⭐️ If you found this useful, feel free to star or fork the repo!

