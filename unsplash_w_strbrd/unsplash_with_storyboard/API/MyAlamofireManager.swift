//
//  MyAlamofireManager.swift
//  unsplash_with_storyboard
//
//  Created by 김응진 on 2022/04/12.
//

import Foundation
import Alamofire

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
        session = Session(interceptor: interceptors, eventMonitors: monitors)
    }
    
    
}
