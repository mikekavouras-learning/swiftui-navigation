//
//  ContentView.swift
//  NavigationPlayin
//
//  Created by Mike Kavouras on 6/19/23.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @ObservedObject var user = User.current
    
    var body: some View {
        if user.isLoggedIn {
            HomeView()
        } else {
            LoginView(loggedIn: $user.isLoggedIn)
        }
    }
}
