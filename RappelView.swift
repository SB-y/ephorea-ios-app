//
//  RappelView.swift
//  EPHOREA APP
//
//  Created by Apprenant173 on 25/09/2024.
//

import SwiftUI

struct Reminder: Identifiable {
    let id = UUID()
    let title: String
    let time: String
    let bell: Bool
    var systemImageName: String
}

struct RappelView: View {
    
    @State private var reminders = [
        Reminder(title: "RDV Préfecture", time: "Dans 2 jours", bell: false, systemImageName: "note.text"),
        Reminder(title: "RDV France Travail", time: "Dans 3 jours", bell: false, systemImageName: "briefcase"),
        Reminder(title: "RDV Médecin traitant", time: "Dans 8 jours", bell: false, systemImageName: "cross.case"),
        Reminder(title: "Remettre dossier de bourse", time: "Dans 2 sem", bell: false, systemImageName: "graduationcap")
    ]
    
    var body: some View {
        List {
            ForEach(reminders) { reminder in
                HStack(spacing: 30) {
                    Image(systemName: reminder.systemImageName)
                        .font(.system(size: 23))
                        .foregroundColor(.white)
                    Text(reminder.title)
                        .font(.system(size: 14))
                        .foregroundColor(.white)

                    Spacer()

                    Text(reminder.time)
                        .font(.system(size: 14))
                        .foregroundColor(Color(hex: "FFF2A9"))
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color(hex: "1F7A8D").opacity(0.3)))
            }
            .listRowBackground(Color.black)
        }
        .listStyle(PlainListStyle())
        .scrollContentBackground(.hidden)
        .background(Color.black)
    }
}

#Preview {
    RappelView()
}
