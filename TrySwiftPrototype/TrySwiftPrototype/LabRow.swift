//
//  LabRow.swift
//  TrySwiftPrototype
//
//  Created by Carson Ramsden on 8/21/19.
//  Copyright © 2019 Carson Ramsden. All rights reserved.
//

import SwiftUI

struct LabRow: View {
    var labResult: LabResult
    var body: some View {
        HStack {
            labResult.isFlagged ? Image("AbnormalLabIcon") : Image("NormalLabIcon")
            VStack(alignment: .leading) {
                Text(labResult.title)
                    .font(.headline)
                Spacer()
                Text(labResult.isFlagged ? "New results that need your attention": "All results withen range")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }.padding()
        }
    }
}

#if DEBUG
//struct LabRow_Previews: PreviewProvider {
//    static var previews: some View {
//        LabRow()
//    }
//}
#endif
