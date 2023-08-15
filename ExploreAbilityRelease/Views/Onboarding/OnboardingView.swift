//
//  OnboardingView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 13/8/23.
//

import SwiftUI
import SpriteKit

struct OnboardingView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var currentTab = OnboardingTab.welcome
    
    @State private var showSkipButton = true
    
    @Namespace var namespace
    
    let onboardingBubblesScene: OnboardingBubblesScene = {
        let scene = OnboardingBubblesScene()
        scene.setUp()
        
        return scene
    }()
    
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                Group {
                    switch currentTab {
                    case .welcome:
                        Image(systemName: "iphone")
                            .font(.system(size: 64))
                            .matchedGeometryEffect(id: "phone", in: namespace)
                    case .explore:
                        ZStack {
                            Image(systemName: "iphone")
                                .font(.system(size: 64))
                                .matchedGeometryEffect(id: "phone", in: namespace)
                            
                            SpriteView(scene: onboardingBubblesScene)
                                .onAppear {
                                    onboardingBubblesScene.size = proxy.size
                                    onboardingBubblesScene.displayBalls()
                                }
                        }
                    case .challenge:
                        EmptyView()
                    case .stuck:
                        EmptyView()
                    case .learn:
                        EmptyView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .frame(height: proxy.size.height / 2)
            }
            
            TabView(selection: $currentTab) {
                OnboardingItemView(tab: .welcome)
                
                OnboardingItemView(tab: .explore)
                
                OnboardingItemView(tab: .challenge)
                
                OnboardingItemView(tab: .stuck)
                
                OnboardingItemView(tab: .learn)
            }
            .tabViewStyle(.page)
            .onChange(of: currentTab) { newValue in
                withAnimation {
                    showSkipButton = newValue != .learn
                }
            }
            
            if showSkipButton {
                Button("Skip") {
                    withAnimation {
                        viewModel.gameState = .home
                    }
                }
                .buttonStyle(.bordered)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
            
            HStack {
                if currentTab != .welcome {
                    Button("Previous") {
                        withAnimation {
                            currentTab.previous()
                        }
                    }
                }
                
                Spacer()
                
                if currentTab != .learn {
                    Button("Next") {
                        withAnimation {
                            currentTab.next()
                        }
                    }
                } else {
                    Button("Let's Go!") {
                        withAnimation {
                            viewModel.gameState = .home
                        }
                    }
                }
            }
            .padding()
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .animation(.easeInOut, value: currentTab)
    }
}
