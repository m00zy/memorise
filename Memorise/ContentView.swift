////
////  ContentView.swift
////  Memorise
////
////  Created by Maxwell Zhu on 17/07/2024.
import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView()
        }
    }
}

struct CardView: View{
    var body: some View{
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(lineWidth: 2)
            Text("😂")
                .padding()
                .font(.largeTitle)
                .foregroundColor(.orange)
        }
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//
//
//

