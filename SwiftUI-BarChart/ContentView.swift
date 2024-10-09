//
//  ContentView.swift
//  SwiftUI-BarChart
//
//  Created by Alexander Gerus on 10.04.2023.
//

import SwiftUI
import Charts

struct ContentView: View {
    
    let viewMonths: [ViewMonth] = [
        .init(date: Date.from(year: 2023, month: 1, day: 1),
              viewCount: 55000),
        .init(date: Date.from(year: 2023, month: 2, day: 1),
              viewCount: 155000),
        .init(date: Date.from(year: 2023, month: 3, day: 1),
              viewCount: 45000),
        .init(date: Date.from(year: 2023, month: 4, day: 1),
              viewCount: 57000),
        .init(date: Date.from(year: 2023, month: 5, day: 1),
              viewCount: 235000),
        .init(date: Date.from(year: 2023, month: 6, day: 1),
              viewCount: 655000),
        .init(date: Date.from(year: 2023, month: 7, day: 1),
              viewCount: 255000),
        .init(date: Date.from(year: 2023, month: 8, day: 1),
              viewCount: 455000),
        .init(date: Date.from(year: 2023, month: 9, day: 1),
              viewCount: 51000),
        .init(date: Date.from(year: 2023, month: 10, day: 1),
              viewCount: 15000),
        .init(date: Date.from(year: 2023, month: 11, day: 1),
              viewCount: 53000),
        .init(date: Date.from(year: 2023, month: 12, day: 1),
              viewCount: 52000)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("YouTube Views")
            
            Text("Total: \(viewMonths.reduce(0, { $0 + $1.viewCount }))")
                .fontWeight(.semibold)
                .font(.footnote)
                .foregroundColor(.secondary)
                .padding(.bottom, 12)
            
            Chart {
                RuleMark(y: .value("Goal", 180000))
                    .foregroundStyle(Color.mint)
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
//                    .annotation(alignment: .leading) {
//                        Text("Goal")
//                            .font(.caption)
//                            .foregroundColor(.secondary)
//                    }
                
                ForEach(viewMonths) { viewMonth in
                    BarMark(
                        x: .value("Month", viewMonth.date, unit: .month),
                        y: .value("Views", viewMonth.viewCount)
                    )
                    .foregroundStyle(Color.pink.gradient)
                }
            }
            .frame(height: 180)
            .chartXAxis {
                AxisMarks(values: viewMonths.map { $0.date }) { date in
//                    AxisGridLine()
//                    AxisTick()
                    AxisValueLabel(format: .dateTime.month(.narrow), centered: true)
                }
            }
            .padding(.bottom)
//            chartYAxis {
//                AxisMarks(position: .leading) { mark in
//                    AxisValueLabel()
//                    AxisGridLine()
//                }
//            }
//            .chartYScale(domain: 0...2000000)
//            .chartPlotStyle { plotContent in
//                plotContent
//                    .background(.black.gradient.opacity(0.3))
//                    .border(.green, width: 3)
//            }
//            .chartXAxis(.hidden)
//            .chartYAxis(.hidden)
            
            HStack {
                Image(systemName: "line.diagonal")
                    .rotationEffect(Angle(degrees: 45))
                    .foregroundColor(.mint)
                
                Text("Monthly Goal")
                    .foregroundColor(.secondary)
            }
            .font(.caption2)
            .padding(.leading, 4)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ViewMonth: Identifiable {
    let id = UUID()
    let date: Date
    let viewCount: Int
}

extension Date {
    static func from(year: Int, month: Int, day: Int) -> Date {
        let components = DateComponents(year: year,
                                        month: month,
                                        day: day)
        return Calendar.current.date(from: components)!
    }
}
