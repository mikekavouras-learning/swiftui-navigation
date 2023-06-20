//
//  VerificationCodeView.swift
//  NavigationPlayin
//
//  Created by Mike Kavouras on 6/19/23.
//

import SwiftUI

struct VerificationCodeView: View {
    @Binding var code: String
    @Environment(\.dismiss) var dismiss
    var onSubmit: (() -> Void)?
    
    var body: some View {
        HStack {
            TextField("Verification code", text: $code)
                .keyboardType(.numberPad)
            Button("Submit") {
                onSubmit?()
                dismiss()
            }
        }.padding()
    }
}
