//
//  Filter.swift
//  sticky
//
//  Created by wangyian on 30/3/2023.
//

import SwiftUI

struct Filter: View {
    var body: some View {
        Menu {
            Button {
            } label: {
                Image(systemName: "eyeglasses")
            }
            
            Button {
            } label: {
                Image(systemName: "eyeglasses")
            }
        } label: {
            Label("Add Bookmark", systemImage: "book")
        }
    }
}

struct Filter_Previews: PreviewProvider {
    static var previews: some View {
        Filter()
    }
}
