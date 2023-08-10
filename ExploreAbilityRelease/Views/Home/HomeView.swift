//
//  HomeView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    @State private var mugAnimationAngle = Angle.degrees(0)
    
    var body: some View {
        ZStack {
            ZoomableScrollView {
                ZStack {
                    Color.black
                    
                    VStack(spacing: 21) {
                        HStack(spacing: 64) {
                            HexagonView(challengeCategory: .vision)
                            HexagonView(challengeCategory: .hearing)
                        }
                        ControlsHexagonView()
                        HStack(spacing: 64) {
                            HexagonView(challengeCategory: .mobility)
                            HexagonView(challengeCategory: .cognitive)
                        }
                    }
                }
                .foregroundStyle(.white)
            }
            .ignoresSafeArea()
            
            HStack {
                Text("100")
                ZStack {
                    Image(systemName: "mug.fill")
                        
                    Image(systemName: "mug.fill")
                        .clipShape(WaveView(offset: mugAnimationAngle, percent: 0.5))
                        .foregroundStyle(.brown)
                        .onAppear {
                            withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
                                mugAnimationAngle = .degrees(360)
                            }
                        }
                }
            }
            .padding()
            .background(.ultraThickMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding([.trailing, .top])
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        }
    }
}
