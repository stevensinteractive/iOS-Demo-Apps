//
//  VideoManager.swift
//  VideoPlayerDemo
//
//  Created by Gabriel Stevens on 10/16/22.
//

import Foundation

enum Query: String, CaseIterable{
    case tech,dogs,coffee,surfing,adventure
}

class VideoManager: ObservableObject{
    @Published private(set) var videos: [Video] = []
    @Published var selectedQuery: Query = Query.tech{
        didSet{
            Task.init{
                await findVideos(topic: selectedQuery)
            }
        }
    }
    
    init(){
        Task.init{
            await findVideos(topic: selectedQuery)
        }
    }
    
    func findVideos(topic:Query) async{
        do{
            guard let url = URL(string:"https://api.pexels.com/videos/search?query=\(topic)&per_page=10&orientation=portrait") else{fatalError("Missing Link")}
            
            var urlRequest = URLRequest(url: url)
            urlRequest.setValue("563492ad6f917000010000017f6019ccf3954f309382a532962ed20a", forHTTPHeaderField: "Authorization")
            
            let (data,response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else{fatalError("Error fetching URL - Exceeded Limit?") }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodeddData = try decoder.decode(ResponseBody.self, from: data)
            print(decodeddData)
            self.videos = []
            self.videos = decodeddData.videos
            
        }catch{
            print("Error Fetching Videos from Pexels: \(error)")
        }
    }
}

struct ResponseBody: Decodable{
    var page:Int
    var perPage:Int
    //var totalResult:Int
    var url:String
    var videos: [Video]
}

struct Video: Identifiable, Decodable{
    var id:Int
   // var width:Int
   // var height:Int
    var url:String
    var image:String
    var duration:Int
    var user: User
    var videoFiles:[VideoFile]
    
    struct User: Identifiable, Decodable{
        var id:Int
        var name:String
        var url:String
    }
    
    struct VideoFile: Identifiable, Decodable{
        var id: Int
        var quality:String
        var fileType:String
        var link:String
    }
}
