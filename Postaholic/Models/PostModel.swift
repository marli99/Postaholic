//
//  PostModel.swift
//  Postaholic
//
//  Created by Marli Correia on 2021/10/21.
//

import Foundation

struct Post : Identifiable{
    var id = UUID()
    var postId: String
    var caption: String
    var imageUrl: String
    var ownderId: String
    var likeCount: Int
    var date: Double
}
