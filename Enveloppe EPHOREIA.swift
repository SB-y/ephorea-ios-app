//
//  Enveloppe EPHOREIA.swift
//  EPHOREA APP
//
//  Created by Apprenant173 on 24/09/2024.
//

import SwiftUI

struct Enveloppe_EPHOREIA: View {
    @State private var showModal:Bool = false // Modal initialement fermée
       
       @State private var isPopupUrg = false // Modal popup urgence fermée
    
       
       @State private var enveloppes: [Enveloppes] = [
           Enveloppes(categorie: "Mes Projets", enveloppe: "Voyage", nomEnveloppe: "Voyage", montantEnveloppe: 600, epargne: 300, epargneAjout: 0, imageEnveloppe: "image-voyage"),
           Enveloppes(categorie: "Mes Projets", enveloppe: "Cadeaux", nomEnveloppe: "Cadeaux", montantEnveloppe: 200, epargne: 50, epargneAjout: 0, imageEnveloppe: "image-cadeaux"),
           Enveloppes(categorie: "Mes Projets", enveloppe: "Permis", nomEnveloppe: "Permis", montantEnveloppe: 1400, epargne: 1050, epargneAjout: 0, imageEnveloppe: "image-permis"),
           Enveloppes(categorie: "Mes Projets", enveloppe: "Etudes", nomEnveloppe: "Etudes", montantEnveloppe: 800, epargne: 600, epargneAjout: 0, imageEnveloppe: "image-etudes"),
           Enveloppes(categorie: "Mes projets", enveloppe: "Nouvelle enveloppe", nomEnveloppe: "Nouvelle enveloppe", montantEnveloppe: 1, epargne:0, epargneAjout:0, imageEnveloppe: ""),
           Enveloppes(categorie: "Enveloppe urgence", enveloppe: "Urgence", nomEnveloppe: "Urgence", montantEnveloppe: 1, epargne: 270, epargneAjout: 0, imageEnveloppe:"")
       ]
       
       
       
       // Si utilisée sur dashboard ; sumTotalAjoutMens correspond à l'épargne totale mensuelle mise à jour
       @State private var sumTotalAjoutMens: Double = 0 // Utilisée pour le reste à épargner le mois
       
       // 1ère version pour avoir l'épargne totale annuelle mise à jour. Si utilisée sur dashboard ; totalMontantEpargned3 correspond à l'épargne totale annuelle mise à jour (dropLast pour ne pas compter urgence)
       var totalMontantEpargned3 : Double {
           var sum3 = 0.0
           for enveloppe in enveloppes.dropLast() {
               sum3 += enveloppe.epargne
           }
           return sum3
       }
       
       /* 2ème version pour avoir l'épargne totale annuelle mise à jour. Si utilisée sur dashboard ; totalMontantEpargned2 correspond à l'épargne totale annuelle mise à jour
        var totalMontantEpargned2: Double {
        enveloppes[0].epargne +  enveloppes[1].epargne + enveloppes[2].epargne +  enveloppes[3].epargne + enveloppes[4].epargne}
        */
       
       /* 3ème version pour avoir l'épargne totale annuelle mise à jour. Si utilisée sur dashboard ; totalMontantEpargned correspond à l'épargne totale annuelle mise à jour
        var totalMontantEpargned : Double {
        sumTotalAjoutMens+2250    } // à partir de ModaleTest en additionnant les épargnes dans le bouton, et en récupérant la variable sur MesEnveloppes, cela part de 0 donc pour la présentation, partir de 2250
        */
       
       @State private var objectifEpargne:Double = 3000 // A aller chercher dans le profil
       
       // Autre façon d'avoir objectif total épargne
       /*    var objectifEpargne2 : Double {
           var sumobj = 0.0
           for enveloppe in enveloppes.dropLast() {
               sumobj += enveloppe.montantEnveloppe
           }
           return sumobj
            } */
       
       
       @State private var objectifEpargneMens: Double = 250 // A aller chercher dans profil
       
    
    
    var body: some View {
        ZStack{
                   
                   Color.black.ignoresSafeArea()
                   
            
                       
                       VStack {
                           
                           Text("Mes enveloppes")
                               .padding(.top, 20)
                               .font(.system(size: 30))
                               .foregroundStyle(Color(hex: "FFF2A9"))
                               .padding([.bottom], 22)
                              
                               
                           ScrollView(.vertical){
                           
                           VStack {
                               ZStack{
                                   
                                   HStack {
                                       
                                       ZStack{
                                        
                                           Circle()
                                               .stroke(LinearGradient(colors: [.mint, .mint, .mint], startPoint: .bottom, endPoint: .top), lineWidth: 20)
                                               .shadow(radius:10)
                                               .frame(width: 150, height: 220)
                                               .rotationEffect(.degrees(-90))
                                               .animation(.easeInOut, value: totalMontantEpargned3 / objectifEpargne) // Animation lors du changement des dépenses
                                           Circle()
                                               .trim(from: 0, to: totalMontantEpargned3 / objectifEpargne)
                                               .stroke(LinearGradient(colors: [.yellow, .orange, .orange], startPoint: .bottom, endPoint: .top), lineWidth: 20)
                                               .shadow(radius:10)
                                               .frame(width: 140, height: 180)
                                               .rotationEffect(.degrees(-90))
                                               .animation(.easeInOut, value: totalMontantEpargned3 / objectifEpargne) // Animation lors du changement des dépenses
                                       }
                                       .padding(.trailing, 40)
                                       
                                       // Texte au centre du cercle
                                       VStack {
                                           Text("\(Int(totalMontantEpargned3)) €")
                                               .font(.title)
       //                                      .bold()
                                               .foregroundStyle((Color(hex: "#FFF2A9")))
                                           Text("épargnés sur")
                                               .font(.footnote)
                                               .foregroundStyle(Color(hex: "#FFF2A9"))
                                           Text("\(Int(objectifEpargne)) €")
                                               .font(.title)
                                               .foregroundStyle(.mint)
       //                                      .bold()
                                       }
                                   }
                                  
                                   
                               }
                             
                               
                              
                           }
                           .frame(width: 380, height: 215)
                           .background(Color(hex: "1F7A8D").opacity(0.2))
                           
                          
                           
                           
                           
                           HStack(spacing:60) {
                               
                               VStack(alignment:.leading){
                                   
                                   Text("Mes projets")
                                       .foregroundStyle((Color(hex: "#FFF2A9")))
       //                                .font(.custom("Quicksand-SemiBold", size:22))
                                       .font(.system(size:22, weight : .bold, design: .rounded))
                                       .padding(.bottom, -2)
                                   
                                   Text("Reste \(Int(250-(sumTotalAjoutMens))) € à épargner pour ce mois")
                                       .foregroundStyle(.white)
       //                              .font(.custom("Quicksand-SemiBold", size:16))
                                       .font(.system(size:16, design: .rounded))
                               }
                               Spacer()
                               
                           }
                           .padding([.leading, .bottom, .trailing], 16.0)
                           .padding([.top], 25.0)// Ferme la HStack mes projets et total enveloppes épargnes vers la gauche
                           
                           
                           ScrollView(.horizontal){
                               
                               // Enveloppes successives
                               HStack {
                                   
                                   /*            CapsuleEnveloppe(imageEnveloppe: "image-voyage",  pourcentageEpargne: 67, progressEpargne: 0.67, nomEnveloppe: "Voyage", envelops: enveloppes[0])
                                    
                                    CapsuleEnveloppe(imageEnveloppe: "image-cadeaux",  pourcentageEpargne:25, progressEpargne: 0.25, nomEnveloppe: "Cadeaux", envelops: enveloppes[1])
                                    
                                    CapsuleEnveloppe(imageEnveloppe: "image-permis",  pourcentageEpargne: 86, progressEpargne: 0.86, nomEnveloppe: "Permis", envelops: enveloppes[2])
                                    
                                    CapsuleEnveloppe(imageEnveloppe: "image-etudes",  pourcentageEpargne: 75, progressEpargne:  0.75, nomEnveloppe: "Etudes", envelops: enveloppes[3])
                                    
                                    CapsuleEnveloppe(imageEnveloppe: "",  pourcentageEpargne: 0, progressEpargne:  0, nomEnveloppe: "Nouvelle enveloppe", envelops: enveloppes[4])
                                    */
                                   
                                   // dropLast(1) pour retirer le dernier element du tableau (urgence)
                                   ForEach(enveloppes.dropLast(1).indices, id: \.self) {index in
                                       CapsuleEnveloppe(imageEnveloppe : enveloppes[index].imageEnveloppe, pourcentageEpargne: enveloppes[index].pourcentageEparne()*100, progressEpargne: enveloppes[index].pourcentageEparne(), nomEnveloppe:enveloppes[index].nomEnveloppe, envelops: enveloppes[index])
                                   }
                               }
                           }
                           .padding([.top, .leading], 16.0)
                           
                           
                           // Début condition popup (à déplacer au bon endroit pour placement ouverture)
                           if isPopupUrg {
                               
                               VStack(spacing: 30) {
                                   Text("Il est possible de prévoir de l'argent pour les petits (ou gros) pépins !")
                                       .foregroundColor(.white)
                                       .font(.system(size:15))
                                       .multilineTextAlignment(.center)
                                       .padding(.horizontal, 20)
                                   
                                   Button(action: {
                                       withAnimation {
                                           isPopupUrg = false
                                       }
                                   }) {
                                       Text("Ok, j'ai compris")
                                           .font(.system(size:15))
                                           .bold()
                                           .foregroundColor(.black)
                                           .padding(8)
                                           .background(.yellow)
                                           .cornerRadius(10)
                                   }
                               }
                               .padding()
                               .background(Color(hex: "#1F7A8D").opacity(0.8))
                               .cornerRadius(20)
                               .transition(.scale) // Animation d'apparition/disparition
                               .frame(width: 300, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                           } // Fin condition ouverture popup
                           
                           HStack(spacing:100){
                               VStack(alignment:.leading) {
                                   
                                   HStack{
                                       Text("Urgence")
                                           .foregroundStyle((Color(hex: "#FFF2A9")))
       //                                   .font(.custom("Quicksand-SemiBold", size:22))
                                           .font(.system(size:22, weight : .bold, design: .rounded))
                                       
                                       Image(systemName: "figure.walk.motion.trianglebadge.exclamationmark")
                                           .resizable()
                                           .frame(width: 28, height: 23)
                                           .foregroundStyle((Color(hex: "#FFF2A9")))
                                           .onTapGesture {
                                               withAnimation {
                                                   isPopupUrg.toggle()}
                                           } // Fin ontap
                                       
                                    
                                   } // Fin HStack urgence et symbol
                                    
                                       
                                       Text("\(Int(enveloppes[5].epargne)) € prévus")
                                       .foregroundStyle(.white)
       //                                  .font(.custom("Quicksand-SemiBold", size:16))
                                           .font(.system(size:16, design: .rounded))
                                   }
                               .padding([.leading], 16.0)
                               .padding([.top], 25.0)// Fin HStack urgence + symbol + montant urg prévu
                               
                                   
                                   // En appuyant sur ce bouton, ouverture modal formulaire
                              
                                       ZStack{
                                           
                                           Color.black
                                           
                                           Button(action:{
                                               showModal.toggle()
                                               
                                           }, label:{
                                               Image(systemName: "plus.circle.fill")
                                                   .resizable()
                                                   .frame(width: 48, height: 48, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                   .foregroundStyle(.white)
                                           })
                                           .sheet(isPresented: $showModal){
                                               SwiftUIViewModaleEnv(dismissModal:$showModal, envelops: $enveloppes, changeTotalEpargned: $sumTotalAjoutMens)
                                           }
                                   }
                                   .padding([.top], 35.0)
                                   .padding([.trailing], -60)
                               }
                               .padding(.bottom, 10) // Ferme la HStack mon enveloppe de secours
                               
                               
                           } // Ferme la VStack de la safe area
                           .padding([.leading, .trailing], 16) // pour les marges de 16 sur les côtés
                           .padding(.bottom, 1)
                       } // Ferme la scrollview vertical
                       
                   }
               }
    }
struct CapsuleEnveloppe: View {
      var imageEnveloppe: String
      var pourcentageEpargne: Double
      var progressEpargne: Double
      var nomEnveloppe: String
      var envelops: Enveloppes
      
      var body: some View {
          VStack {
              //action du button, supprimer enveloppe. Sinon possibilité, modifier infos via form à partir enveloppe existante
              Button(action: {}, label: {
                  ZStack(alignment: .top) {
                      RoundedRectangle(cornerRadius: 20.0)
                          .frame(width: 100, height: 160)
                          .foregroundStyle(Color(hex: "#1F7A8D"))
                          .opacity(0.5)
                      
                      VStack {
                          Image(envelops.imageEnveloppe)
                              .resizable()
                              .frame(width: 100, height: 82)
                              .clipShape(UnevenRoundedRectangle(topLeadingRadius: 20, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 20))
                          
                          Text("\(Int(envelops.pourcentageEparne()*100))%")
                              .foregroundStyle(.white)
                              .font(.system(size: 18, design: .rounded))
                              .padding(8)
                          
                          ProgressView(value: envelops.pourcentageEparne())
                              .padding(.horizontal)
                              .frame(width: 110)
                              .tint(Color(hex: "#F21F8A"))
                      }
                  }
              })
              Text(envelops.nomEnveloppe)
                  .font(.system(size: 15, weight: .bold, design: .rounded))
                  .foregroundStyle(Color.white)
          }
      }
  }


#Preview {
    Enveloppe_EPHOREIA()
}
