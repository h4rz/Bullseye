//
//  AboutView.swift
//  Bullseye
//
//  Created by Harsh Rajgor on 16/03/20.
//  Copyright © 2020 Harsh Rajgor. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    let backgroundColor = Color(red: 255.0/255.0, green: 214.0/255.0, blue: 179.0/255.0)
    
    struct ForegroundColorStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content.foregroundColor(Color.black)
        }
    }
    
    struct AboutHeaderStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .modifier(ForegroundColorStyle())
                .font(Font.custom("Arial Rounded MT Bold", size: 30))
                .padding(.top, 20)
                .padding(.bottom, 20)
            .lineLimit(nil)
        }
    }
    
    struct AboutBodyStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .modifier(ForegroundColorStyle())
                .font(Font.custom("Arial Rounded MT Bold", size: 16))
                .padding(.leading, 60)
                .padding(.trailing, 60)
                .padding(.bottom, 20)
            .lineLimit(nil)
        }
    }
    
    var body: some View {
        Group{
            VStack{
                Text("🎯 Bullseye 🎯").modifier(AboutHeaderStyle())
                Text("This is Bullseye, the game here you can win points and earn fame by dragging a slider.").modifier(AboutBodyStyle())
                Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.").modifier(AboutBodyStyle())
                Text("Enjoy!").modifier(AboutBodyStyle())
            }
            .background(backgroundColor)
            .navigationBarTitle("About Bullseye")
        }
    .background(Image("Background"))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
