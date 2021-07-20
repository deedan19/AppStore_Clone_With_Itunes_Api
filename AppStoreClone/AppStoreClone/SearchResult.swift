//
//  SearchResult.swift
//  AppStoreClone
//
//  Created by Decagon on 16/07/2021.
//

import Foundation


struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    let averageUserRatingForCurrentVersion: Float?
    let artworkUrl60: String
    let screenshotUrls: [String]
    let formattedPrice: String
    let description: String
    let releaseNotes: String
}
