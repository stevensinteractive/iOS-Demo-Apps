//
//  GenericButton.swift
//  SwiftUI-Weather (iOS)
//
//  Created by Gabriel Stevens on 10/16/22.
//

import SwiftUI

struct GenericButton: View {
    var title: String
    var textColor:Color
    var backgroundColor:Color
    
    var body: some View {
        Text(title)
            .frame(width:280, height:50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size:20, weight:.medium))
            .cornerRadius(25)
    }
}
