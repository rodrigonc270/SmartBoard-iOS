
//
//  DemoKeyboardMenu.swift
//  SmartBoard iOS
//
//  Menu simplificado do SmartBoard.
//  Interface baseada em SwiftUI.
//

import SwiftUI
import OpenKeyboardKit

struct DemoKeyboardMenu: View {

    let actionHandler: KeyboardActionHandler

    @Binding var isTextInputActive: Bool
    @Binding var isToolbarToggled: Bool
    @Binding var sheet: DemoSheet?

    var body: some View {

        ScrollView(.vertical) {

            LazyVGrid(
                columns: [
                    GridItem(
                        .adaptive(minimum: 115),
                        spacing: 10
                    )
                ],
                spacing: 10
            ) {

                menuItem(
                    title: "Digitação",
                    icon: "square.and.pencil",
                    color: .teal
                ) {
                    isTextInputActive.toggle()
                }

                menuItem(
                    title: "SmartBoard",
                    icon: "keyboard",
                    color: .blue
                ) {
                    // Reservado para futuras configurações.
                }

                menuItem(
                    title: "Fechar menu",
                    icon: "xmark.circle",
                    color: .gray
                ) {
                    // O menu fecha automaticamente.
                }
            }
            .padding(10)
        }
    }

    private func menuItem(
        title: String,
        icon: String,
        color: Color,
        action: @escaping () -> Void
    ) -> some View {

        Button {

            withAnimation {
                isToolbarToggled.toggle()
                action()
            }

        } label: {

            VStack(spacing: 10) {

                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(color)

                Text(title)
                    .font(.footnote)
                    .foregroundColor(.primary)
                    .lineLimit(1)
            }
            .frame(maxWidth: .infinity)
            .padding(10)
        }
        .buttonStyle(.bordered)
    }
}
