//
//  MyApiStatusLogger.swift
//  unsplash_with_storyboard
//
//  Created by 김응진 on 2022/04/14.
//

import Foundation
import Alamofire

final class MyApiStatusLogger: EventMonitor {
    
    let queue = DispatchQueue(label: "MyApiStatusLogger")
    
//    func requestDidResume(_ request: Request) {
//        print("MyLogger - requestDidResume")
//        debugPrint(request)
//    }
    
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        guard let statusCode = request.response?.statusCode else { return }
        print("MyLogger - request didparse: \(statusCode)")
//        debugPrint(response)
    }
    
}
