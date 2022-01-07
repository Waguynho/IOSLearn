//
//  View.swift
//  CustomAlert
//
//  Created by Wagner Santos on 07/01/22.
//

import Foundation
import SwiftUI

extension View {
    
    // MARK: - Methods
    func textFieldAlert(isPresented: Binding<Bool>, content: @escaping () -> TextFieldAlert) -> some View {
        TextFieldWrapper(isPresented: isPresented, presentingView: self, content: content)
    }
}
