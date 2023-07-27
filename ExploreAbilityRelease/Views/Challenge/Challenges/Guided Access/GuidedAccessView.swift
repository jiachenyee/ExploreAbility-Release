//
//  GuidedAccessView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 25/7/23.
//

import SwiftUI

struct GuidedAccessView: View {
    
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    @EnvironmentObject var viewModel: ViewModel
    
    private let publisher = NotificationCenter.default.publisher(for: UIAccessibility.guidedAccessStatusDidChangeNotification)
    
    @State private var isGuidedAccessEnabled = UIAccessibility.isGuidedAccessEnabled
    
    @State private var didSucceed = false
    @State private var locked = false
    
    var body: some View {
        Group {
            switch challengeViewModel.state {
            case .playing: EmptyView()
                ZStack {
                    VStack {
                        Spacer()
                        Image(systemName: locked ? "lock" : "lock.open")
                        Spacer()
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    Image(systemName: locked ? "lock" : "lock.open")
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    
                    ChallengeHomeButton()
                }
                .onChange(of: isGuidedAccessEnabled) { newValue in
                    guard newValue else { return }
                    withAnimation {
                        locked = true
                    }
                    
                    Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                        withAnimation {
                            challengeViewModel.state = .playingFeatureToggled
                        }
                    }
                }
            case .playingFeatureToggled:
                PlayingFeatureOnView(initialState: false, didSucceed: $didSucceed)
                    .onChange(of: isGuidedAccessEnabled) { newValue in
                        guard !newValue else { return }
                        
                        withAnimation {
                            didSucceed = true
                        }
                    }
            default:
                EmptyView()
            }
        }
        .onReceive(publisher) { value in
            isGuidedAccessEnabled = UIAccessibility.isGuidedAccessEnabled
        }
        .onAppear {
            isGuidedAccessEnabled = UIAccessibility.isGuidedAccessEnabled
        }
    }
}
