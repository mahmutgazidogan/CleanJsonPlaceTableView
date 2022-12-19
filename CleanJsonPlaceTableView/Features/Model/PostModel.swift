//
//  PostModel.swift
//  CleanJsonPlaceTableView
//
//  Created by Mahmut Gazi Doğan on 30.11.2022.
//

import Foundation

struct PostModel: Codable {
    let userID: Int?
    let id: Int?
    let title: String?
    let body: String?
}
