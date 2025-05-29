//
//  Budget EPHOREIA.swift
//  EPHOREA APP
//
//  Created by Apprenant173 on 24/09/2024.
//

import SwiftUI
struct Expense: Identifiable {
    let id = UUID()
    var name: String
    var amount: Double
    var deadline: Date
    var systemImageName: String
   
}



struct Budget_EPHOREIA: View {
    
    @State private var selectedSegment = 0
    @State private var revenues: Double = 2000
    @State private var expenses: Double = 1000
    
    
    @State private var depenseFixe: [Expense] = [
        Expense(name: "Loyer", amount: 500, deadline: Date(), systemImageName: "house.fill"),
        Expense(name: "Electricité", amount: 100, deadline: Date(), systemImageName: "bolt.fill"),
        Expense(name: "Transport", amount: 50, deadline: Date(), systemImageName: "car.fill")
    ]
    @State private var depenseVariable: [Expense] = [
        Expense(name: "Courses", amount: 200, deadline: Date(), systemImageName: "cart.fill"),
        Expense(name: "Sorties", amount: 100, deadline: Date(), systemImageName: "person.fill"),
        Expense(name: "Imprévus", amount: 50, deadline: Date(), systemImageName: "sun.max.trianglebadge.exclamationmark.fill"),
        
    ]
    @State private var revenuList: [Expense] = [
        Expense(name: "Bourse", amount: 1000, deadline: Date(), systemImageName: "graduationcap.fill"),
        Expense(name: "Tiktok", amount: 700, deadline: Date(), systemImageName: "figure.dance"),
        Expense(name: "Argent de poche", amount: 300, deadline: Date(), systemImageName: "eurosign")
    ]
    
    // VARIABLES POUR LA GESTION DE LA MODALE
    @State private var isModalPresented = false
    @State private var newExpense = ""
    @State private var newAmount: String = ""
    
    @State private var completionAmount = 0.5
    
    var couleurRose: Color = Color(hex: "F21F8A")
    @State private  var bouncyColor: Color = Color(.black)
    
    @State private var completionAmountCercle = 0.0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var isOn: Bool = false
    @State private var showExpense = false
    
    
    // PERMET DE MODIFIER LES ELEMENTS DU PICKER
    init() {
        
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.normal)
        
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.init(.white)], for: UIControl.State.selected)
        
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(.orange)
        
    }
    
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                ScrollView{
                    ZStack {
                        
                        VStack {
                            Text("Mon budget")
                                .padding(.top, 20)
                                .padding(.bottom, 22)
                                .font(.system(size: 30))
                                .foregroundStyle(Color(hex: "FFF2A9"))
                            
                        }
                        
                    }
                    .frame(height: 70.0)
                    
                    // Fin titre
                    
                    
                    // La jauge
                    HStack {
                        
                        VStack{
                            
                            VStack(alignment: .center, spacing: 20) {
                                
                                HStack(spacing:40) {
                                    
                                    ZStack{
                                        VStack{
                                            Text("Solde")
                                                .font(.footnote)
                                            Text("\(Int(revenues-expenses)) €")
                                                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                                .onTapGesture {
                                                    withAnimation {
                                                        isOn.toggle()
                                                        
                                                        
                                                    }
                                                }
                                            
                                        }
                                        Circle()
                                            .stroke(LinearGradient(colors: [Color.mint.opacity(0.3), .mint], startPoint: .bottom, endPoint: .top), lineWidth: 20)
                                            .frame(width: 150, height: 260)
                                            .rotationEffect(.degrees(-90))
                                            .animation(.easeInOut, value: completionAmount)
                                        
                                        Circle()
                                        
                                            .trim(from: 0, to: completionAmount)
                                            .stroke(LinearGradient(colors: [Color.yellow, .orange,  .red, .yellow], startPoint: .bottom, endPoint: .top), lineWidth: 20)
                                            .frame(width: 130, height: 160)
                                            .rotationEffect(.degrees(-90))
                                            .animation(.easeInOut, value: completionAmount) // Animation lors du changement des dépenses
                                    }//fin Zstack
                                    .padding(.leading, 10)
                                    .font(.system(size: 15))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                    
                                    
                                    VStack {
                                        ZStack{
                                            
                                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                                .foregroundColor(.mint).opacity(0.2)
                                            
                                            VStack(spacing: 20){
                                                HStack(spacing: 15){
                                                    Circle()
                                                        .stroke(LinearGradient(colors: [Color.mint, .gray, .gray, .mint, .gray], startPoint: .bottom, endPoint: .top), lineWidth: 5)
                                                        .frame(width: 15, height: 15)
                                                        .padding(.leading, -2)
                                                    
                                                    
                                                    Text("Revenus:  \(Int(revenues)) €")
                                                        .font(.system(size: 13))
                                                        .foregroundStyle(.white)
                                                    
                                                        .padding(.leading, 1)
                                                    
                                                }
                                                
                                                
                                                
                                                HStack(spacing: 15){
                                                    Circle()
                                                        .stroke(LinearGradient(colors: [Color.yellow, .orange,  .orange, .yellow], startPoint: .bottom, endPoint: .top), lineWidth: 5)
                                                        .frame(width: 15, height: 15)
                                                        .padding(.leading, 1)
                                                    Text("Dépenses: \(Int(expenses)) €")
                                                        .font(.system(size: 13))
                                                        .foregroundStyle(.white)
                                                        .padding(.leading, 1)
                                                    
                                                    
                                                }
                                                
                                            }
                                            
                                        }
                                        
                                        
                                    }
                                    .frame(width: 160.0, height: 100.0)
                                    
                                    
                                    
                                    
                                } // Fin Hstack
                                
                                .frame(width: 380.0, height: 280.0)
                                .background(Color(hex: "1F7A8D").opacity(0.19))
                                .clipShape(RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
                                
                                //Rectangle des dépenses
                                
                                
                                
                            }// Fin Vstack
                            
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                            
                            
                            
                        }
                        .foregroundColor(.white)
                        .font(.footnote)
                        
                    }
                    
                    
                    // LE PICKER
                    VStack {
                        Picker("Options", selection: $selectedSegment) {
                            Text("Fixe").tag(0)
                            Text("Variable").font(.footnote).tag(1)
                            Text("Revenus").tag(2)
                        }
                        
                        .pickerStyle(SegmentedPickerStyle())
                        .background(Color(hex: "1F7A8D").opacity(0.3))
                        .frame(width: 380, height: 80)
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 30, height: 30)))
                        
                        
                        .padding()
                        // Liste des dépenses ou revenus avec montants
                       
                        
                        VStack{
                            if selectedSegment == 0 {
                                ForEach($depenseFixe) { $expense in
                                    VStack {
                                        HStack {
                                            
                                           
                                            Button(action: {
                                                showExpense.toggle()
                                            }, label: {
                                                Image(systemName: expense.systemImageName)
                                                    .foregroundStyle(.orange)
                                                    .font(.system(size: 17))
                                            })
                                            Text(expense.name)
                                                .foregroundStyle(.white)
                                                .font(.system(size: 17))
                                            Spacer()
                                            Text("\(expense.amount, specifier: "%.2f") €")
                                                .foregroundStyle(.white)
                                                .font(.system(size: 15))
                                            
                                            
                                            //                                        DatePicker("Deadline", selection: expense.$deadline, displayedComponents: .date)
                                        }
                                        .padding()
                                        .background(Color(hex: "1F7A8D").opacity(0.2))
                                        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                                    .frame(width: 390.0, height: 50.0)
                                        
                                        if showExpense {
                                            DatePicker("Deadline", selection: $expense.deadline)
                                                .foregroundStyle(.black)
                                                .colorInvert()
                                                .padding(.leading, 30)
                                        }
                                        
                                    }
                                }
                               
                            }
                           
                            
                            else if selectedSegment == 1 {
                                ForEach(depenseVariable) { expense in
                                    HStack {
                                        Button(action: {
                                            showExpense.toggle()
                                        }, label: {
                                            Image(systemName: expense.systemImageName)
                                                .foregroundStyle(.orange)
                                                .font(.system(size: 17))
                                        })
                                        Text(expense.name)
                                            .font(.system(size: 15))
                                            .foregroundStyle(.white)
                                        Spacer()
                                        Text("\(expense.amount, specifier: "%.2f") €")
                                        
                                            .font(.system(size: 15))
                                            .foregroundStyle(.white)
                                    }
                                    .padding()
                                    .background(Color(hex: "1F7A8D").opacity(0.2))
                                    .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                                    .frame(width: 390.0, height: 50.0)
                                    
                                
                                }
                                Spacer()
                            }
                            else if selectedSegment == 2 {
                                ForEach(revenuList) { expense in
                                    HStack {
                                        Button(action: {
                                            showExpense.toggle()
                                        }, label: {
                                            Image(systemName: expense.systemImageName)
                                                .foregroundStyle(.orange)
                                                .font(.system(size: 17))
                                        })
                                        
                                        Text(expense.name)
                                            .foregroundStyle(.white)
                                            .font(.system(size: 15))
                                        Spacer()
                                        Text("\(expense.amount, specifier: "%.2f") €")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 15))
                                    }
                                    .padding()
                                    .background(Color(hex: "1F7A8D").opacity(0.2))
                                    .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                                    .frame(width: 390.0, height: 50.0)
                                }
                                Spacer()
                            }
                        }
                        
                        
                        
                        
                        
                    }
                    
                }//fin Vstack
                
                
                
                .frame(height: 650.0)
                
                .scrollContentBackground(.hidden) // Cache le fond par défaut de la liste
                
                // Boutons pour ajouter ou retirer des éléments
                VStack {
                    Spacer()
                    HStack {
                        
                        Button(action: {removeExpense()
                        }, label: {
                            Text("-")
                                .padding()
                                .background(Color(hex: "1F7A8D"))
                                .font(.system(size: 36))
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .clipShape(Circle())
                        })
                        Button(action: {
                            isModalPresented = true
                        }, label: {
                            Text("+")
                                .padding()
                                .background(.orange)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .clipShape(Circle())
                                .font(.system(size: 30))
                            
                        })
                        
                        
                        
                        
                        //LA MODALE
                        .sheet(isPresented: $isModalPresented) {
                            ExpenseModalView(
                                isModalPresented: $isModalPresented,
                                newExpense: $newExpense,
                                newAmount: $newAmount,
                                addExpenseAction: addExpenseManually // Appel de la fonction d'ajout
                            )
                        }//Fin de la modale
                        
                        
                    }
                    
                }
            }
        }
    
        
    }
    // Fonction pour ajouter une dépense ou un revenu
    func addExpenseManually() {
        guard !newExpense.isEmpty, let amount = Double(newAmount) else { return }
        
        let newEntry = Expense(name: newExpense, amount: amount, deadline: Date(), systemImageName: "paperplane.fill")
        
        switch selectedSegment {
        case 0:
            depenseFixe.append(newEntry)
            expenses += amount
        case 1:
            depenseVariable.append(newEntry)
            expenses += amount
        case 2:
            revenuList.append(newEntry)
            revenues += amount
        default:
            break
        }
        
        
        updateCompletionAmount()
    }
    
    
    
    func removeExpense() {
        switch selectedSegment {
        case 0:
            guard !depenseFixe.isEmpty else { return }
            let lastExpense = depenseFixe.removeLast()
            expenses -= lastExpense.amount
        case 1:
            guard !depenseVariable.isEmpty else { return }
            let lastExpense = depenseVariable.removeLast()
            expenses -= lastExpense.amount
        case 2:
            guard !revenuList.isEmpty else { return }
            let lastRevenue = revenuList.removeLast()
            revenues -= lastRevenue.amount
        default:
            break
        }
        
        updateCompletionAmount()
    }
    
    
    func updateCompletionAmount() {
        if revenues > 0 {
            completionAmount = expenses / revenues
            if completionAmount > 1 {
                completionAmount = 1 // Ne pas dépasser 100%
            }
        }
    }
    
}

struct DepensesView: View {
    var titre: String
    var depenses: [String]
    
    var body: some View {
        NavigationView {
            List(depenses, id: \.self) { depense in
                Text(depense)
            }
            .navigationTitle(titre)
        }
    }
}


struct ExpenseModalView: View {
    @Binding var isModalPresented: Bool
    @Binding var newExpense: String
    @Binding var newAmount: String
    var addExpenseAction: () -> Void
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                Text("Modifier/Ajouter")
                    .foregroundStyle(.white)
                    .padding(25)
                    .font(.custom("Quicksand-SemiBold", size: 24))
                
                Form {
                    // Saisie du nom de l'enveloppe
                    Section(header: Text("Intitulé")
                        .foregroundColor(.white)
                        .textCase(nil)
                    ) {
                        TextField("Intitulé", text: $newExpense)
                            .keyboardType(.default)
                            .listRowBackground(Color.white.opacity(0.8))
                            .font(.custom("Quicksand-SemiBold", size: 12))
                    }
                    
                    Section(header: Text("Montant")
                        .foregroundColor(.white)
                        .textCase(nil)
                    ) {
                        TextField("Montant", text: $newAmount)
                            .keyboardType(.decimalPad)
                            .listRowBackground(Color.white.opacity(0.8))
                            .font(.custom("Quicksand-SemiBold", size: 12))
                    }
                }
                .background(Color.black)
                .scrollContentBackground(.hidden)
                
                // Boutons Annuler et Valider
                HStack(spacing: 30) {
                   
            
                    // Bouton Annuler
                    Button(action: {
                        isModalPresented = false // Ferme la modale sans ajouter la dépense
                    }) {
                        Text("Annuler")
                            .padding(13)
                            .background(Color(hex: "#1F7A8D"))
                            .foregroundColor(.white)
                            .font(.custom("Quicksand-SemiBold", size: 17))
                            .cornerRadius(30)
                    }
                    
                    
                    
                    // Bouton Valider
                    Button(action: {
                        addExpenseAction()       // Appel de la fonction pour ajouter la dépense
                        isModalPresented = false // Ferme la modale après validation
                    }) {
                        Text("Valider")
                            .padding(13)
                            .background(Color(hex: "#F21F8A"))
                            .foregroundColor(.white)
                            .font(.custom("Quicksand-SemiBold", size: 17))
                            .cornerRadius(30)
                    }
                }
                .padding(.bottom, 25)
            } .padding(.bottom, 1)
        }
    }
}

#Preview {
    Budget_EPHOREIA()
}
