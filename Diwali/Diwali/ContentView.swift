//
//  ContentView.swift
//  Diwali
//
//  Created by Devanshu Dev Chaudhary on 23/10/22.
//

import SwiftUI
import ConfettiSwiftUI

struct ContentView: View {
    
    @State private var animate = false
    @State private var counter: Int = 0
    @State private var timer: Timer?

    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea(.all)
            
            Circle()
                .fill(.orange)
                .opacity(1)
                .frame(width: 200, height: 200)
                .blur(radius: 100)
                .opacity(animate ? 1: 0.3)
            
            VStack {
                
                Circle()
                    .fill(Color.blue)
                    .frame(width: 12, height: 12)
                    .modifier(ParticlesModifier())
                    .offset(x: -50, y : -10)
                
                Spacer()
                
                Text("Happy")
                    .foregroundColor(.white)
                    .font(.custom("Become Choice", size: animate ? 100 : 30))
                    .animation(.spring().speed(0.1), value: animate)
                    .opacity(animate ? 1: 0)
                
                Text("Diwali")
                    .foregroundColor(.white)
                    .font(.custom("Become Choice", size: animate ? 90 : 30))
                    .animation(.spring().speed(0.1), value: animate)
                    .opacity(animate ? 1: 0)
                
                Spacer()
                
                Circle()
                    .fill(Color.green)
                    .frame(width: 12, height: 12)
                    .modifier(ParticlesModifier())
                    .offset(x: 60, y : 10)
            }
        }
        .background(.black)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .onAppear {
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
                withAnimation(.easeIn(duration: 5)) {
                    startAnimation()
                }
            }
        }
    }
    private func startAnimation() {
        animate.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
