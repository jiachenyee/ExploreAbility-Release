//
//  OnboardingItemView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 14/8/23.
//

import SwiftUI

struct OnboardingItemView: View {
    
    var tab: OnboardingTab
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Spacer()
                VStack(alignment: .leading) {
                    Text(tab.title)
                        .multilineTextAlignment(.leading)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ScrollView {
                        Text(tab.description)
                            .font(.body)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .frame(height: proxy.size.height / 2, alignment: .top)
            }
        }
        .padding()
        .tag(tab)
    }
}
