//
//  RiskScoreCellView.swift
//  TrySwiftPrototype
//
//  Created by Carson Ramsden on 9/1/19.
//  Copyright © 2019 Carson Ramsden. All rights reserved.
//

import SwiftUI

struct RiskScoreCellView: View {
    var headerTitle: String
    var scoreValue: Int
    var backgroundColor: Color
    var body: some View {
        VStack(alignment: .trailing) {
            Text(headerTitle).foregroundColor(.white).font(.headline).frame(width: 150, height: nil, alignment: .leading)
            Spacer()
            Text("\(scoreValue)").foregroundColor(.white).font(.title)
            }.padding()
        .background(backgroundColor)
    }
}

#if DEBUG
//struct RiskScoreCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        RiskScoreCellView()
//    }
//}
#endif
