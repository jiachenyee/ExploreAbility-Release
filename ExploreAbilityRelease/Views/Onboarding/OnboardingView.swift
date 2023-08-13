//
//  OnboardingView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 13/8/23.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var currentTab = 0
    
    @State private var showSkipButton = true
    
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                Rectangle()
                    .fill(.blue)
                    .frame(height: proxy.size.height / 2)
            }
            TabView(selection: $currentTab) {
                OnboardingItemView(title: "Make your device\nwork for you.",
                                   description: "Accessibility is about making your device yours.")
                .tag(0)
                
                OnboardingItemView(title: "Explore.",
                                   description: "Your device comes with dozens of accessibility features built in to help everyone use it.\n\nFind out about these features, and maybe discover some that might help you!")
                .tag(1)
                
                OnboardingItemView(title: "Engage.",
                                   description: "Try out Accessibility challenges. Each challenge requires toggling a different accessibility setting in the Settings app.")
                .tag(2)
                
                OnboardingItemView(title: "Stuck?",
                                   description: "Select on the circle in the center of the screen to return home, or get a hint.")
                .tag(3)
                
                OnboardingItemView(title: "Learn.",
                                   description: "Each challenge comes with Reference Resources that can help you better understand the various accessibility features and their use-cases.\n\nDeveloping an app? There are developer resources including code snippets, external links, and videos that can help you understand how to incorporate these features into your app.")
                .tag(4)
            }
            .tabViewStyle(.page)
            .onChange(of: currentTab) { newValue in
                withAnimation {
                    showSkipButton = newValue != 4
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
                if currentTab != 0 {
                    Button("Previous") {
                        withAnimation {
                            currentTab -= 1
                        }
                    }
                }
                
                Spacer()
                
                if currentTab != 4 {
                    Button("Next") {
                        withAnimation {
                            currentTab += 1
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
    }
}

struct OnboardingItemView: View {
    
    var title: String
    var description: String
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Spacer()
                VStack(alignment: .leading) {
                    Text(title)
                        .multilineTextAlignment(.leading)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ScrollView {
                        Text(description)
                            .font(.body)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .frame(height: proxy.size.height / 2, alignment: .top)
            }
        }
        .padding()
    }
}
