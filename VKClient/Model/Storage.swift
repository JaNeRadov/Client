//
//  Storage.swift
//  AltVK
//
//  Created by Jane Z. on 21.06.2022.
//

import UIKit

class Storage: NSObject {
    static let shared = Storage()
    private override init() {
        super.init()
    }
    
    var friends = [Friend]()
    
    
    
}
