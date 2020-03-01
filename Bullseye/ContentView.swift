//
//  ContentView.swift
//  Bullseye
//
//  Created by Harsh Rajgor on 24/02/20.
//  Copyright © 2020 Harsh Rajgor. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    var body: some View {
        VStack {
            VStack {
                Text("Hello, Harsh!")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.green)
                Button(action: {
                    self.alertIsVisible = true
                }) {
                    Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
                        .padding(5.0)
                }
                .alert(isPresented: $alertIsVisible) { () -> Alert in
                    return Alert(title: Text("Hello"), message: Text("First"),dismissButton: .default(Text("Awesome!")))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
