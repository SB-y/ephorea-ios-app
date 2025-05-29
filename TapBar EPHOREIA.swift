//
//  TapBar EPHOREIA.swift
//  EPHOREA APP
//
//  Created by Apprenant173 on 24/09/2024.
//

import SwiftUI

struct TapBar_EPHOREIA: View {
    @State private var onBoardHasPassed = false
    var body: some View {
        if !onBoardHasPassed {
            Onboarding_EPHOREIA(onBoardingDone: $onBoardHasPassed)
        } else {
            TabView{
                
                Accueil_EPHOREIA ()
                    .tabItem {
                        Label("Accueil", systemImage: "house.circle")
                    }
                
                Budget_EPHOREIA ()
                    .tabItem {
                        Label("Budget", systemImage: "chart.line.uptrend.xyaxis.circle")
                            .foregroundColor(.white)
                    }
                
                Enveloppe_EPHOREIA ()
                    .tabItem {
                        Label("Enveloppes", systemImage: "eurosign.arrow.circlepath")
                    }
                Demarche()
                    .tabItem {
                        Label("Démarches", systemImage: "folder.circle")
                    }
                Profil_EPHOREIA ()
                    .tabItem {
                        Label("Profil", systemImage: "person.crop.circle")
                    }
            }
            .tint(.orange)
        }
    }
}

#Preview {
    TapBar_EPHOREIA()
}
