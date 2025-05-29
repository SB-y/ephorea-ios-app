//
//  Demarche.swift
//  EPHOREA APP
//
//  Created by Apprenant173 on 25/09/2024.
//

import SwiftUI

struct Demarche: View {
    
    
    @State var catCivile: [String] = ["Obtenir une carte d’identité", "Réaliser la JDC", "Renouveler le passeport", "Remplir une déclaration Impots", "Demande de prime d’activité"]
    @State var catMobilité: [String] = ["Passer l’examen du code de la route", "Créer le compte ANTS", "demander son numéro d’enregistrement préfectoral harmonisé (NEPH)"]
    @State var catSanté: [String] = ["Demander la carte vitale et s’inscrire à la sécurité sociale", "Choisir le médecin traitant", "réaliser un bilan de santé complet et/ou spécifique", "handicap : collecter les pièces nécessaires à la MDPH", "Créer un compte Ameli"]
    @State var catScolarité: [String] = ["Procéder aux inscriptions scolaires", "Vérifier l’obtention des attestations scolaires de sécurité routière (ASSR 1 et 2)", "demander des certificats de scolarité", "s’inscrire sur la plate-forme ParcoursSup", "demande de dossier social étudiant (DES)", "en situation de handicap : s’inscrire auprès de Cap emploi"]
    @State var catProtection: [String] = ["Formaliser le Ppe, le DIPEC", "Préparer la demande d’aide « Jeune Majeur » et le courrier", "Pour certains jeunes contribuer au PAG, au PAI"]
    @State var catFinance: [String] = ["Ouvrir un compte en banque", "demande de bourses auprès du CROUS", "Informations sur les prêts étudiants"]
    @State var catInsertion: [String] = ["Archiver les pièces professionnelles (contrats, fiches de paie, etc.)","Rédiger son CV"]
    
    @State var showingSection1 = false
    @State var showingSection2 = false
    @State var showingSection3 = false
    @State var showingSection4 = false
    @State var showingSection5 = false
    @State var showingSection6 = false
    @State var showingSection7 = false
    
    //pour naviguer dans les différentes Section à l'aide des Icons
    @State private var section = 0
    
    //pour déterminer quelle vue afficher dans le picker
    @State private var selectedSegment = 0
    
    //pour la modale
    @State private var isModalPresented = false
    @State private var newLine = ""
    @State private var selectedSection = "Civile"
    let sections = ["Civile", "Mobilité", "Santé", "Scolarité", "Protection", "Finance", "Insertion pro"]
    
    //pour la couleur du picker segmented
    init() {

            UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.normal)

            UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.init(.white)], for: UIControl.State.selected)

            UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(.orange)

        }
    
    var body: some View {
        
        NavigationStack{
            
            ZStack{
                
                Color(.black)
                    .ignoresSafeArea()
                
                VStack{
                    
                    Text("Mes démarches")
                        .padding(.top, 20)
                        .padding(.bottom, 22)
                        .font(.system(size: 30))
                        .foregroundStyle(Color(hex: "FFF2A9"))
                    
                    Picker("Options", selection: $selectedSegment){
                        Text("Mes Démarches").tag(0)
                        Text("Mes Rappels").tag(1)
                    }
                    
                    .pickerStyle(SegmentedPickerStyle())
                    .background(Color(hex: "1F7A8D").opacity(0.3))
                    .frame(width: 380, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    
                    //.padding()
                    
                    if selectedSegment == 0 {
                        ScrollViewReader { value in
                            
                            ZStack{
                                
                                Rectangle()
                                    .fill(Gradient(colors: [.gray.opacity(0.15), .black.opacity(0.05), .black.opacity(0.03), .black, .black, .black, .black, .black.opacity(0.08), .gray.opacity(0.12)]))
                                    .frame(width: 393, height: 102)
                                
                                ScrollView(.horizontal) {
                                    
                                    HStack {
                                        ForEach(icons) { icon in
                                            Button(action: {
                                                
                                                withAnimation(){
                                                    value.scrollTo(icon.scrollId, anchor: .top)
                                                }
                                                
                                                
                                            }, label: {
                                                
                                                VStack {
                                                    ZStack{
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .frame(width: 40, height: 40)
                                                            .foregroundColor(icon.fond)
                                                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                                            .padding(.horizontal)
                                                        Image(systemName: icon.img)
                                                            .foregroundStyle(icon.colimg)
                                                            .font(.system(size: 25))
                                                    }
                                                    Text(icon.nom)
                                                        .font(.custom("Quicksand-SemiBold", size: 12))
                                                        .foregroundStyle(.white)
                                                    
                                                }
                                                
                                            })
                                        }
                                    }
                                }
                            }
                            
                            
                            VStack(){
                                
                                ScrollView {
                                    
                                    VStack(spacing: 20){
                                        
                                        ZStack(alignment: .top){
                                            //SectionHeaderView(title: "Civile", isExpanded: $showingSection1)
                                            if showingSection1 {
                                                ContenuListView(items: $catCivile)
                                                    .padding(.top, 40)
                                            }
                                            SectionHeaderView(title: "Civile", isExpanded: $showingSection1)
                                        }.id(1)
                                        
                                        ZStack(alignment: .top) {
                                            // Contenu de la check-list
                                            if showingSection2 {
                                                ContenuListView(items: $catMobilité)
                                                    .padding(.top, 40) // Ajuste cet offset selon tes besoins
                                            }
                                            
                                            // En haut, la section
                                            SectionHeaderView(title: "Mobilité", isExpanded: $showingSection2)
                                        }.id(2)
                                        
                                        ZStack(alignment: .top){
                                            
                                            if showingSection3 {
                                                ContenuListView(items: $catSanté)
                                                    .padding(.top, 40)
                                            }
                                            SectionHeaderView(title: "Santé", isExpanded: $showingSection3)
                                        }.id(3)
                                        
                                        ZStack(alignment: .top){
                                            
                                            if showingSection4 {
                                                ContenuListView(items: $catScolarité)
                                                    .padding(.top, 40)
                                            }
                                            SectionHeaderView(title: "Scolarité", isExpanded: $showingSection4)
                                        }.id(4)
                                        
                                        ZStack(alignment: .top){
                                            
                                            if showingSection5 {
                                                ContenuListView(items: $catProtection)
                                                    .padding(.top, 40)
                                            }
                                            SectionHeaderView(title: "Protection", isExpanded: $showingSection5)
                                            
                                        }.id(5)
                                        
                                        ZStack(alignment: .top){
                                            
                                            if showingSection6 {
                                                ContenuListView(items: $catFinance)
                                                    .padding(.top, 40)
                                                
                                            }
                                            SectionHeaderView(title: "Finance", isExpanded: $showingSection6)
                                        }.id(6)
                                        
                                        ZStack(alignment: .top){
                                            
                                            if showingSection7 {
                                                ContenuListView(items: $catInsertion)
                                                    .padding(.top, 40)
                                            }
                                            SectionHeaderView(title: "Insertion pro", isExpanded: $showingSection7)
                                        }.id(7)
                                    }
                                    
                                }
                                
                                
                            }
                            .padding()
                            Button(action: {
                                isModalPresented = true
                            }) {
                                Text("+")
                                    .padding()
                                    .background(.orange)
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .clipShape(Circle())
                                    .font(.system(size: 25))
                            }
                            .sheet(isPresented: $isModalPresented) {
                                AddLineModalView(
                                    isModalPresented: $isModalPresented,
                                    newLine: $newLine,
                                    selectedSection: $selectedSection,
                                    sections: sections,
                                    addLineAction: {
                                        
                                        // Logique pour ajouter la nouvelle ligne à la bonne section
                                        switch selectedSection {
                                        case "Civile":
                                            catCivile.append(newLine)
                                        case "Mobilité":
                                            catMobilité.append(newLine)
                                        case "Santé":
                                            catSanté.append(newLine)
                                        case "Scolarité":
                                            catScolarité.append(newLine)
                                        case "Protection":
                                            catProtection.append(newLine)
                                        case "Finance":
                                            catFinance.append(newLine)
                                        case "Insertion pro":
                                            catInsertion.append(newLine)
                                        default:
                                            break
                                        }
                                        newLine = "" // Réinitialiser le champ de saisie après ajout
                                    }
                                )
                            }
                            
                        }
                    }
                    
                    else if selectedSegment == 1 {
                        
                        Spacer()
                        
                        RappelView()
                    }
                    
                    }
               
                }
                
            }

        }
        
    }

                    
            
#Preview {
    Demarche()
}




