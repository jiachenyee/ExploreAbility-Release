//
//  MonoAudioChallengeView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 8/8/23.
//

import Foundation
import SwiftUI

struct MonoAudioChallengeView: View {
    
    var isFeatureToggled: Bool
    
    private let publisher = NotificationCenter.default.publisher(for: UIAccessibility.monoAudioStatusDidChangeNotification)
    
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var leftCircleProgress = 0.0
    @State private var rightCircleProgress = 0.0
    
    @StateObject private var audioViewModel = MonoAudioChallengeAudioViewModel()
    
    private let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { proxy in
            Text("Put on your headphones.")
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            Circle()
                .fill(challengeViewModel.challenge.color.opacity(0.5 - 0.5 * leftCircleProgress))
                .frame(width: proxy.size.width * (leftCircleProgress * 2), height: proxy.size.width * (leftCircleProgress * 2))
                .offset(x: -(proxy.size.width * (leftCircleProgress * 2)) / 2)
                .frame(maxHeight: .infinity, alignment: .center)
            
            Circle()
                .fill(challengeViewModel.challenge.color.opacity(0.5 - 0.5 * rightCircleProgress))
                .frame(width: proxy.size.width * (rightCircleProgress * 2), height: proxy.size.width * (rightCircleProgress * 2))
                .offset(x: proxy.size.width - (proxy.size.width * (rightCircleProgress * 2)) / 2)
                .frame(maxHeight: .infinity, alignment: .center)
            
            ChallengeHomeButton()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onAppear {
            playLeft()
        }
        .onReceive(timer) { _ in
            if Bool.random() {
                if leftCircleProgress == 0 {
                    playLeft()
                } else if rightCircleProgress == 0 {
                    playRight()
                }
            }
        }
    }
    
    func playLeft() {
        leftCircleProgress = 0
        audioViewModel.playAudioInChannel(channel: .left)
        withAnimation(.linear(duration: 7)) {
            leftCircleProgress = 1
        }
        
        Timer.scheduledTimer(withTimeInterval: 7, repeats: false) { _ in
            leftCircleProgress = 0
        }
    }
    
    func playRight() {
        rightCircleProgress = 0
        audioViewModel.playAudioInChannel(channel: .right)
        withAnimation(.linear(duration: 7)) {
            rightCircleProgress = 1
        }
        
        Timer.scheduledTimer(withTimeInterval: 7, repeats: false) { _ in
            rightCircleProgress = 0
        }
    }
}
