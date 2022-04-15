//
//  MyLogger.swift
//  unsplash_with_storyboard
//
//  Created by 김응진 on 2022/04/14.
//

import Foundation
import Alamofire

final class MyLogger: EventMonitor {
    
    let queue = DispatchQueue(label: "MyLogger")
    
    func requestDidResume(_ request: Request) {
        print("MyLogger - requestDidResume")
        debugPrint(request)
    }
    
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        print("MyLogger - request didparse")
        debugPrint(response)
    }
    
}
