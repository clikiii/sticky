//
//  ContentView.swift
//  sticky
//
//  Created by wangyian on 4/3/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .buttonStyle(BorderlessButtonStyle())
            .textFieldStyle(PlainTextFieldStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
