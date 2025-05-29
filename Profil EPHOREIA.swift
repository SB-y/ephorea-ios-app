//
//  Profil EPHOREIA.swift
//  EPHOREA APP
//
//  Created by Apprenant173 on 24/09/2024.
//

import SwiftUI

struct Profil_EPHOREIA: View {
    
    init() {
            UITextField.appearance().tintColor = .red
        }
        
        @State private var color = Color.black
        
       
        @State private var showFormulaireProfil = false
        @State private var showObjectifs = false
        @State private var showNotifications = false
        @State private var showAide = false
       
        @State private var nom = "Simplon"
        @State private var prenom = "Alex"
    @State private var dateNaissance = Date()
        
        
        @State private var objectifMensuel: Double = 250
        @State private var objectifAnnuel: Double = 3000
        
        @State private var isActivated: Bool = false
        
        @State private var isOn: Bool = false
        
            func updateNom(_ newNom: String) {
            nom = newNom
        }
        
        func updatePrenom(_ newPrenom: String) {
            prenom = newPrenom
        }
        
        func updateDateNaissance(_ newDate: Date) {
            dateNaissance = newDate
        }
        
        func updateObjectifMensuel(_ newObjectif: Double) {
            objectifMensuel = newObjectif
        }
        
        func updateObjectifAnnuel(_ newObjectif: Double) {
            objectifAnnuel = newObjectif
        }
        
        
        var body: some View {
            
            
            VStack {
               
                ZStack {
                   
                    Color.black
                        .ignoresSafeArea()
                   Rectangle()
                        .foregroundColor(Color(hex: "1F7A8D").opacity(0.1))
                    
                    ScrollView {
                        VStack {
                            HStack {
                                Button(action: {
                                    
                                }, label: {
                                    Image(systemName: "pencil")
                                        .foregroundColor(.black)
                                })
                                .foregroundColor(.white)
                                .font(.title)
                                
                                Spacer()
                                   
                                Text("Mon profil")
                                    .padding(.top, 20)
                                    .font(.system(size: 30))
                                    .foregroundStyle(Color(hex: "FFF2A9"))
                                    
                                
                                Spacer()
                                
                                Button(action: {
                                    showFormulaireProfil.toggle()
                                    print(showFormulaireProfil)
                                    
                                }, label: {
                                    Image(systemName: "pencil")
                                })
                                .foregroundColor(.white)
                                .font(.title)
                            }
        // Fin HStack Profil/Pencil
                            
                          
                            
                            VStack(spacing: 16) {
                                
        //PROFIL
                                HStack{
                                    ZStack {
                                        Circle()
                                            .frame(width: 230, height: 230)
                                            .foregroundColor(Color(hex: "1F7A8D").opacity(0.2))
                                        Circle()
                                            .stroke(LinearGradient(colors: [Color.mint, .yellow, .orange, .yellow, .orange], startPoint: .bottom, endPoint: .top), lineWidth: 5)
                                            .frame(width: 140, height: 200)
                                        
                                        
                                        Image("alex")
                                        .resizable()
                                        .frame(width: 150.0, height: 120)
                                        .clipShape(Circle())
                                       
                                        .onTapGesture {
                                            withAnimation {
                                                isOn.toggle()
                                            }
                                        }
                                        if isOn {
                                            Color.black.opacity(0.7)
                                                                      .edgesIgnoringSafeArea(.all)
                                            
                    // Fond noir semi-transparent

                                                                  VStack(spacing: 20) {
                                                                      Image("alex")
                                                                                                     .resizable()
                                                                                                     .scaledToFit()
                                                                                                     .frame(width: 150, height: 80)
                                                                                                     .clipShape(Circle())
                                                                                      Text("Photo")
                                                                          .font(.largeTitle)
                                                                          .foregroundColor(.white)
                                                                          .bold()

                                                                      Text("Mettre à jour la photo de profil")
                                                                          .foregroundColor(.white)
                                                                          .multilineTextAlignment(.center)
                                                                          .padding(.horizontal, 20)

                                                                      Button(action: {
                                                                          withAnimation {
                                                                              isOn = false
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
                                                                  .background(Color(hex: "FFA21F"))
                                                                  .cornerRadius(20)
                                                                  .transition(.scale)
                                            
                // Animation d'apparition/disparition
                                                                  .frame(width: 300)
                                                                                    }
                                    }
       
                                }
                                HStack(spacing: 70) {
                                    VStack{
                                        Text("Mensuel")
                                        Text("\(Int(objectifMensuel))")
                                            .font(.system(size: 50)
                                                  )
                                            
                                    }
                                    .foregroundColor(Color(hex: "FFF2A9"))
                                    
                                   
                                        
                                        VStack{
                                            Text("Annuel")
                                            Text("\(Int(objectifAnnuel))")
                                                .font(.system(size: 50)
                                                      )
                                                
                                        }
                                        .foregroundColor(Color(hex: "FFF2A9"))
                                    
                                }
                                .frame(height: nil) // End HStack photo de profil et objectifs
                             
                              
                                if showFormulaireProfil {
                                    
                                    VStack {
                                        
                                      
                                        ZStack{
                                            
                                            Rectangle()
                                                .foregroundStyle(.white)
                                                .cornerRadius(20)
                                            
                                            
                                            TextField("", text: $nom)
                                                .placeholder(when: nom.isEmpty) {
                                                    Text("Nom")
                                                        .foregroundColor(.black)
                                            }
                                                .frame(height: 40)
                                                .padding(.leading, 20)
                              
                                        }
                                        .padding(.bottom, 15)
                                        
                                        ZStack{
                                            Rectangle()
                                                .foregroundStyle(.white)
                                                .cornerRadius(25)
                                            
                                            TextField("", text: $prenom)
                                                .placeholder(when: prenom.isEmpty) {
                                                    Text("Prenom")
                                                        .foregroundColor(.black)
                                            }
                                                .frame(height: 40)
                                                .padding(.leading,20)
                        }.padding(.bottom, 15)
                                        
                                        ZStack{
                                            Rectangle()
                                                .foregroundStyle(.white)
                                                .cornerRadius(25)
                                            
                                            DatePicker("Date de naissance", selection: $dateNaissance, displayedComponents: .date)
                                                .foregroundStyle(.black)
                                                .padding(.leading,20)
                                                .font(.system(size: 18))
                                                .frame(height: 40)
                                        }
                                        .padding(.bottom, 20)
                                    }
                                } //fin du if
                                   
                                
                                
                                
                                }
                            
                           
                                
                           

                                                           VStack(spacing: 16) {
                                                               
            // SECTION OBJECTIFS D EPARGNE
                                                               Button(action: {
                                                                   withAnimation {
                                                                       showObjectifs.toggle()
                                                                   }
                                                               }) {
                                                                   HStack {
                                                                       Image(systemName: "target")
                                                                           .foregroundColor(Color(hex: "FFF2A9"))
                                                                       Text("Objectifs d'épargne")
                                                                           .font(.system(size: 16))
                                                                           .foregroundStyle(.white)
                                                                       Spacer()
                                                                       Image(systemName: showObjectifs ? "chevron.down" : "chevron.right")
                                                                           .foregroundColor(.white)
                                                                   }
                                                                   .padding()
                                                                   .background(RoundedRectangle(cornerRadius: 10).fill(Color(hex: "1F7A8D").opacity(0.6)))
                                                               }

                                                               if showObjectifs {
                                                                   VStack {
                                                                       TextField("Objectif Mensuel", value: $objectifMensuel, format: .number)
                                                                           .textFieldStyle(RoundedBorderTextFieldStyle())
                                                                           .keyboardType(.numberPad)
                                                                           .padding(.bottom)
                                                                       TextField("Objectif Annuel", value: $objectifAnnuel, format : .number)
                                                                           .textFieldStyle(RoundedBorderTextFieldStyle())
                                                                           .keyboardType(.numberPad)
                                                                           .padding(.bottom)
                                                                   }
                                                                   
                                                               }

                                                               
                                
                //SECTION NOTIFICATION
                                Button(action: {
                                        
                                    showNotifications.toggle()
                                                               }) {
                                                                   HStack {
                                                                       Image(systemName: "bell")
                                                                           .foregroundColor(Color(hex: "FFF2A9"))
                                                                       Text("Notifications")
                                                                           .font(.system(size: 16))
                                                                           .foregroundStyle(.white)
                                                                       Spacer()
                                                                       Image(systemName: showNotifications ? "chevron.down" : "chevron.right")
                                                                           .foregroundColor(.white)
                                                                   }
                                                                   .padding()
                                                                   .background(RoundedRectangle(cornerRadius: 10).fill(Color(hex: "1F7A8D").opacity(0.6)))
                                                               }

                                                               if showNotifications {
                                                                   
                                                                          Toggle(isOn: $isActivated){Text("Activer les notifications")}
                                                                       .toggleStyle(.switch)
                                                                       .padding(.leading,16)
                                        .transition(.slide)
                                        .foregroundColor(.white)
                                                               }
                                                               else {
                                                                               }

                                                               // Aide section
                                                               Button(action: {
                                                                   withAnimation {
                                                                       showAide.toggle()
                                                                   }
                                                               }) {
                                                            
                                     
                //SECTION AIDE
                                                                   
                                                                   HStack {
                                                                       Image(systemName: "questionmark.circle")
                                                                           .foregroundColor(Color(hex: "FFF2A9"))
                                                                       Text("Aide")
                                                                           .font(.system(size: 16))
                                                                           .foregroundStyle(.white)
                                                                       Spacer()
                                                                       Image(systemName: showAide ? "chevron.down" : "chevron.right")
                                                                           .foregroundColor(.white)
                                                                           .padding(.bottom, 1)
                                                                   }
                                                                   .padding()
                                                                   .background(RoundedRectangle(cornerRadius: 10).fill(Color(hex: "1F7A8D").opacity(0.6)))
                                                               }

                                                               if showAide {
                                                                   HStack{                          VStack(alignment: .leading) {
                                                                    
                                                                       Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                                                    Text("Signaler un problème")
                                                                               .padding(.bottom, 10)
                                                                       })
                                                                       
                                                                       Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                                                    Text("Statut du compte")
                                                                               .padding(.bottom, 10)
                                                                       })
                                                                           Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {Text("Confidentialité et Sécurité")
                                                                           })
                                                                   }
                                                                   .foregroundColor(.white)
                                                                       Spacer()
                                                                }
                                                                   .padding(.leading, 16) 
                                                                    }
                                                    
                                                           }
                                                         
                        }
                       
                    }
                    .padding(.bottom, 1)
                                               }
                        }
                    }
                    
                }
                
            
         
        


extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder()
                .opacity(shouldShow ? 1 : 0)
            self
        }
    }
}


#Preview {
    Profil_EPHOREIA()
}
