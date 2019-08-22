//
//  RiskScoreView.swift
//  TrySwiftPrototype
//
//  Created by Carson Ramsden on 8/21/19.
//  Copyright © 2019 Carson Ramsden. All rights reserved.
//

import SwiftUI

struct RiskScoreView: View {
    var riskScore: RiskScore
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
