//
//  Achievements.swift
//
//  Created by Geoff Burns on 3/10/21.
//

import GameKit

public enum Achievements
    {
    public static func report(_ achievementID: String) {
        guard Authenticate.isLoggedIn else { return }
        guard !achievementID.isEmpty else { return }
        GKAchievement.loadAchievements() { (achievements: [GKAchievement]?, error: Error?) in
            // Find an existing achievement.
            let achievement = achievements?.first(where: { $0.identifier == achievementID})
            
            // Otherwise, create a new achievement.
            if achievement == nil {
                let newAward = GKAchievement(identifier: achievementID)
                newAward.percentComplete = 100.0
                GKAchievement.report([newAward]) {(error: Error?) in
                    if error != nil {
                        // Handle the error that occurs.
                        print("Error: \(String(describing: error))")
                    }
                }
            }
            if error != nil {
                // Handle the error that occurs.
                print("Error: \(String(describing: error))")
            }
        }
    }
}
