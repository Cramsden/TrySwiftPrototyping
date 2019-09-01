//
//  MeasurementDetail.swift
//  TrySwiftPrototype
//
//  Created by Carson Ramsden on 8/21/19.
//  Copyright © 2019 Carson Ramsden. All rights reserved.
//

import SwiftUI

struct MeasurementDetail: View {
    var riskScores: [RiskScore]
    var labResult: LabResult
    var currentRiskScore: RiskScore

    var body: some View {
        VStack(alignment: .leading) {
            Text(labResult.title).font(.title)
            Text("Based on Results, ACSVD Standards and personalized risk factors.").font(.body).foregroundColor(.customGray)
            LabChartView(riskScores: riskScores).padding(.top)
            ScrollView(.horizontal) {
                HStack(alignment: .center) {
                    RiskScoreCellView(headerTitle: "Current Risk Score", scoreValue: currentRiskScore.riskScore, backgroundColor: .red).fixedSize().cornerRadius(5)
                    if currentRiskScore.riskScoreWithMeds != nil {
                        RiskScoreCellView(headerTitle: "Goal", scoreValue: currentRiskScore.riskScoreWithMeds!, backgroundColor: .purple).fixedSize().cornerRadius(5)
                    }
                }
            }
            Spacer()
        }.padding()
            .navigationBarTitle("Measurements")
    }
}

#if DEBUG
//struct MeasurementDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        MeasurementDetail()
//    }
//}
#endif
