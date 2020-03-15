//
//  ContentView.swift
//  Bullseye
//
//  Created by Harsh Rajgor on 24/02/20.
//  Copyright © 2020 Harsh Rajgor. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var totalScore = 0
    @State var round = 1
    var body: some View {
        VStack {
            Spacer()
            // Target Row
            HStack {
                Text("Put the bullseye as close as you can to:")
                Text("\(target)")
            }
            Spacer()
            
            // Slider Row
            HStack{
                Text("1")
                Slider(value: $sliderValue, in: 1...100)
                Text("100")
            }
            Button(action: {
                self.alertIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $alertIsVisible) { () -> Alert in
                return Alert(title: Text(alertTitle()), message: Text("The slider's value is \(sliderValueRounded()).\n" +
                    "You scored \(pointsForCurrentRound() ) points this round."),dismissButton: .default(Text("Awesome!")) {
                        self.totalScore += self.pointsForCurrentRound()
                        self.target = Int.random(in: 1...100)
                        self.round += 1
                    })
            }
            Spacer()
            
            //Score Row
            HStack{
                Button(action: {
                    self.resetGame()
                }) {
                    Text("Start over")
                }
                Spacer()
                Text("Score:")
                Text("\(totalScore)")
                Spacer()
                Text("Round:")
                Text("\(round)")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Info")
                }
            }.padding(.bottom,20)
        }
    }
    
    func resetGame() {
        totalScore = 0
        round = 1
        sliderValue = 50.0
        target = Int.random(in: 1...100)
    }
    
    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
    }
    
    func differenceTargetNSliderValue() -> Int {
        abs(target - sliderValueRounded())
    }
    
    func pointsForCurrentRound() -> Int {
        let maximumScore = 100
        let difference = differenceTargetNSliderValue()
        var bonus = 0
        if difference == 0 {
            bonus = 100
        } else if difference == 1 {
            bonus = 50
        }
        return maximumScore - difference + bonus
    }
    
    func alertTitle() -> String {
        let difference = differenceTargetNSliderValue()
        var title:String
        if difference == 0 {
            title = "Perfect!"
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference <= 10 {
            title = "Not bad."
        } else {
            title = "Are you even trying?"
        }
        return title
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
