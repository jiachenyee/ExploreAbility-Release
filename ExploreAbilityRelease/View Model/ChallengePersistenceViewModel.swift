//
//  ChallengePersistenceViewModel.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 9/8/23.
//

import Foundation

class ChallengePersistenceViewModel: ObservableObject {
    @Published var challengeData: [ChallengePersistentData] = [] {
        didSet {
            save()
        }
    }
    
    func retrieveChallenge(_ challenge: Challenge) -> ChallengePersistentData {
        let retrievedChallengeData = challengeData.first {
            $0.feature == challenge.feature
        }
        
        return retrievedChallengeData ?? ChallengePersistentData(challenge, unlockedHints: 0)
    }
    
    func getArchiveURL() -> URL {
        let plistName = "challengedata.json"
        let documentsDirectory = URL.documentsDirectory
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let jsonEncoder = JSONEncoder()
        let encodedChallengeData = try? jsonEncoder.encode(challengeData)
        try? encodedChallengeData?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let jsonDecoder = JSONDecoder()
        
        if let retrievedChallengeData = try? Data(contentsOf: archiveURL),
           let decodedChallengeData = try? jsonDecoder.decode([ChallengePersistentData].self, from: retrievedChallengeData) {
            self.challengeData = decodedChallengeData
        }
    }
}
