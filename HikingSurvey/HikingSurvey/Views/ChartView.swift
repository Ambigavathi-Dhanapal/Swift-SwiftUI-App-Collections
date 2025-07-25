//
//  ChartView.swift
//  HikingSurvey
//
//  Created by ambigavathi.d on 03/07/25.
//

import SwiftUI
import Charts


struct ChartView: View {
    var responses: [Response]
    
    
    init(responses: [Response]) {
        self.responses = responses.sorted { $0.score < $1.score }
    }
    
    
    var body: some View {
        Chart(responses) { response in
            SectorMark(angle: .value("Type", 1), innerRadius: .ratio(0.75))
                .foregroundStyle(by: .value("sentiment", response.sentiment))
        }
        .chartForegroundStyleScale([
            Sentiment.positive : Sentiment.positive.sentimentColor,
            Sentiment.negative : Sentiment.negative.sentimentColor,
            Sentiment.moderate : Sentiment.moderate.sentimentColor
        ])
        .chartBackground { chartProxy in
            GeometryReader { geometry in
                if let anchor = chartProxy.plotFrame {
                    let frame = geometry[anchor]
                    Image(systemName: "figure.hiking")
                        .position(x: frame.midX, y: frame.midY)
                }
            }
        }
        .chartLegend(position: .trailing, alignment: .center)
        .frame(height: 200)
        .padding()
    }
}

#Preview {
    ContentView()
}
