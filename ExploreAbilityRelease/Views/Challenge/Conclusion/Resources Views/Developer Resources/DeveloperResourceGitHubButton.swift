//
//  DeveloperResourceGitHubButton.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 21/6/23.
//

import Foundation
import SwiftUI

struct DeveloperResourceGitHubButton: View {
    
    var ghURL: URL?
    
    var body: some View {
        if let ghURL {
            Separator()
            
            Link(destination: ghURL) {
                HStack {
                    Image(systemName: "hammer")
                    VStack(alignment: .leading) {
                        Text("See how this challenge was built")
                        Text("View source code on GitHub")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
}
