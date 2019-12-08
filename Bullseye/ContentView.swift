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
    
    var body: some View {
        VStack {
            Spacer()
            // TODO: Create some rows
            // Target Row
            HStack {
                Text("Put the bullseye as choose as you can to:")
                Text("100")
            }
            Spacer()
            
            // Slider Row
            HStack {
                Text("1")
                Slider(value: .constant(100))
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
                        title: Text("Hello"),
                        message: Text("Hello message"),
                        dismissButton: .default(Text("Dismiss"))
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
                Text("999999")
                Spacer()
                Text("Round:")
                Text("999")
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // ContentView()
        ContentView().previewLayout(
            .fixed(width: 896, height: 414)
        )
    }
}
