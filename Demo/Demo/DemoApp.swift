
//
//  DemoApp.swift
//  SmartBoard iOS
//
//  Aplicativo principal do teclado SmartBoard.
//

import SwiftUI
import OpenKeyboardKit

/// Ponto de entrada principal do SmartBoard.
///
/// Inicializa o aplicativo utilizando a configuração
/// definida em KeyboardApp+Demo.swift.

@main
struct DemoApp: App {

    var body: some Scene {
        WindowGroup {
            KeyboardAppView(for: .smartBoard) {
                HomeScreen()
            }
        }
    }
}
