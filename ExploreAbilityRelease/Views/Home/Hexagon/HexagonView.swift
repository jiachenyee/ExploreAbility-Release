//
//  HexagonView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import Foundation
import SwiftUI

struct HexagonView: View {
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
                    Circle()
                        .frame(width: 50, height: 50)
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
        }
    }
}
