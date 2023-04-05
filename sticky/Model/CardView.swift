//
//  CardView.swift
//  sticky
//
//  Created by wangyian on 30/3/2023.
//

import SwiftUI

@ViewBuilder
func CardView(note: Note) -> some View {
    VStack {
        Rectangle()
            .fill(note.cardColor)
            .frame(width: 300, height: 25)
            .offset(y: -10)
        
        Text(note.note)
            .font(.title3)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(minHeight: 80, maxHeight: 80)
        
        HStack {
            Text(note.date, style: .date)
                .foregroundColor(.black)
                .opacity(0.8)
            
            Spacer(minLength: 0)

            
            Button {
                
            } label: {
                Image(systemName: "square.and.pencil")
                    .font(.system(size: 25, weight: .semibold))
                    .padding()
                    .foregroundColor(.black)
                    .offset(x: 15)
            }
        }
        .padding(.top, 55)
    }
    .frame(minWidth: 225, maxWidth: 225, minHeight: 200, maxHeight: 200)
    .padding()
    .background(Color("Paper"))
    .cornerRadius(10)
}
