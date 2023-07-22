//
//  MenuSection.swift
//  team1nc3
//
//  Created by Juli Yanti on 21/07/23.
//

import SwiftUI

struct MenuSection<Content: View>: View {
    
    let sectionHeaderTitle: String
    let content: Content
    
    init(sectionHeaderTitle: String, @ViewBuilder content: () -> Content) {
        self.sectionHeaderTitle = sectionHeaderTitle
        self.content = content()
    }
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(sectionHeaderTitle).padding(.bottom, 8)
                    .font(.subheadline)
                content
            }
            Spacer()
        }.padding(EdgeInsets(top: 10, leading: 21, bottom: 10, trailing: 21))
    }
}
