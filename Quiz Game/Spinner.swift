//
//  Spinner.swift
//  Quiz Game
//
//  Created by macbook on 26.02.2023.
//

import SwiftUI

struct Spinner: View {
    var body: some View {
        VStack(spacing: 20) {
//            Text("Qiuz Game")
//                .font(.title)
//                .fontWeight(.heavy)
//                .foregroundColor(Color("AccentColor"))
            
            Text("Loading...")
                .foregroundColor(.gray)
                .fontWeight(.heavy)
        }
    }
}

struct Spinner_Previews: PreviewProvider {
    static var previews: some View {
        Spinner()
    }
}
