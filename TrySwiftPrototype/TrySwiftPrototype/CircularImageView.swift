//
//  CircularImageView.swift
//  TrySwiftPrototype
//
//  Created by Carson Ramsden on 8/21/19.
//  Copyright © 2019 Carson Ramsden. All rights reserved.
//

import SwiftUI

struct CircularImageView: View {
    var image: Image

    var body: some View {
        image
            .resizable()
            .frame(width: 60, height: 60, alignment: .leading)
            .clipShape(Circle())
            .shadow(radius: 10)
    }
}

#if DEBUG
//struct CircularImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        CircularImageView()
//    }
//}
#endif
