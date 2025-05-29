//
//  ChecklistIconPage.swift
//  EPHOREA APP
//
//  Created by Apprenant173 on 25/09/2024.
//

import SwiftUI

//DONNEES DES ICONS DANS LA VIEW DEMARCHE
struct Icon: Identifiable {
    var id = UUID()
    var fond: Color
    var img: String
    var colimg: Color
    var nom: String
    var scrollId: Int
}

var icons = [
    Icon(fond: .blue, img: "note.text", colimg: .black.opacity(0.5), nom: "Civile", scrollId: 1),
    Icon(fond: .green, img: "bus.fill", colimg: .black.opacity(0.5), nom: "Mobilité", scrollId: 2),
Icon(fond: .white, img: "cross.case", colimg: .green, nom: "Santé", scrollId: 3),
Icon(fond: .orange, img: "graduationcap", colimg: .black.opacity(0.5), nom: "Scolarité", scrollId: 4),
Icon(fond: .purple, img: "shield.righthalf.filled", colimg: .black.opacity(0.5), nom: "Protection", scrollId: 5),
Icon(fond: .mint, img: "eurosign.square", colimg: .black.opacity(0.5), nom: "Finance", scrollId: 6),
Icon(fond: .yellow, img: "briefcase", colimg: .black.opacity(0.5), nom: "Insertion pro", scrollId: 7)
]

struct ChecklistIconPage: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ChecklistIconPage()
}
