//
//  ModelData.swift
//  VideoPlayerDemo
//
//  Created by Gabriel Stevens on 10/16/22.
//

import Foundation

var previewVideo:Video = load("videoData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
        print(data)
    } catch {
        fatalError("1. Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("2. Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
