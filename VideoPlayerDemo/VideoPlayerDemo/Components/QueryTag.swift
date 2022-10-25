//
//  QueryTag.swift
//  VideoPlayerDemo
//
//  Created by Gabriel Stevens on 10/16/22.
//

import SwiftUI

struct QueryTag: View {
    var query: Query
    var isSelected: Bool
    
    var body: some View {
        Text(query.rawValue)
            .font(.caption)
            .bold()
            .foregroundColor(isSelected ? .black : .gray)
            .padding(12)
            .background(isSelected ? .green : .black)
            .cornerRadius(8)
    }
}

struct QueryTag_Previews: PreviewProvider {
    static var previews: some View {
        QueryTag(query: Query.tech, isSelected: true)
    }
}
