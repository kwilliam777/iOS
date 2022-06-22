//
//  MyAlamofireManager.swift
//  unsplash_with_storyboard
//
//  Created by 김응진 on 2022/04/12.
//

import Foundation
import Alamofire
import SwiftyJSON

final class MyAlamofireManager {
    // 싱글턴 적용
    static let shared = MyAlamofireManager()
    
    // 인터셉터 설정
    let interceptors = Interceptor(interceptors: [BaseInterceptors()])
    
    // 로거 설정
    let monitors = [MyLogger(),MyApiStatusLogger()] as [EventMonitor]
    
    // 세션 설정
    var session : Session
    
    private init(){
        session = Session(
            interceptor: interceptors,
            eventMonitors: monitors)
    }
    
    func getPhotos(searchTerm userInput: String, completion: @escaping (Result<[Photo],MyError>) -> Void) {
        
        print("MyAlamofireManager - getPhotos() called : \(userInput)")
        
        self.session
            .request(MySearchRouter.searchPhotos(term: userInput))
            .validate(statusCode: 200...400)
            .responseJSON(completionHandler:  { response in
                var photos = [Photo]()
                let responseJson = JSON(response.value!)
                
                let jsonArray = responseJson["results"]
                print("jsonArray.count : \(jsonArray.count)")
            })
    }
}
