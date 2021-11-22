//
//  Leaderboard.swift
//
//  Created by Geoff Burns on 3/10/21.
//

import GameKit

public enum Leaderboard
{
    static func report(_ score: Int) {
        guard Authenticate.isLoggedIn else { return }
        guard !Leaderboard.name.isEmpty else { return }
        GKLeaderboard.loadLeaderboards(IDs: [Leaderboard.name]) { (boards, error) in
            guard let board = boards?.first else {return}
            board.submitScore(score, context: 0, player: GKLocalPlayer.local)
                { error in
                    if let error = error {
                        print(error)
                    }
                }
            }
       }
    static var name : String = ""
}
   

