//
//  AboutView.swift
//  Bullseye
//
//  Created by 古屋郷 on 2020/01/31.
//  Copyright © 2020 古屋郷. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Text("🎯 Bullseye 🎯")
            Text("This is Bullseye, this game where you can win points earn fame by dragging a slider.")
            Text("Your goal is to place slider as close as possible to target value. The closer you are, the more points you score.")
            Text("Enjoy!")
        }
        .navigationBarTitle("About bullseye")
        
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        // AboutView()
        AboutView().previewLayout(
            .fixed(width: 896, height: 414)
        )
    }
}
