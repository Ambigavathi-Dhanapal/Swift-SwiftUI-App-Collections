    //
    //  SentimentAnalyzer.swift
    //  SmartHealthJournal
    //
    //  Created by ambigavathi.d on 07/07/25.
    //

import Foundation
import NaturalLanguage

enum Sentiment: String {
    case positive, neutral, negative
}


func analyzeSentiment(title: String, mood: String, content: String) -> String {
    let combinedText = "\(title). \(mood). \(content)"
    
    let tagger = NLTagger(tagSchemes: [.sentimentScore])
    tagger.string = combinedText
    
    let (sentimentTag, _) = tagger.tag(at: combinedText.startIndex,
                                       unit: .paragraph,
                                       scheme: .sentimentScore)
    
    if let score = sentimentTag?.rawValue, let value = Double(score) {
        if value > 0.2 {
            return "Positive"
        } else if value < -0.2 {
            return "Negative"
        } else {
            return "Neutral"
        }
    }
    return "Neutral"
}
 
