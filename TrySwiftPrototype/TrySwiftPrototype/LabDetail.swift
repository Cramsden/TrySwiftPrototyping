//
//  LabDetail.swift
//  TrySwiftPrototype
//
//  Created by Carson Ramsden on 8/21/19.
//  Copyright © 2019 Carson Ramsden. All rights reserved.
//

import SwiftUI

struct LabDetail: View {
    var labResult: LabResult
    var riskScore: RiskScore?
    var provider: Provider?

    var body: some View {
        VStack(alignment: .leading) {
            Text(labResult.title).font(.title)
            if riskScore != nil {
                RiskScoreView(riskScore: riskScore!, isFlagged: labResult.isFlagged).frame(width: 370, height: 80, alignment: .center).border(Color.gray, width: 1)
            }
            if provider != nil {
                ProviderMessageView(provider: provider!, message: labResult.interpritation).layoutPriority(10).padding(.top).padding(.bottom)
            }
            Divider()
            ActionPlanView(actionItems: labResult.followUpNotes)
        }.padding().navigationBarTitle(Text("Lab Details"))
    }
}

#if DEBUG
//struct LabDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        LabDetail()
//    }
//}
#endif
