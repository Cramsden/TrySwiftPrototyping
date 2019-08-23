//
//  RiskScoreView.swift
//  TrySwiftPrototype
//
//  Created by Carson Ramsden on 8/21/19.
//  Copyright © 2019 Carson Ramsden. All rights reserved.
//

import SwiftUI

struct RiskScoreView: View {
    var labResult: LabResult
    var riskScore: RiskScore
    var otherRiskScores: [RiskScore]
    var isFlagged: Bool

    var body: some View {
        HStack(alignment: .top) {
            Text("Cumulative Risk Score").font(.system(size: 16, weight: .bold, design: .default)).foregroundColor(.customGray)
            Spacer()
            VStack(alignment: .trailing) {
                HStack(alignment: .firstTextBaseline) {
                    if isFlagged {
                        Image("abnormalIcon")
                    }
                    Text("\(riskScore.riskScore)").font(.largeTitle).foregroundColor(isFlagged ? Color.red : .customGray)
                }
                if isFlagged {
                    Text("Elevated above your goal").font(.system(size: 12, weight: .light, design: .default)).foregroundColor(.gray)
                }
            }

            NavigationLink(destination: MeasurementDetail(riskScores: otherRiskScores, labResult: labResult)) {
                Image("DisclosureIndicator").frame(width: 10, height: 60, alignment: .center)
            }.accentColor(.gray)
        }.padding()
    }
}

#if DEBUG
//struct RiskScoreView_Previews: PreviewProvider {
//    static var previews: some View {
//        RiskScoreView()
//    }
//}
#endif
