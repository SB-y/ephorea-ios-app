//
//  SectionHeaderView.swift
//  EPHOREA APP
//
//  Created by Apprenant173 on 25/09/2024.
//

import SwiftUI

struct SectionHeaderView: View {
    
        @State var title: String
        @Binding var isExpanded: Bool
    
    var body: some View {
            Button(action: {
                
                withAnimation {
                    isExpanded.toggle()
                }
                
            }) {
                HStack {
                    Text(title)
                        .font(.custom("Quicksand-SemiBold", size: 16))
                        .foregroundStyle(.white)
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                        .foregroundStyle(Color(hex:"FFF2A9"))
                }
                
                
                .padding()
                .background(Color(hex:"1F7A8D").opacity(0.3))
                .cornerRadius(10)
                .shadow(radius: 5)
                

            }
        }
    }

#Preview {
    SectionHeaderView(title: "Civile",isExpanded: .constant(false))
}
