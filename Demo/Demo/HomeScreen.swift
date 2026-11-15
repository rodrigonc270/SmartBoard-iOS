
//
//  HomeScreen.swift
//  SmartBoard iOS
//
//  Tela inicial e configurações do SmartBoard.
//  Independente do KeyboardKitPro.
//

import SwiftUI

struct HomeScreen: View {

    // MARK: - Campos de teste

    @State private var text = ""
    @State private var textEmail = ""
    @State private var textNumberPad = ""
    @State private var textURL = ""
    @State private var textWebSearch = ""
    @State private var textMultiline = ""

    // MARK: - Configurações

    @AppStorage("smartboard.keyboardHeight")
    private var keyboardHeight = 65.0

    private let minimumHeight = 45.0
    private let maximumHeight = 80.0

    var body: some View {
        NavigationStack {
            Form {

                // MARK: - Apresentação

                Section {
                    VStack(spacing: 12) {
                        Image(systemName: "keyboard")
                            .font(.system(size: 54))
                            .foregroundStyle(.blue)

                        Text("SmartBoard")
                            .font(.largeTitle)
                            .fontWeight(.bold)

                        Text(
                            "Seu teclado personalizado para iOS"
                        )
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 24)
                }

                // MARK: - Ativação

                Section {
                    Text("1. Abra os Ajustes do iPhone.")

                    Text(
                        "2. Acesse Geral > Teclado > Teclados."
                    )

                    Text(
                        "3. Toque em Adicionar Novo Teclado."
                    )

                    Text(
                        "4. Selecione SmartBoard."
                    )

                    Text(
                        "5. Abra um campo de texto e selecione o SmartBoard pelo botão de globo."
                    )
                } header: {
                    Text("Ativar o SmartBoard")
                }

                // MARK: - Altura do teclado

                Section {

                    HStack {
                        Text("Altura selecionada")

                        Spacer()

                        Text(
                            "\(Int(keyboardHeight)) pt"
                        )
                        .foregroundStyle(.secondary)
                        .monospacedDigit()
                    }

                    Slider(
                        value: $keyboardHeight,
                        in: minimumHeight...maximumHeight,
                        step: 1
                    )

                    HStack(spacing: 8) {

                        heightButton(
                            "Compacto",
                            height: 50
                        )

                        heightButton(
                            "Padrão",
                            height: 65
                        )

                        heightButton(
                            "Grande",
                            height: 75
                        )
                    }

                    Button {
                        keyboardHeight = 65
                    } label: {
                        Label(
                            "Restaurar altura padrão",
                            systemImage: "arrow.counterclockwise"
                        )
                    }

                } header: {
                    Label(
                        "Altura do teclado",
                        systemImage: "arrow.up.and.down"
                    )
                } footer: {
                    Text(
                        "A preferência é salva neste aplicativo. A aplicação da altura ao teclado será ativada após configurarmos a comunicação com a extensão."
                    )
                }

                // MARK: - Teste de digitação

                Section {

                    TextField(
                        "Digite uma mensagem",
                        text: $text
                    )
                    .textInputAutocapitalization(.sentences)

                    TextField(
                        "E-mail",
                        text: $textEmail
                    )
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)

                    TextField(
                        "Número",
                        text: $textNumberPad
                    )
                    .keyboardType(.numberPad)

                    TextField(
                        "Endereço de site",
                        text: $textURL
                    )
                    .keyboardType(.URL)
                    .textInputAutocapitalization(.never)

                    TextField(
                        "Pesquisa",
                        text: $textWebSearch
                    )
                    .keyboardType(.webSearch)

                    TextField(
                        "Texto com várias linhas",
                        text: $textMultiline,
                        axis: .vertical
                    )
                    .lineLimit(4...8)

                } header: {
                    Text("Teste de digitação")
                }

                // MARK: - Recursos

                Section {

                    Label(
                        "Linha numérica permanente — funcionando",
                        systemImage: "number"
                    )

                    Label(
                        "Português e inglês simultâneos",
                        systemImage: "globe"
                    )

                    Label(
                        "Sugestões e autocorreção bilíngues",
                        systemImage: "textformat.abc"
                    )

                    Label(
                        "Digitação por gestos (Swipe)",
                        systemImage: "hand.draw"
                    )

                    Label(
                        "Correção automática por IA",
                        systemImage: "sparkles"
                    )

                    Label(
                        "Correção por IA sob demanda",
                        systemImage: "wand.and.stars"
                    )

                } header: {
                    Text("Recursos do SmartBoard")
                } footer: {
                    Text(
                        "A linha numérica já está funcionando. Os demais recursos listados ainda estão em desenvolvimento."
                    )
                }
            }
            .navigationTitle("SmartBoard")
        }
    }

    // MARK: - Botões de altura

    private func heightButton(
        _ title: String,
        height: Double
    ) -> some View {

        Button {
            keyboardHeight = height
        } label: {
            Text(title)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .background(
                    keyboardHeight == height
                    ? Color.accentColor.opacity(0.15)
                    : Color.secondary.opacity(0.08)
                )
                .foregroundStyle(
                    keyboardHeight == height
                    ? Color.accentColor
                    : Color.primary
                )
                .clipShape(
                    RoundedRectangle(cornerRadius: 8)
                )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    HomeScreen()
}
