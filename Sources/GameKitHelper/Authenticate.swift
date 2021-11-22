//
//  Authenticate.swift
//
//  Created by Geoff Burns on 3/10/21.
//

import GameKit

public enum Authenticate
{
    static func user() {
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
    
    static var isLoggedIn : Bool { GKAccessPoint.shared.isActive }
    static var location : GKAccessPoint.Location  = .topLeading
}
   
