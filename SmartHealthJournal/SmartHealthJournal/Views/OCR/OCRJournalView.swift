//
//  OCRJournalView.swift
//  SmartHealthJournal
//
//  Created by ambigavathi.d on 07/07/25.
//

import SwiftUI
import PhotosUI

struct OCRJournalView: View {
    @State private var selectedImage: UIImage?
    @State private var recognizedText: String = ""
    @State private var showImagePicker = false
    @Environment(\.modelContext) private var context
    
    var body: some View {
        VStack(spacing: 16) {
            Button("Choose Image") {
                showImagePicker = true
            }
            .buttonStyle(.borderedProminent)
            
            if let selectedImage = selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(10)
            }
            
            TextEditor(text: $recognizedText)
                .frame(height: 200)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray))
            
            Button("Save as Journal Entry") {
                let sentiment = analyzeSentiment(
                    title: "",
                    mood: "",
                    content: recognizedText
                )
                let entry = JournalEntry(title: "OCR Entry", text: recognizedText, mood: "Neutral", sentiment: sentiment)
                context.insert(entry)
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .padding()
        .sheet(isPresented: $showImagePicker) {
            PhotoPicker(image: $selectedImage) { image in
                OCRProcessor.extractText(from: image) { result in
                    DispatchQueue.main.async {
                        self.recognizedText = result ?? "No text recognized"
                    }
                }
            }
        }
        .navigationTitle("OCR Journal")
    }
}
