//
//  Accueil EPHOREIA.swift
//  EPHOREA APP
//
//  Created by Apprenant173 on 24/09/2024.
//

import SwiftUI
struct Rappel: Identifiable {
    let id = UUID()
    let title: String
    let time: String
    let bell: Bool
    var systemImageName: String
}
struct Accueil_EPHOREIA: View {
    
    // VARIABLES POUR LA LISTE DES RAPPELS
    @State private var rappels = [
        Rappel(title: "RDV Préfecture", time: "Dans 2 jours", bell: false, systemImageName: "note.text"),
        Rappel(title: "RDV France Travail", time: "Dans 3 jours", bell: false, systemImageName: "briefcase")
    ]
    
    // VARIABLES POUR AFFICHER LES CALCULS
    @State private var objectifAnnuel: Int = 3000
    @State private var objectifMensuel: Int = 250
    @State private var epargne: Int = 2250
    
    // VARIABLE POUR LA JAUGE
    @State private var completionAmount = 0.75
    
    // VARIABLE RELATIVE A L'ALERTE
   
    @State private var showAlert = false
    

    // VARIABLE ET FONCTION RELATIVES AU POP-UP
    
    @State private var showPopup = false
    func niveauEpargne(montant: Double) -> String {
        switch montant {
        case 0..<600:
            return "Niveau 1"
        case 600..<1200:
            return "Niveau 2"
        case 1200..<1800:
            return "Niveau 3"
        case 1800..<2400:
            return "Niveau 4"
        case 2400..<3000:
            return "Niveau 5"
        default:
            return "Yeah !!!!"
        }
       
    }
    
    //ATTENTION NE PAS SUPPRIMER (Merci ;)
    
    init() {
        
        
        UITabBar.appearance().unselectedItemTintColor = .init(white: 0.8, alpha: 0.8)
       
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.black)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                VStack(alignment: .leading) {
                    
                    
                    //Stack photo/titre/cloche
                    
                    HStack {
                        NavigationLink(destination: Profil_EPHOREIA()) {
                            ZStack{
                                
                                NavigationLink {
                                    Profil_EPHOREIA()
                                } label: {
                                    
                                    Image("alex")
                                        .resizable()
                                        .frame(width: 60.0, height: 40.0)
                                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                        .padding(.leading)
                                }
                                
                                
                                
                            }
                        }
                        
                        Spacer()
                        Text("Dashboard")
                            .foregroundColor(Color(hex: "FFF2A9"))
                        Spacer()
                        
                        Button(action: {
                            if !rappels.isEmpty {
                                showAlert = true
                            }
                        }, label: {
                            Image(systemName: "bell.badge")
                        })
                        .padding(.trailing)
                        .foregroundColor(Color(hex: "FFF2A9"))
                        .alert(isPresented: $showAlert) {
                            // Afficher le premier rappel dans l'alerte
                            let premierRappel = rappels.first!
                            return Alert(
                                title: Text("Premier Rappel"),
                                message: Text("\(premierRappel.title) - \(premierRappel.time)"),
                                dismissButton: .default(Text("OK"))
                            )
                        }
                        
                    } // Fin HStack
                    Spacer()
                    
                    //Composante Hello Alex
                    Text("Hello Alex")
                        .padding(.leading)
                        .foregroundStyle(.white)
                        .font(.title)
                    
                    //Composante jauge
                    
                    ZStack{
                        VStack(spacing: 20) {
                            HStack{
                                ZStack{
                                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                                        .padding(.horizontal)
                                        .frame(width: 400.0, height: 180.0)
                                        .foregroundStyle(Color(hex: "1F7A8D").opacity(0.2))
                                    
                                    //Jauge
                                    ZStack{
                                        Circle()
                                            .stroke(LinearGradient(colors: [Color.gray.opacity(0.3)], startPoint: .bottom, endPoint: .top), lineWidth: 20)
                                            .frame(width: 150, height: 200)
                                            .rotationEffect(.degrees(-90))
                                            .animation(.easeInOut, value: completionAmount) // Animation lors du changement des dépenses
                                        
                                        Circle()
                                                    
                                            .trim(from: 0, to: Double(epargne) / Double(objectifAnnuel))
                                        
                                            .stroke(LinearGradient(colors: [Color.yellow, .orange, .orange, .orange, .mint], startPoint: .bottom, endPoint: .top), lineWidth: 20)
                                            .frame(width: 130, height: 200)
                                            .rotationEffect(.degrees(-90))
                                            .animation(.easeInOut, value: Double(epargne) / Double(objectifAnnuel)) // Animation lors du changement des dépenses
                                        VStack{
                                            ZStack{
                                                Text("\(epargne)")
                                                    .font(.title)
                                                    .fontWeight(.heavy)
                                                    .foregroundStyle(Color(hex: "FFF2A9"))
                                                    .onTapGesture {
                                                        withAnimation {
                                                            showPopup.toggle()
                                                        }
                                                    }
                                            }
                                            // Popup view
                                            if showPopup {
                                                Color.green.opacity(0.7)
                                                    .edgesIgnoringSafeArea(.all) // Fond noir semi-transparent
                                                
                                                VStack(spacing: 20) {
                                                    Image("alex") // Affiche la même image dans le pop-up
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 150, height: 100)
                                                        .clipShape(Circle())
                                                    
                                                    Text(niveauEpargne(montant: Double(epargne)))
                                                        .font(.title)
                                                        .foregroundColor(.white)
                                                        .bold()
                                                    
                                                    Text("Tu y es presque. Bravo!")
                                                        .foregroundColor(.white)
                                                        .multilineTextAlignment(.center)
                                                        .padding(.horizontal, 10)
                                                    
                                                    Button(action: {
                                                        withAnimation {
                                                            showPopup = false
                                                        }
                                                    }) {
                                                        Text("Fermer")
                                                            .foregroundColor(.white)
                                                            .padding()
                                                            .background(Color.gray.opacity(0.8))
                                                            .cornerRadius(10)
                                                    }
                                                }
                                                .padding()
                                                .background(Color.pink)
                                                .cornerRadius(20)
                                                .transition(.scale) // Animation d'apparition/disparition
                                                .frame(width: 300)
                                            }
                                            
                                            
                                            Text("Epargne")
                                                .foregroundStyle(Color(hex: "FFF2A9"))
                                                .font(/*@START_MENU_TOKEN@*/.footnote/*@END_MENU_TOKEN@*/)
                                            
                                        }
                                    }
                                }
                            }// Fin Vstack
                        }
                    }
                    Spacer()
                    
                    //Prévisions et alertes
                    
                    Text("Prévisions")
                        .padding(.leading)
                        .foregroundStyle(.white)
                    
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                                .padding(.leading)
                                .frame(width: 200.0, height: 130.0)
                                .foregroundStyle(Color(hex: "1F7A8D").opacity(0.2))
                            
                            VStack {
                                Image(systemName: "medal.star")
                                    .foregroundColor(Color(hex: "1F7A8D"))
                                Text("Objectif annuel")
                                    .foregroundStyle(Color(hex: "FFF2A9").opacity(0.7))
                                    .font(/*@START_MENU_TOKEN@*/.footnote/*@END_MENU_TOKEN@*/)
                                Text("\(objectifAnnuel) €")
                                    .font(.title)
                                    .foregroundStyle(Color(hex: "FFF2A9"))
                                ProgressView(value: Double(epargne) / Double(objectifAnnuel))
                                    .padding(.horizontal, 15.0)
                                    .frame(width: 180)
                                    .tint(.orange)
                            }
                        } // Fin ZStack
                        
                        ZStack {
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                                .padding(.horizontal)
                                .frame(width: 200.0, height: 130.0)
                                .foregroundStyle(Color(hex: "1F7A8D").opacity(0.2))
                            
                            VStack {
                               
                                Image(systemName: "medal.star.fill")
                                    .foregroundStyle(Color(hex: "F21F8A"))
                                
                                Text("Objectif mensuel")
                                    .foregroundStyle(Color(hex: "FFF2A9").opacity(0.7))
                                    .font(/*@START_MENU_TOKEN@*/.footnote/*@END_MENU_TOKEN@*/)
                                Text("\(objectifMensuel) €")
                                    .font(.title)
                                    .foregroundStyle(Color(hex: "FFF2A9"))
                                ProgressView(value: 1)
                                    .padding(.horizontal, 15.0)
                                    .frame(width: 180)
                                    .tint(.orange)
                                
                            }
                            
                        } // Fin ZStack
                        
                    } // Fin HStack
                    .background(Color.black) // Pour garder le fond noir
                    .scrollContentBackground(.hidden) // Cache le fond par défaut de la liste
                    .padding(.bottom, 20)
                    
                    
                    //RAPPELS ET RENDEZ-VOUS
                    Text("Rappels")
                        .padding(.leading)
                        .padding(.bottom, -40.0)
                        .foregroundStyle(.white)
                    
                    List {
                        ForEach(rappels) { rappel in
                            HStack(spacing: 30) {
                                Image(systemName: rappel.systemImageName)
                                    .font(.system(size: 23))
                                    .foregroundColor(Color(hex: "FFF2A9"))
                                Text(rappel.title)
                                    .font(.system(size: 14))
                                    .foregroundColor(.white)
                                
                                Spacer()
                                Text(rappel.time)
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(hex: "FFF2A9"))
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 2).fill(Color(hex: "1F7A8D").opacity(0.3)))
                        }
                       
                        .background(Color.black) // Pour garder le fond noir
                        .listRowBackground((Color(hex: "1F7A8D").opacity(0.2)))
                    }
                    .scrollContentBackground(.hidden) // Cache le fond blanc de la liste
                    .padding(.bottom, 1)
                    
                    
                } // Fin VStack
                .padding(.horizontal)
                
                
            }
            
        }
      
    }
}

#Preview {
    Accueil_EPHOREIA()
}

