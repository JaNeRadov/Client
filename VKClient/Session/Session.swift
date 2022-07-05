//
//  Session.swift
//  VKClient
//
//  Created by Jane Z. on 05.07.2022.
//

import Foundation

class Session {
    
    static let instance = Session()
    
    private init(){}
    
    var token: String = ""
    var userId: Int = 0
}
