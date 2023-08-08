//
//  IncreaseContrastChallengeView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 8/8/23.
//

import Foundation
import SwiftUI
import Accessibility

struct IncreaseContrastChallengeView: View {
    
    var isFeatureToggled: Bool
    
    private let publisher = NotificationCenter.default.publisher(for: UIAccessibility.darkerSystemColorsStatusDidChangeNotification)
    
    @State private var isIncreaseContrastEnabled = UIAccessibility.isDarkerSystemColorsEnabled
    @State private var initialIsIncreaseContrastEnabled = UIAccessibility.isDarkerSystemColorsEnabled
    
    @State private var didFinishChallenge = false
    
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    
    let constant = 0.01
    
    var body: some View {
        Group {
            if !isFeatureToggled {
                ZStack {
                    VStack {
                        Rectangle()
                            .opacity(1 * constant)
                            .overlay {
                                Text("Can you read me?")
                                    .foregroundStyle(.black)
                            }
                        Rectangle()
                            .opacity(2 * constant)
                            .overlay {
                                Text("Can you read me?")
                                    .foregroundStyle(.black)
                            }
                        Rectangle()
                            .opacity(3 * constant)
                            .overlay {
                                Text("Can you read me?")
                                    .foregroundStyle(.black)
                            }
                        Rectangle()
                            .opacity(4 * constant)
                            .overlay {
                                Text("Can you read me?")
                                    .foregroundStyle(.black)
                            }
                        Rectangle()
                            .opacity(5 * constant)
                            .overlay {
                                Text("Can you read me?")
                                    .foregroundStyle(.black)
                            }
                        Rectangle()
                            .opacity(6 * constant)
                            .overlay {
                                Text("Can you read me?")
                                    .foregroundStyle(.black)
                            }
                        Rectangle()
                            .opacity(7 * constant)
                            .overlay {
                                Text("Can you read me?")
                                    .foregroundStyle(.black)
                            }
                        Rectangle()
                            .opacity(8 * constant)
                            .overlay {
                                Text("Can you read me?")
                                    .foregroundStyle(.black)
                            }
                        Rectangle()
                            .opacity(9 * constant)
                            .overlay {
                                Text("Can you read me?")
                                    .foregroundStyle(.black)
                            }
                        Rectangle()
                            .opacity(10 * constant)
                            .overlay {
                                Text("Can you read me?")
                                    .foregroundStyle(.black)
                            }
                    }
                    ChallengeHomeButton()
                }
                .onChange(of: isIncreaseContrastEnabled) { newValue in
                    guard newValue != initialIsIncreaseContrastEnabled else { return }
                    
                    withAnimation {
                        challengeViewModel.state = .playing(true)
                    }
                }
            } else {
                PlayingFeatureOnView(initialState: initialIsIncreaseContrastEnabled,
                                     didSucceed: $didFinishChallenge)
                .onChange(of: isIncreaseContrastEnabled) { newValue in
                    if initialIsIncreaseContrastEnabled == newValue {
                        didFinishChallenge = true
                    }
                }
            }
        }
        .onReceive(publisher) { _ in
            isIncreaseContrastEnabled = UIAccessibility.isDarkerSystemColorsEnabled
        }
        .onAppear {
            initialIsIncreaseContrastEnabled = isIncreaseContrastEnabled
        }
    }
}
