//
//  DeveloperResourcesView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 20/6/23.
//

import Foundation
import SwiftUI

struct DeveloperResourcesView: View {
    
    var resources: [DeveloperReference]
    var ghURL: URL?
    
    @State private var interfaceFramework: DeveloperReference.Framework = .swiftUi
    
    var body: some View {
        DisclosureGroup {
            VStack(spacing: 16) {
                Picker("Interface Framework", selection: $interfaceFramework) {
                    Text("SwiftUI")
                        .tag(DeveloperReference.Framework.swiftUi)
                    Text("UIKit")
                        .tag(DeveloperReference.Framework.uiKit)
                }
                .pickerStyle(.segmented)
                
                ForEach(resources, id: \.title) { resource in
                    if resource.relatedFrameworks.contains(interfaceFramework) {
                        DeveloperResourceView(resource: resource)
                    }
                }
                .animation(.easeInOut, value: interfaceFramework)
                
                DeveloperResourceGitHubButton(ghURL: ghURL)
            }
            .tint(.blue)
            .padding(.top, 4)
        } label: {
            Label("Developer Resources", systemImage: "curlybraces")
                .font(.system(.headline))
        }
        .tint(.white)
    }
}
