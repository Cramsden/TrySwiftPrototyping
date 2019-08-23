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

    var body: some View {
        VStack(alignment: .leading) {
            Text(labResult.title).font(.title)
            Text("Based on Results, ACSVD Standards and personalized risk factors.").font(.body)
            LabChartView(riskScores: riskScores)
            Spacer()
        }.padding()
    }
}

#if DEBUG
//struct MeasurementDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        MeasurementDetail()
//    }
//}
#endif
