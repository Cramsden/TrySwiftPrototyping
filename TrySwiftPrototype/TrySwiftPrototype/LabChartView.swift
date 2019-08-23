//
//  LabChartView.swift
//  TrySwiftPrototype
//
//  Created by Carson Ramsden on 8/23/19.
//  Copyright © 2019 Carson Ramsden. All rights reserved.
//

import Charts
import SwiftUI

struct LabChartView: UIViewRepresentable {
    var riskScores: [RiskScore]

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> LineChartView {
        let chartView = LineChartView()
        chartView.delegate = context.coordinator
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = true
        chartView.rightAxis.enabled = false
        chartView.leftAxis.drawAxisLineEnabled = false
//        chartView.xAxis.valueFormatter = customXAxisFormatter()
        chartView.legend.form = .circle
        chartView.xAxis.gridLineDashLengths = [10, 10]
        chartView.xAxis.gridLineDashPhase = 0
        chartView.leftAxis.gridLineDashLengths = [5, 5]
        chartView.leftAxis.drawLimitLinesBehindDataEnabled = true
        return chartView
    }

    func updateUIView(_ view: LineChartView, context: Context) {
        let vals = riskScores.enumerated().map { ChartDataEntry(x: Double($0.0), y: Double($0.1.riskScore)) }
        let set1 = LineChartDataSet(entries: vals, label: "Risk Scores")
        set1.drawIconsEnabled = false
        set1.setColor(UIColor.purple)
        set1.setCircleColor(UIColor.purple)
        set1.lineWidth = 2
        set1.circleRadius = 4
        let gradient1 = CGGradient(colorsSpace: nil, colors: [UIColor.white.cgColor, UIColor.purple.cgColor] as CFArray, locations: nil)!
        set1.fillAlpha = 1
        set1.fill = Fill(linearGradient: gradient1, angle: 90)
        set1.drawFilledEnabled = true
        set1.valueFont = .systemFont(ofSize: 12)
        let data = LineChartData(dataSets: [set1])

        view.data = data
    }

    class Coordinator: NSObject, ChartViewDelegate {
        var parent: LabChartView

        init(_ labView: LabChartView) {
            self.parent = labView
        }
    }
}
