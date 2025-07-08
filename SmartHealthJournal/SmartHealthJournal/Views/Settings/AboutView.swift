//
//  AboutView.swift
//  SmartHealthJournal
//
//  Created by ambigavathi.d on 07/07/25.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "heart.text.square")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.blue)
            
            Text("SmartHealthJournal")
                .font(.title2)
                .fontWeight(.bold)
            
            Text("Version 1.0.0")
                .foregroundColor(.gray)
            
            Text("Track your thoughts, moods, and wellness daily with insights and simplicity.")
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .navigationTitle("About App")
    }
}

