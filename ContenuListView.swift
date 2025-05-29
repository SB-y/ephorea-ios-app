//
//  ContenuListView.swift
//  EPHOREA APP
//
//  Created by Apprenant173 on 25/09/2024.
//

import SwiftUI


// Extension pour arrondir des coins spécifiques
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorners(radius: radius, corners: corners))
    }
}

// Shape personnalisé pour arrondir des coins spécifiques
struct RoundedCorners: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct ContenuListView: View {
    
    @Binding var items: [String]
    @State private var checkedItems: [Bool]
    @State private var activeFieldIndex: Int? = nil
    
    init(items: Binding<[String]>) {
        self._items = items
        // Initialise tous les éléments comme décochés
        self._checkedItems = State(initialValue: Array(repeating: false, count: items.wrappedValue.count))
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
                    ForEach(items.indices, id: \.self) { index in
                        HStack {
                            
                            Button(action: {
                                                    checkedItems[index].toggle()
                                                }) {
                                                    ZStack {
                                                        // Fond carré
                                                        RoundedRectangle(cornerRadius: 5)
                                                            .fill(Color(hex: "1F7A8D").opacity(0.2))
                                                            .stroke(Color(hex: "FFF2A9").opacity(0.6), lineWidth:3)
                                                            .frame(width: 24, height: 24)
                                                        
                                                        // Si l'élément est coché, afficher un "checkmark"
                                                        if checkedItems[index] {
                                                            Image(systemName: "checkmark")
                                                                .foregroundColor(.green)
                                                                .font(.system(size: 20))
                                                        }
                                                    }
                                                    
                                                }
                            
                            TextField("Entrez du text ici", text: $items[index], onEditingChanged: { isEditing in
                                activeFieldIndex = isEditing ? index : nil
                                    
                            })
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                            .padding(5)
                            .background(activeFieldIndex == index ? Color.white.opacity(0.2) : Color(hex: "1F7A8D").opacity(0.0000001))
                            .cornerRadius(6)
                            
                        }
                        .padding(10) // Espace entre les lignes
                        //.background(Color.green.opacity(0.3)) // Fond pour chaque ligne
                       // .cornerRadius(0)
                    }
                }
                .padding(.vertical, 13) // Espace autour de la liste
                .background(Color(hex: "1F7A8D").opacity(0.2)) // Fond de la check-list
                .cornerRadius(10, corners: [.bottomLeft, .bottomRight])
                
            }
        }


#Preview {
    ContenuListView(items: .constant(["Élément 1", "Élément 2", "Élément 3"]))
}

