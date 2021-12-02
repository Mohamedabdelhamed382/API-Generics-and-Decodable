//
//  PostsModel.swift
//  API Generics and Decodable
//
//  Created by MOHAMED ABD ELHAMED AHMED on 30/11/2021.
//  Copyright © 2021 MOHAMED ABD ELHAMED AHMED. All rights reserved.
//

import Foundation

// MARK: - Post
struct Post: Codable {
    var userID, id: Int?
    var title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias Posts = [Post]
