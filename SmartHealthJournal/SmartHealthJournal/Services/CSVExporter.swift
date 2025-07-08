//
//  CSVExporter.swift
//  SmartHealthJournal
//
//  Created by ambigavathi.d on 07/07/25.
//

import Foundation

struct CSVExporter {
    static func export(entries: [JournalEntry]) -> URL? {
        let header = "Title,Text,Mood,Sentiment,Date\n"
        
        let rows = entries.map {
            "\($0.title),\($0.text),\($0.mood),\($0.sentiment),\($0.timestamp)"
        }.joined(separator: "\n")
        
        let csvString = header + rows
        
        do {
            let fileURL = FileManager.default.temporaryDirectory.appendingPathComponent("JournalEntries.csv")
            try csvString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
            return fileURL
        } catch {
            print("❌ CSV Export failed: \(error.localizedDescription)")
            return nil
        }
    }
}
