//
//  TextFieldAlert.swift
//  CustomAlert
//
//  Created by Wagner Santos on 07/01/22.
//

import Foundation
import SwiftUI

struct TextFieldAlert {
    
    // MARK: Properties
    let action: Action
    var isPresented: Binding<Bool>? = nil

    // MARK: - Methods
    func dismissable(_ isPresented: Binding<Bool>) -> TextFieldAlert {
        TextFieldAlert(action: action, isPresented: isPresented)
    }
}

extension TextFieldAlert: UIViewControllerRepresentable {

    typealias UIViewControllerType = TextFieldAlertViewController

    func makeUIViewController(context: UIViewControllerRepresentableContext<TextFieldAlert>) -> UIViewControllerType {
        TextFieldAlertViewController(action: action, isPresented: isPresented)
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<TextFieldAlert>) {}
}
