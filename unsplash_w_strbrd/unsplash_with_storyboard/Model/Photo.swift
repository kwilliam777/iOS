//
//  Photo.swift
//  unsplash_with_storyboard
//
//  Created by 김응진 on 2022/04/18.
//

import Foundation

struct Photo : Codable {
    var thumbnail : String
    var username : String
    var likesCount : Int
    var createdAt : String
}
