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
    @State var sliderValue: Double = 50.0
    var body: some View {
        VStack {
            Spacer()
            // Target Row
            HStack {
                Text("Put the bullseye as close as you can to:")
                Text("100")
            }
            Spacer()
            
            // Slider Row
            HStack{
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            Button(action: {
                self.alertIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $alertIsVisible) { () -> Alert in
                let roundedValue:Int = Int(self.sliderValue.rounded())
                return Alert(title: Text("Result"), message: Text("The slider's value is \(roundedValue)."),dismissButton: .default(Text("Awesome!")))
            }
            Spacer()
            
            //Score Row
            HStack{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Start over")
                }
                Spacer()
                Text("Score:")
                Text("999999")
                Spacer()
                Text("Round:")
                Text("999")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Info")
                }
            }.padding(.bottom,20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
