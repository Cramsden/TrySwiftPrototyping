//
//  ActionPlanView.swift
//  TrySwiftPrototype
//
//  Created by Carson Ramsden on 8/22/19.
//  Copyright © 2019 Carson Ramsden. All rights reserved.
//

import SwiftUI

struct ActionPlanView: View {
    var actionItems: [String]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Action Plan").padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)).font(.system(size: 16, weight: .bold, design: .default)).foregroundColor(.customGray)
            ForEach(actionItems, id: \.self) { actionItem in
                HStack(alignment: .center) {
                    Text("\(self.actionItems.firstIndex(of: actionItem)! + 1)").padding().overlay(Circle().stroke(Color.gray, lineWidth: 1)).foregroundColor(.black)
                    Text(actionItem).font(.body).padding(.leading).foregroundColor(.customGray)
                }
            }
        }.padding()
    }
}

#if DEBUG
//struct ActionPlanView_Previews: PreviewProvider {
//    static var previews: some View {
//        ActionPlanView()
//    }
//}
#endif
