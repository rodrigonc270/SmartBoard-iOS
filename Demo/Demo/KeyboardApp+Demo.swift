
//
//  KeyboardApp+Demo.swift
//  SmartBoard iOS
//
//  Configuracao principal do teclado SmartBoard.
//

import Foundation
import OpenKeyboardKit

extension KeyboardApp {

    /// Configuracao principal do SmartBoard.
    static var smartBoard: KeyboardApp {
        .init(
            name: "SmartBoard",
            locales: [
                Locale(identifier: "pt_BR"),
                Locale(identifier: "en_US")
            ],
            autocomplete: .init(),
            deepLinks: .init(
                app: "smartboard://"
            ),
            keyboardSettingsKeyPrefix: "smartboard"
        )
    }

    /// Mantem compatibilidade com os arquivos
    /// existentes da demonstracao.
    static var keyboardKitDemo: KeyboardApp {
        smartBoard
    }
}
