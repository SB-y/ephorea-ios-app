//
//  AddLineModalView.swift
//  EPHOREA APP
//
//  Created by Apprenant173 on 25/09/2024.
//

import SwiftUI

struct AddLineModalView: View {
    @Binding var isModalPresented: Bool
    @Binding var newLine: String
    @Binding var selectedSection: String
    let sections: [String]
    var addLineAction: () -> Void
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                Text("Ajouter une ligne")
                    .foregroundStyle(.white)
                    .padding(25)
                    .font(.custom("Quicksand-SemiBold", size: 24))
                
                Form {
                    // Section pour choisir la section avec un HStack
                    Section {
                        HStack {
                            Text("Section :") // Label pour la section
                                .foregroundColor(.black)
                                .padding(.leading)
                            
                            Spacer() // Espace entre le label et le Picker
                            
                            Picker("", selection: $selectedSection) {
                                ForEach(sections, id: \.self) { section in
                                    Text(section).tag(section)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .foregroundColor(.pink) // Couleur du texte du Picker
                        }
                    }
                    
                    // Saisie du texte de la ligne
                    Section(header: Text("Texte de la ligne")
                        .foregroundColor(.white)
                        .textCase(nil)
                    ) {
                        TextField("Entrez votre ligne", text: $newLine)
                            .listRowBackground(Color.white.opacity(0.8))
                    }
                }
                .background(Color.black)
                .scrollContentBackground(.hidden)
                
                // Boutons Annuler et Valider
                HStack(spacing: 30) {
                    // Bouton Annuler
                    Button(action: {
                        isModalPresented = false
                    }) {
                        Text("Annuler")
                            .padding(13)
                            .background(Color(hex: "1F7A8D"))
                            .foregroundColor(.white)
                            .font(.custom("Quicksand-SemiBold", size: 17))
                            .cornerRadius(30)
                    }
                    
                    // Bouton Valider
                    Button(action: {
                        addLineAction() // Appel de la fonction pour ajouter la ligne
                        isModalPresented = false
                    }) {
                        Text("Valider")
                            .padding(13)
                            .background(Color(hex: "F21F8A"))
                            .foregroundColor(.white)
                            .font(.custom("Quicksand-SemiBold", size: 17))
                            .cornerRadius(30)
                    }
                }
                .padding(.bottom, 25)
            }
        }
    }
}

#Preview {
    // Exemple de données pour la prévisualisation
    struct PreviewWrapper: View {
        @State private var isModalPresented = true
        @State private var newLine = ""
        @State private var selectedSection = "Civile"
        let sections = ["Civile", "Mobilité", "Santé", "Scolarité", "Protection", "Finance", "Insertion pro"]

        var body: some View {
            AddLineModalView(
                isModalPresented: $isModalPresented,
                newLine: $newLine,
                selectedSection: $selectedSection,
                sections: sections,
                addLineAction: {
                    // Logique d'ajout, ici pour l'exemple, on peut laisser vide
                    print("Ligne ajoutée : \(newLine) à la section \(selectedSection)")
                    newLine = "" // Réinitialiser la ligne après ajout
                }
            )
        }
    }
    return PreviewWrapper()
}
