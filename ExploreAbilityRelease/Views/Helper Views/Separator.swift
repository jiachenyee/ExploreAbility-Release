//
//  Separator.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 21/6/23.
//

import Foundation
import SwiftUI

struct Separator: View {
    var body: some View {
        Rectangle()
            .fill(.white)
            .frame(height: 1)
            .accessibilityHidden(true)
    }
}
