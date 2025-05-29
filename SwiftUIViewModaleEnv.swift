//
//  SwiftUIViewModaleEnv.swift
//  EPHOREA APP
//
//  Created by Apprenant173 on 24/09/2024.
//

import SwiftUI

struct Enveloppes {
    var categorie: String // 2 catégories
    var enveloppe: String
    var nomEnveloppe: String // Nom de l'enveloppe (Voyage, Cadeaux, etc.)
    var montantEnveloppe: Double// Objectif
    var epargne: Double // Montant déjà épargné
    var epargneAjout: Double // Ajout d'épargne
    var imageEnveloppe: String
   var progresEpargne: Double = 0
 


    func pourcentageEparne() -> Double {
       return epargne / montantEnveloppe
    }
    
    // Méthode pour ajouter l'épargne au montant total déjà épargné
    mutating func ajouterEpargne() {
        epargne += epargneAjout
        epargneAjout = 0 // Remise à zéro après ajout
    }
}

struct SwiftUIViewModaleEnv: View {

    @Binding var dismissModal: Bool
    
    @State private var vide:String = ""

    @Binding var envelops: [Enveloppes]
    
    // Index de l'enveloppe sélectionnée pour le picker (avec boucle pour passer en revue le tableau envelops avec les objets et leurs propriétés) puis si sélectionnée nom, montant, épargne ajoutée correspondants
    @State private var indexSelectionne: Int = 0
    
    @Binding var changeTotalEpargned: Double

    // Chemin de form différent si urgence choisie : pas d'objectif d'épargne et pas d'image. Passage par des if non enveloppe urgence alors section et textfield à saisir pour les autres enveloppes. Donc ici, ifUrgenceChoisie est vraie à condition que l'enveloppe soit "urgence"
  var ifUrgenceChoisie: Bool {
      return envelops[indexSelectionne].nomEnveloppe == "Urgence"
 }
    
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                Text("Modifier/Ajouter")
                    .foregroundStyle(.white)
                    .padding(18)
                    .font(.custom("Quicksand-SemiBold", size: 24))
                
                
                Form {
                    // Sélection de l'enveloppe dans la liste via l'index
                    Section(header: Text("Enveloppe")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .textCase(nil))
                    {
                        
                        Picker("Choisir une enveloppe", selection: $indexSelectionne) {
                            ForEach(0..<envelops.count, id: \.self) { index in
                                Text(envelops[index].nomEnveloppe)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .listRowBackground(Color.white.opacity(0.8))
                    //                      .font(.custom("Quicksand-SemiBold", size:12))
                    .font(.system(size:12))
                    
                    
                    // Saisie du nom de l'enveloppe
                    Section (header: Text("Nom de l'enveloppe")
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .textCase(nil)) {
                            TextField("Entrer un nom d'enveloppe", text: $envelops[indexSelectionne].nomEnveloppe)
                                .keyboardType(.decimalPad)
                                .listRowBackground(Color.white.opacity(0.8))
                            //                          .font(.custom("Quicksand-SemiBold", size: 12))
                                .font(.system(size:12))
                        }
                    
                    
                    // Saisie du montant de l'enveloppe (objectif)
                    
                    if !ifUrgenceChoisie { Section (header: Text("Objectif d'épargne")
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .textCase(nil)) {
                            TextField("Saisir un montant", value: $envelops[indexSelectionne].montantEnveloppe, format: .number)
                                .keyboardType(.decimalPad)
                                .listRowBackground(Color.white.opacity(0.8))
                            //                              .font(.custom("Quicksand-SemiBold", size: 12))
                                .font(.system(size:12))
                        }
                    }
                    
                    // Visuel du montant déjà épargné
                    
                    if !ifUrgenceChoisie { Section (header: Text("Montant épargné")
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .textCase(nil)) {
                            TextField("Modifier mon épargne actuelle", value: $envelops[indexSelectionne].epargne, format: .number)
                                .keyboardType(.decimalPad)
                                .listRowBackground(Color.white.opacity(0.8))
                            //                          .font(.custom("Quicksand-SemiBold", size: 12))
                                .font(.system(size:12))
                        }}
                    
                    //Visuel du montant déjà épargné pour urgence
        
                    if ifUrgenceChoisie { Section (header: Text("Epargne prévue en cas d'urgence")
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .textCase(nil)) {
                            TextField("Modifier mon épargne actuelle", value: $envelops[indexSelectionne].epargne, format: .number)
                                .keyboardType(.decimalPad)
                                .listRowBackground(Color.white.opacity(0.8))
                            //                          .font(.custom("Quicksand-SemiBold", size: 12))
                                .font(.system(size:12))
                        }}
                    
                    // Saisie du montant d'épargne à ajouter ou à retirer (keyboard en numbersandpunctuation pour prendre en compte le signe "-")
                    Section (header: Text("Ajout d'épargne")
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .textCase(nil)){
                            TextField("Ajouter (+) ou retirer (-) de l'épargne", value: $envelops[indexSelectionne].epargneAjout, format: .number)
                                .keyboardType(.numbersAndPunctuation)
                                .listRowBackground(Color.white.opacity(0.8))
                            //                              .font(.custom("Quicksand-SemiBold", size: 12))
                                .font(.system(size:12))
                        
                    }
                }
                .background(Color.black)
                .scrollContentBackground(.hidden)
                
                // Pour modifier ou choisir une image (bouton pour ouverture explorateur de fichiers)
                if !ifUrgenceChoisie {
                    
                    VStack(spacing:-10){
                        
                        HStack{
                            Text("Modifier ou choisir une image")
                                .foregroundColor(.white)
                                .font(.system(size: 12, weight: .bold, design: .rounded))
                                .textCase(nil)
                            
                            Spacer()
                        }.padding(.leading, 37)
                       
                        HStack{
                            Spacer()
                            Button(action:{}){
                            Image(systemName: "photo.badge.plus")
                                .foregroundColor(.white)
                                .font(.system(size:42))
                        }
                        }.padding(.trailing, 30)
                    }.padding(.bottom, 36)
                }
    

                
                // Boutons Annuler et Valider
                HStack(spacing:50) {
                 Spacer()
                    
                    // Bouton Annuler
                    Button(action: {
                        // Reset la sélection
                        indexSelectionne = 0
                       dismissModal.toggle()
                    }) {
                        Text("Annuler")
                            .padding(13)
                            .background(Color(hex: "#1F7A8D"))
                            .foregroundColor(.white)
//                          .font(.custom("Quicksand-SemiBold", size: 17))
                            .font(.system(size:17))
                            .cornerRadius(30)
                    }
                    
                    
                    // Bouton Valider
                    Button(action: {
                        if envelops[indexSelectionne].enveloppe != "Urgence" {
                            changeTotalEpargned += envelops[indexSelectionne].epargneAjout}
                        print(changeTotalEpargned)
                        print(envelops[indexSelectionne].epargneAjout)
                        envelops[indexSelectionne].ajouterEpargne()
//                        print(envelops)
                        
                       
                     dismissModal.toggle()
                       
                    }) {
                        Text("Valider")
                            .padding(13)
                            .background(Color(hex: "#F21F8A"))
                            .foregroundColor(.white)
//                          .font(.custom("Quicksand-SemiBold", size: 17))
                            .font(.system(size:17))
                            .cornerRadius(30)
                    }
                    
                    Spacer()
                }
                .padding(.bottom, 15)
            }
        }
    
    }
       
}



#Preview {
    SwiftUIViewModaleEnv(dismissModal: .constant(false), envelops: .constant([Enveloppes(categorie: "Mes Projets", enveloppe: "Voyage", nomEnveloppe: "Voyage", montantEnveloppe: 600, epargne: 400, epargneAjout: 0, imageEnveloppe: "")]), changeTotalEpargned: .constant(0))
}

