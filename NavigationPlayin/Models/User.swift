//
//  Model.swift
//  NavigationPlayin
//
//  Created by Mike Kavouras on 6/19/23.
//

import SwiftUI

class User: ObservableObject {
    static let current = User()
    
    @Published var isLoggedIn: Bool = false
    
    func login(_ phone: String, code: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.isLoggedIn = true
        }
    }
}
