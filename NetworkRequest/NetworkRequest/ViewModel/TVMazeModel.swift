//
//  TVMazeModel.swift
//  NetworkRequest
//
//  Created by AMALITECH MACBOOK on 15/06/2023.
//

import Foundation

struct TVMazeModel: Codable, Hashable, Equatable {
    let id: Int
    let name: String
    let language: String
    let genres: [String]
    let status: String
    let image: TVMazeImage
}
struct TVMazeImage: Codable, Hashable, Equatable {
        let original: String
        let medium: String
}

