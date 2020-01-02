//
//  ContentView.swift
//  Bullseye
//
//  Created by 古屋郷 on 2019/11/27.
//  Copyright © 2019 古屋郷. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var totalScore = 0
    @State var currentRoundCount = 1
    
    var body: some View {
        VStack {
            Spacer()
            // Target Row
            HStack {
                Text("Put the bullseye as choose as you can to:")
                Text("\(self.target)")
            }
            Spacer()
            
            // Slider Row
            HStack {
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
            
            Button(action: {
                print("Button pushed")
                self.alertIsVisible = true
            }) {
                Text("Hit Me")
                
            }
            .alert(isPresented: $alertIsVisible) {
                () -> Alert in
                    return Alert(
                        title: Text("\(self.alertTitle())"),
                        message: Text("The slider's value is \(self.sliderValueRounded()).\n" +
                            "You scored \(self.pointsForCurrentRound()) points this result."),
                        dismissButton: .default(Text("Dismiss")) {
                            self.totalScore += self.pointsForCurrentRound()
                            self.target = Int.random(in: 1...100)
                            self.currentRoundCount += 1
                        }
                    )
            }
            Spacer()
            
            // Button Row
            HStack {
                Button(action: {}) {
                    Text("Start Over")
                }
                Spacer()
                Text("Score:")
                Text("\(self.totalScore)")
                Spacer()
                Text("Round:")
                Text("\(self.currentRoundCount)")
                Spacer()
                Button(action: {}) {
                    Text("Info")
                }
            }
            .padding(.bottom, 20)
            .padding(.leading, 20)
            .padding(.trailing, 20)
        }
    }
    
    func pointsForCurrentRound() -> Int {
        return 100 - abs(self.target - sliderValueRounded())
    }
    
    func sliderValueRounded() -> Int {
        return Int(self.sliderValue.rounded())
    }
    
    func alertTitle() -> String {
        let difference = abs(self.target - sliderValueRounded())
        
        switch difference {
        case 0:
            return "Perfect!"
        case 1...4:
            return "You almost had it!"
        case 5...10:
            return "Not bad."
        default:
            return "Are you even trying?"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // ContentView()
        ContentView().previewLayout(
            .fixed(width: 896, height: 414)
        )
    }
}
