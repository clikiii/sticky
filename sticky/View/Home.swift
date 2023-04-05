//
//  Home.swift
//  sticky
//
//  Created by wangyian on 28/3/2023.
//

import SwiftUI

struct Home: View {
    
    @State var showColors: Bool = false
    @State var animateButton: Bool = false
    @State private var searchText: String = ""
    
    var body: some View {
        HStack(spacing: 0) {
//            SideBar()
            
            Rectangle()
                .fill(Color.gray.opacity(0.15))
                .frame(width: 1)
            
            MainContent()
        }
        .frame(width: getRect().width / 1.7, height: getRect().height - 180, alignment: .leading)
        .background(Color("Bg").ignoresSafeArea())
        .preferredColorScheme(.light)
    }
    
    
    @ViewBuilder
    func MainContent() -> some View {
        VStack(spacing: 15) {
            
            SearchPart()
                .offset(y: 15)
            
            ScrollView(.vertical, showsIndicators: false) {
                MemoPart()
                ColPart()
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.horizontal, 25)
        .padding(.top, 25)
    }
    
    
    @ViewBuilder
    func SearchPart() -> some View {
        HStack(spacing: 6) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 33, weight: .light))
                .foregroundColor(.black)
                .rotationEffect(.init(degrees: 90 ))
            TextField("Search memo content", text: $searchText)
                .font(.system(size: 20, weight: .light))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
//        .overlay(
//            Rectangle()
//                .fill(Color.gray.opacity(0.8))
//                .frame(height: 1)
//                .padding(.horizontal, 10)
//                .offset(x: 10, y: 6),
//
//            alignment: .bottom
//        )
    }
    
    
    @ViewBuilder
    func MemoPart() -> some View {
        
        VStack(spacing: 15) {
            Text("Recent")
                .font(.system(size: 33, weight: .regular))
        }
        .padding(.top, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            let rows = Array(repeating: GridItem(.flexible()), count: 1)
            LazyHGrid(rows: rows, spacing: 15) {
                ForEach(notes){note in
                    CardView(note: note)
                }
            }
        }
        .padding(.bottom, 25)
        
    }
    
    
    @ViewBuilder
    func ColPart() -> some View {
        
        VStack(spacing: 15) {
            Text("Collections")
                .font(.system(size: 33, weight: .regular))
        }
        .padding(.top, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            let rows = Array(repeating: GridItem(.flexible()), count: 1)
            LazyHGrid(rows: rows, spacing: 15) {
                ForEach(notes){note in
                    CardView(note: note)
                }
            }
        }
        .padding(.bottom, 25)
        
    }
    
    
    @ViewBuilder
    func SideBar() -> some View {
        VStack {
            Text("Pocket")
                .font(.title2)
                .fontWeight(.semibold)
            
            AddButton()
                .zIndex(1)
            
            VStack(spacing: 15) {
                let colors = [Color("Blue"), Color("Pink"), Color("Green")]

                ForEach(colors, id: \.self) { color in
                    Circle()
                        .fill(color)
                        .frame(width: 20, height: 20)
                }
            }
            .padding(.top, 25)
            .frame(height: showColors ? nil : 0)
            .opacity(showColors ? 1 : 0)
            .zIndex(0)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.vertical)
        .padding(.horizontal, 22)
        .padding(.top, 35)
    }
    
    
    @ViewBuilder
    func AddButton() -> some View {
        Button {
            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.6)) {
                showColors.toggle()
                animateButton.toggle()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.spring()) {
                    animateButton.toggle()
                }
            }
        } label: {
            Image(systemName: "plus")
                .font(.title2)
                .foregroundColor(.white)
                .scaleEffect(animateButton ? 1.1 : 1)
                .padding(12)
                .background(Color.black)
                .clipShape(Circle())
        }
        .rotationEffect(.init(degrees: showColors ? 90 : 0))
        .scaleEffect(animateButton ? 1.1 : 1)
        .padding(.top, 35)
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


extension View {
    func getRect() -> CGRect {
        return NSScreen.main!.visibleFrame
    }
}

extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get{.none}
        set{}
    }
}
