//
//  AppGroup.swift
//  AppStoreClone
//
//  Created by Decagon on 18/07/2021.
//

import Foundation

struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let id, artistName, name, artworkUrl100: String
    
}
