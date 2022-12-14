//
//  VideoCard.swift
//  VideoPlayerDemo
//
//  Created by Gabriel Stevens on 10/16/22.
//

import SwiftUI

struct VideoCard: View {
    
    var video:Video
    
    var body: some View {
        ZStack {
            ZStack(alignment: .bottomLeading){
                AsyncImage(url: URL(string: video.image)){ image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:160,height:250)
                        .cornerRadius(10)
                
                }placeholder: {
                Rectangle()
                    .foregroundColor(.gray.opacity(0.3))
                    .frame(width: 150, height: 250)
                    .cornerRadius(10)
                   
                }
                VStack(alignment: .leading){
                    Text("\(video.duration)s")
                        .font(.caption).bold()
                    Text("By: \(video.user.name)")
                        .font(.caption).bold()
                        .multilineTextAlignment(.leading)
                }
                .foregroundColor(.white)
                .shadow(radius: 2, x: 1, y: 1)
                .padding()
            }
            
            Image(systemName: "play.fill")
                .foregroundColor(.white)
                .font(.title)
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(50)
                
        }
        .shadow(radius: 4, x: 2, y: 2)
    }
}

struct VideoCard_Previews: PreviewProvider {
    static var previews: some View {
        VideoCard(video:previewVideo)
    }
}
