//
//  AwardExportView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 10/8/23.
//

import Foundation
import SwiftUI

struct AwardExportView: View {
    
    var challenge: Challenge
    var date: Date
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "d MMM yyyy"
        
        return formatter
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 16) {
                ZStack {
                    Circle()
                        .fill(challenge.color)
                        .frame(width: 256, height: 256)
                        .shadow(color: challenge.category.color, radius: 50)
                    challenge.image
                        .font(.system(size: 128))
                }
                
                Text(challenge.feature)
                    .font(.system(size: 90))
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding([.top, .horizontal], 20)
                    .foregroundStyle(.white)
                
                Text(dateFormatter.string(for: date)!)
                    .font(.system(size: 64))
                    .foregroundStyle(.white.opacity(0.6))
            }
            .padding(32)
            
            Text("ExploreAbility")
                .font(.system(size: 32))
                .frame(maxHeight: .infinity, alignment: .bottom)
                .foregroundStyle(.white)
                .padding(32)
        }
        .preferredColorScheme(.dark)
        .fontDesign(.rounded)
        .background(.black)
    }
}

struct AwardExportView_Previews: PreviewProvider {
    
    static var previews: some View {
        AwardExportView(challenge: .differentiateWithoutColour, date: .now)
            .preferredColorScheme(.dark)
            .fontDesign(.rounded)
            .previewLayout(.fixed(width: 1200, height: 1200))
    }
}
