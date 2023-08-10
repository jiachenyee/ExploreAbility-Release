//
//  GameCenterView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 10/8/23.
//

import Foundation
import GameKit
import SwiftUI
import UIKit

struct GameCenterView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let gameCenterVC = GKGameCenterViewController()
        gameCenterVC.gameCenterDelegate = context.coordinator
        
        return gameCenterVC
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // Update the view controller if needed
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, GKGameCenterControllerDelegate {
        var parent: GameCenterView
        
        init(_ parent: GameCenterView) {
            self.parent = parent
        }
        
        func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
            gameCenterViewController.dismiss(animated: true)
        }
    }
}
