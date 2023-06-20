//
//  LoginView.swift
//  NavigationPlayin
//
//  Created by Mike Kavouras on 6/19/23.
//

import SwiftUI

struct LoginView: View {
    @Binding var loggedIn: Bool
    @State var selection = 0
    
    @State var showSheet: Bool = false
    
    @State var code: String = ""
    @State var phoneNumber: String = ""
    
    @State var loggingIn: Bool = false
    @FocusState var isFocused: Bool

    var body: some View {
        VStack {
            HStack {
                TextField("Enter your phone number", text: $phoneNumber)
                    .padding()
                    .keyboardType(.numberPad)
                    .background(Color.red)
                    .focused($isFocused)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Tappity tap") { print("tap") }
                        }
                    }
                Button("Submit") {
                    showSheet = true
                }
                .buttonStyle(.borderedProminent)
                .sheet(isPresented: $showSheet) {
                    VerificationCodeView(code: $code) {
                        loggingIn = true
                        User.current.login(phoneNumber, code: code)
                    }
                }
            }.background(Color.green)
            if loggingIn {
                ProgressView()
                    .padding(.top)
            }
        }
        .padding()
        .onAppear {
            isFocused = true
        }
    }
}

#Preview {
    LoginView(loggedIn: .constant(false))
}
