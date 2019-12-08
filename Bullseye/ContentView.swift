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
            // TODO: Create some rows
            // Target Row
            HStack {
                Text("Put the bullseye as choose as you can to:")
                Text("100")
            }
            // Slider Row
            HStack {
                Text("1")
                Slider(value: .constant(100))
                Text("100")
            }
            
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
            
            // Button Row
            HStack {
                Button(action: {}) {
                    Text("Start Over")
                }
                Text("Score:")
                Text("999999")
                Text("Round:")
                Text("999")
                Button(action: {}) {
                    Text("Info")
                }
            }
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
