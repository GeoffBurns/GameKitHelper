//
//  Authenticate.swift
//
//  Created by Geoff Burns on 3/10/21.
//

import GameKit

public enum Authenticate
{
    public static func user() {
        Task { @MainActor in
            let localPlayer = GKLocalPlayer.local
            localPlayer.authenticateHandler = { vc, error in
                guard error == nil else {
                    print(error?.localizedDescription ?? "")
                    return
                }
                GKAccessPoint.shared.location = Authenticate.location
                GKAccessPoint.shared.isActive = localPlayer.isAuthenticated
            }
        }
    }

    public static var isLoggedIn : Bool { GKAccessPoint.shared.isActive }
    @MainActor
    public static var location : GKAccessPoint.Location  = .topLeading
}
   
