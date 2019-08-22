//
//  ProviderMessageView.swift
//  TrySwiftPrototype
//
//  Created by Carson Ramsden on 8/21/19.
//  Copyright © 2019 Carson Ramsden. All rights reserved.
//

import SwiftUI

struct ProviderMessageView: View {
    var provider: Provider
    var message: String
    var body: some View {
        HStack(alignment: .top) {
            CircularImageView(image: Image(provider.profileImageName))
            VStack(alignment: .leading) {
                Text(provider.displayName).font(.headline).foregroundColor(.customGray)
                Text(message).font(.body).foregroundColor(.customGray).layoutPriority(1)
                Button(action: {

                }) {
                    Text("Send Message")
                    .lineLimit(1)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .background(Color.purple)
                }
            }
        }
    }
}

#if DEBUG
//struct ProviderMessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProviderMessageView()
//    }
//}
#endif
