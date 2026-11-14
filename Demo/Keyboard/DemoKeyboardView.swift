
//
//  DemoKeyboardView.swift
//  SmartBoard iOS
//
//  Baseado no OpenKeyboardKit
//  Personalização inicial do SmartBoard
//

import OpenKeyboardKit
import SwiftUI

/// Interface principal do SmartBoard.
struct DemoKeyboardView: View {

    let services: Keyboard.Services
    let state: Keyboard.State

    @EnvironmentObject var keyboardContext: KeyboardContext

    var body: some View {
        KeyboardView(
            layout: layout,
            state: state,
            services: services,
            buttonContent: { $0.view },
            buttonView: { $0.view },
            collapsedView: { $0.view },
            emojiKeyboard: { $0.view },
            toolbar: { _ in
                Keyboard.Toolbar {
                    HStack {
                        Spacer()

                        Text("SmartBoard")
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundColor(.secondary)

                        Spacer()
                    }
                }
            }
        )

        // Mantém o estilo padrão das teclas.
        .keyboardButtonStyle { params in
            params.standardStyle(for: keyboardContext)
        }

        // Mantém os caracteres alternativos.
        .keyboardCalloutActions { params in
            params.standardActions(for: keyboardContext)
        }
    }
}

// MARK: - Layout personalizado

private extension DemoKeyboardView {

    var layout: KeyboardLayout {

        // Carrega o layout padrão do teclado.
        var layout = KeyboardLayout.standard(
            for: keyboardContext
        )

        // SmartBoard: altura inicial das teclas.
        // Valor experimental em pontos.
        layout.idealItemHeight = 65

        // Adiciona os números somente
        // quando o teclado é alfabético.
        guard keyboardContext.keyboardType == .alphabetic else {
            return layout
        }

        // Cria a linha numérica permanente.
        let numberRow = "1234567890".map { number in

            var item = layout.createIdealItem(
                for: .character(String(number))
            )

            // Utiliza a largura padrão
            // das teclas de digitação.
            item.size.width = .input

            return item
        }

        // Insere a linha numérica acima
        // das linhas de letras.
        layout.itemRows.insert(numberRow, at: 0)

        return layout
    }
}
