# 🥾 HikingSurvey

An interactive iOS app built with **SwiftUI** that collects user opinions about hiking and visualizes them through **sentiment analysis** and **Swift Charts**.

Inspired by [Apple’s official tutorial](https://developer.apple.com/tutorials/develop-in-swift/analyze-sentiment-in-text), this project demonstrates how to apply lightweight natural language processing in an engaging, visual format.

---

## ✨ Features

- 🗣 Accepts free-form text feedback from users about hiking
- 🤖 Applies custom sentiment scoring to classify responses
- 🎯 Categorizes sentiments as `Positive`, `Moderate`, or `Negative`
- 📊 Visualizes sentiment distribution with animated pie charts using `SectorMark`
- 🌱 Includes seed responses on launch for demo purposes
- ⚙️ Built with SwiftUI for a clean, responsive user interface

---

## 📈 Sentiment Analysis

- The app uses a simple rule-based approach implemented in `Scorer.swift` to score responses based on weighted word lists.
- Scores are mapped to a `Sentiment` type defined in `Sentiment.swift`, and rendered dynamically in the chart view.
- The chart updates in real-time as new responses are added.

---

## 🛠 Tech Stack

- Swift 5
- SwiftUI
- Swift Charts Framework
- Modular MVVM-style architecture

---

## 📚 Reference

Tutorial Source: [Analyze Sentiment in Text – Apple](https://developer.apple.com/tutorials/develop-in-swift/analyze-sentiment-in-text)

---

## 🧪 How to Run

1. Clone the repository
2. Open `HikingSurvey.xcodeproj` in Xcode
3. Run the app in an iOS 17+ simulator or device using Xcode 15+

---

## 👤 Author

**Ambigavathi Dhanapal**  
iOS/macOS Developer | ML Enthusiast  
🔗 GitHub: [@Ambigavathi-Dhanapal](https://github.com/Ambigavathi-Dhanapal)

---

> ⭐️ Star or fork the repo if you find it helpful or want to build on top of it!
