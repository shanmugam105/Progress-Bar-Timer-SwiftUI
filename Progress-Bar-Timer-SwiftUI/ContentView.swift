//
//  ContentView.swift
//  Progress-Bar-Timer-SwiftUI
//
//  Created by sparkout on 12/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var statusBarWidth: CGFloat = 0
    @StateObject private var timer = StopWatch(countMax: 120, isIncrement: true)
    var body: some View {
        VStack {
            Spacer()
            
            ZStack(alignment: .leading) {
                VStack {}
                    .frame(maxWidth: statusBarWidth * timer.progress, maxHeight: .infinity)
                    .background(Color.green)
                GeometryReader { proxy in
                    HStack {
                        Image(systemName: "clock.fill")
                            .resizable()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(1, contentMode: .fit)
                            .foregroundColor(Color.white)
                            .padding([.vertical, .leading], 8)
                        Text(timer.counter.formatedMinutes)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(Color.white)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .onAppear {
                        statusBarWidth = proxy.size.width
                    }
                }
            }
            .frame(maxWidth: 85, maxHeight: 35)
            .background(Color.green.opacity(0.4))
            .cornerRadius(8)
            
            Spacer()
            
            Button {
                timer.start()
            } label: {
                Text("Start Timer")
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .font(.system(size: 16.0, weight: .semibold))
                    .background(Color.purple)
                    .foregroundColor(Color.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}
