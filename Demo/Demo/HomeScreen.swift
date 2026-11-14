
//
//  HomeScreen.swift
//  SmartBoard iOS
//
//  Tela inicial independente do KeyboardKitPro.
//

import SwiftUI

struct HomeScreen: View {

    @State private var text = ""
    @State private var textEmail = ""
    @State private var textNumberPad = ""
    @State private var textURL = ""
    @State private var textWebSearch = ""
    @State private var textMultiline = ""

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    VStack(spacing: 12) {
                        Image(systemName: "keyboard")
                            .font(.system(size: 54))
                            .foregroundStyle(.blue)

                        Text("SmartBoard")
                            .font(.largeTitle)
                            .fontWeight(.bold)

                        Text("Seu teclado personalizado para iOS")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 24)
                }

                Section("Ativar o SmartBoard") {
                    Text("1. Abra os Ajustes do iPhone.")
                    Text("2. Acesse Geral > Teclado > Teclados.")
                    Text("3. Toque em Adicionar Novo Teclado.")
                    Text("4. Selecione SmartBoard, se estiver disponível.")
                    Text("5. Abra um campo de texto e selecione o SmartBoard pelo botão de globo.")
                }

                Section("Teste de digitação") {
                    TextField("Digite uma mensagem", text: $text)
                        .textInputAutocapitalization(.sentences)

                    TextField("E-mail", text: $textEmail)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)

                    TextField("Número", text: $textNumberPad)
                        .keyboardType(.numberPad)

                    TextField("Endereço de site", text: $textURL)
                        .keyboardType(.URL)
                        .textInputAutocapitalization(.never)

                    TextField("Pesquisa", text: $textWebSearch)
                        .keyboardType(.webSearch)

                    TextField(
                        "Texto com várias linhas",
                        text: $textMultiline,
                        axis: .vertical
                    )
                    .lineLimit(4...8)
                }

                Section("Recursos planejados") {
                    Label(
                        "Português e inglês simultâneos",
                        systemImage: "globe"
                    )

                    Label(
                        "Linha numérica permanente",
                        systemImage: "number"
                    )

                    Label(
                        "Altura do teclado ajustável",
                        systemImage: "arrow.up.and.down"
                    )

                    Label(
                        "Sugestões e autocorreção bilíngues",
                        systemImage: "textformat.abc"
                    )
                } footer: {
                    Text(
                        "Os recursos listados estão em desenvolvimento e ainda precisam ser implementados e testados."
                    )
                }
            }
            .navigationTitle("SmartBoard")
        }
    }
}

#Preview {
    HomeScreen()
}
