//
//  Onboarding EPHOREIA.swift
//  EPHOREA APP
//
//  Created by Apprenant173 on 24/09/2024.
//

import SwiftUI

struct Onboarding_EPHOREIA: View {
    
    
    @State private var completionAmount = 0.0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @Binding var onBoardingDone: Bool
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.black)
                    .ignoresSafeArea()
                Color(hex: "1F7A8D").opacity(0.2)
                    .ignoresSafeArea()
                
               
                VStack(spacing: 20){
                    Spacer()
                    ZStack{
                        
                        Circle()
                            .trim(from: 0, to: completionAmount)
                            .stroke(LinearGradient(colors: [Color.yellow, .orange, .orange, .orange, .mint], startPoint: .bottom, endPoint: .top), lineWidth: 10)
                            .frame(width: 300, height: 300)
                            .rotationEffect(.degrees(-45))
                            .onReceive(timer) { _ in
                                
                                withAnimation {
                                    if completionAmount == 1 {
                                        completionAmount = 0
                                    } else {
                                        completionAmount += 0.3
                                    }
                                }
                            }
                        
                            .foregroundStyle(.white)
                            .font(.title2)
                            .bold()
                        
                        Text("E P H O R E I A")
                            .font(.system(size: 25))
                            .foregroundStyle(.mint)
                    }
                    
                    Spacer()
                    
                    //                    NavigationLink(destination: TapBar_EPHOREIA()) {
                    //                        NavigationLink {
                    //                            TapBar_EPHOREIA()
                    Button {
                        onBoardingDone.toggle()
                    } label: {
                        Text("COMMENCER")
                            .padding()
                            .foregroundStyle(.white)
                            .background(Color.orange)
                            .cornerRadius(30.0)
                        
                        
                        
                    }
                    .padding(.bottom, 30)
                }
                
            }
            .frame(width: 700, height: 800)
        }
    }
    
    
}









#Preview {
    Onboarding_EPHOREIA(onBoardingDone: .constant(false))
}
