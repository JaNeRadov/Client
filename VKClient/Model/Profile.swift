//
//  Profile.swift
//  VKClient
//
//  Created by Jane Z. on 28.06.2022.
//
struct Profile {
    static let insance = Profile()
    
    private init(){}
    
    var name: String = ""
    var secondName: String = ""
    var age: String = ""
    var id = 0
}
