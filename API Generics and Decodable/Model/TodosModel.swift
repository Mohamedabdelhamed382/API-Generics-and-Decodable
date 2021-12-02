//
//  TodosModel.swift
//  API Generics and Decodable
//
//  Created by MOHAMED ABD ELHAMED AHMED on 02/12/2021.
//  Copyright © 2021 MOHAMED ABD ELHAMED AHMED. All rights reserved.
//

import Foundation
import Foundation

// MARK: - Todo
struct Todo: Codable {
    var userID, id: Int?
    var title: String?
    var completed: Bool?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}

typealias Todos = [Todo]
