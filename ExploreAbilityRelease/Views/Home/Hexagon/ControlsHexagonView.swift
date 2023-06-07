//
//  ControlsHexagonView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import Foundation
import SwiftUI

struct ControlsHexagonView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            HStack(spacing: 16) {
                VStack(spacing: 21) {
                    Button {
                        withAnimation(.bouncy) {
                            viewModel.gameState = .store
                        }
                    } label: {
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundStyle(.yellow)
                            .overlay {
                                Image(systemName: "mug.fill")
                                    .foregroundStyle(.black)
                            }
                    }
                    .matchedGeometryEffect(id: "cafe.icon", in: viewModel.sharedNamespace)
                    
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.yellow.opacity(0.9))
                        .overlay {
                            Image(systemName: "heart.fill")
                                .foregroundStyle(.black)
                        }
                    
                }
                
                VStack(spacing: 21) {
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.yellow.opacity(0.5))
                        .overlay {
                            Image("gamecenter")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                                .foregroundStyle(.black)
                        }
                    
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.white.opacity(0.1))
                        .overlay {
                            Image(systemName: "house")
                                .font(.system(size: 25))
                                .foregroundStyle(.yellow)
                        }
                    
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.yellow.opacity(0.8))
                        .overlay {
                            Image(systemName: "square.and.arrow.up")
                                .foregroundStyle(.black)
                        }
                    
                }
                VStack(spacing: 21) {
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.yellow.opacity(0.6))
                        .overlay {
                            Image(systemName: "hand.raised.app.fill")
                                .foregroundStyle(.black)
                        }
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.yellow.opacity(0.7))
                        .overlay {
                            Image(systemName: "gear")
                                .foregroundStyle(.black)
                        }
                }
            }
            
            .padding(32)
            .overlay {
                LinearGradient(colors: [.yellow, .yellow.opacity(0.5)],
                               startPoint: .topLeading, endPoint: .bottomTrailing)
                .mask {
                    Image("hex")
                        .resizable()
                        .scaledToFit()
                }
                .allowsHitTesting(false)
            }
            .padding(-32)
        }
    }
}
