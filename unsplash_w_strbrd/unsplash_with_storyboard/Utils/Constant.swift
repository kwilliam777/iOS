//
//  Constant.swift
//  unsplash_with_storyboard
//
//  Created by 김응진 on 2022/04/07.
//

import Foundation

enum SEGUE_ID {
    static let USER_LIST_VC = "goToUserListVC"
    static let PHOTO_COLLECTION_VC = "goToPhotoCollectionVC"
}

enum API {
    static let BASE_URL: String = "https://api.unsplash.com/"
    static let CLIENT_ID: String = "JUtpWTnsMrIOgclmyLqCXjlA9TX64DPk-6f7_efUdPg"
}

enum NOTIFICATION {
    enum API {
        static let AUTH_FAIL = "authentication_fail"
    }
}
