//
//  HexagonView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import Foundation
import SwiftUI

struct HexagonView: View {
    
    var challengeCategory: ChallengeCategory
    
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var isTextShown = false
    
    var body: some View {
        ZStack {
            HStack(spacing: 16) {
                VStack(spacing: 21) {
                    Circle()
                        .frame(width: 50, height: 50)
                    Circle()
                        .frame(width: 50, height: 50)
                }
                VStack(spacing: 21) {
                    Circle()
                        .frame(width: 50, height: 50)
                    
                    if viewModel.zoomFocus == .init(from: challengeCategory) {
                        Button {
                            withAnimation(.bouncy) {
                                viewModel.zoomFocus = .reset
                            }
                        } label: {
                            Circle()
                                .frame(width: 50, height: 50)
                                .foregroundStyle(.white.opacity(0.1))
                                .overlay {
                                    Image(systemName: "xmark")
                                        .font(.system(size: 25))
                                        .foregroundStyle(.white.opacity(0.5))
                                }
                        }
                    } else {
                        Button {
                            withAnimation(.bouncy) {
                                viewModel.zoomFocus = .init(from: challengeCategory)
                            }
                        } label: {
                            Circle()
                                .frame(width: 50, height: 50)
                                .foregroundStyle(.white.opacity(0.1))
                                .overlay {
                                    challengeCategory.image
                                        .font(.system(size: 25))
                                        .foregroundStyle(challengeCategory.color)
                                }
                        }
                    }
                    
                    Circle()
                        .frame(width: 50, height: 50)
                }
                VStack(spacing: 21) {
                    Circle()
                        .frame(width: 50, height: 50)
                    Circle()
                        .frame(width: 50, height: 50)
                }
            }
            .foregroundStyle(.white.opacity(0.1))
            .padding(32)
            .overlay {
                Image("hex")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.1)
            }
            .padding(-32)
            .onChange(of: viewModel.zoomFocus) { _ in
                withAnimation(.bouncy) {
                    isTextShown = viewModel.zoomFocus == .init(from: challengeCategory)
                }
            }
            
            if isTextShown {
                HStack {
                    challengeCategory.image
                        .foregroundStyle(challengeCategory.color)
                    Text(challengeCategory.name)
                        .textCase(.uppercase)
                }
                .transition(.scale(scale: 0.8).combined(with: .opacity))
                .font(.system(size: 13))
                .frame(width: 100, alignment: .center)
                .rotationEffect(challengeCategory.labelAngle)
                .offset(x: challengeCategory.labelPosition.x, y: challengeCategory.labelPosition.y)
            }
        }
    }
}
