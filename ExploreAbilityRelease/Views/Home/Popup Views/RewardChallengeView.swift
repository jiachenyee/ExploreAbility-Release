//
//  RewardChallengeView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 10/8/23.
//

import Foundation
import SwiftUI

struct RewardChallengeView: View {
    
    @State private var waveOffset = Angle(degrees: 0)
    
    var body: some View {
        VStack {
            
            ZStack {
                Rectangle()
                    .fill(.brown)
                    .opacity(0.3)
                
                Group {
                    WaveView(offset: waveOffset, percent: 0.5)
                        .fill(.brown.opacity(0.5))
                    
                    WaveView(offset: .degrees(45) - waveOffset, percent: 0.5)
                        .fill(.brown.opacity(0.5))
                    
                    WaveView(offset: .degrees(90) - waveOffset, percent: 0.5)
                        .fill(.brown.opacity(0.5))
                }
                .padding(.trailing, -32)
                
                VStack {
                    Spacer()
                    HStack {
                        Text("100")
                        Image(systemName: "mug.fill")
                            .imageScale(.small)
                    }
                    .font(.system(size: 64, weight: .bold))
                    
                    Spacer()
                    Text("Hot Chocolate can be exchanged for hints.")
                }
                .padding()
            }
            .clipped()
            .clipShape(UnevenRoundedRectangle(bottomLeadingRadius: 8, bottomTrailingRadius: 8))
            .frame(height: 200)
            .onAppear {
                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                    self.waveOffset = Angle(degrees: 360)
                }
            }
            
            List {
                Section("\(Image(systemName: "checkmark")) Ready") {
                    ForEach(0..<10) { index in
                        HStack {
                            Image(systemName: "square")
                                .imageScale(.large)
                            VStack(alignment: .leading) {
                                Text("ChallengeName\(index)")
                                    .font(.headline)
                                
                                HStack(spacing: 0) {
                                    Image(systemName: "mug.fill")
                                    Image(systemName: "mug.fill")
                                }
                            }
                            
                            Spacer()
                        }
                    }
                }
                
                Section("\(Image(systemName: "timer")) Preparing Hot Chocolate…") {
                    ForEach(0..<10) { index in
                        HStack {
                            Image(systemName: "square")
                            VStack(alignment: .leading) {
                                Text("ChallengeName\(index)")
                                    .font(.headline)
                                
                                HStack(spacing: 0) {
                                    Image(systemName: "mug.fill")
                                    Image(systemName: "mug.fill")
                                }
                            }
                            
                            Spacer()
                        }
                    }
                }
            }
            .imageScale(.small)
            .listStyle(.plain)
        }
    }
}
