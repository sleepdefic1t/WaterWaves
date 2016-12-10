//
//  Datum.swift
//  SDGWaterWaves
//
//  Created by [sleepdefic1t](https://github.com/sleepdefic1t) on 12/7/16.
//  Copyright © 2016 [☠️👽🤖👻](https://github.com/deadAlienRobotGhost). All rights reserved.
//


#if os(iOS)
    import UIKit
#elseif os(macOS)
    import Cocoa
#endif


public struct Datum {
    
    
    var amplitude: CGFloat = 0.0
    var amplitudeIdle: CGFloat = 0.0
    var amplitudeRate: CGFloat = 0.44
    var density: CGFloat = 5
    var frequency: CGFloat = 1.5
    var phase: CGFloat = 0
    var phaseShift: CGFloat = -0.15
    var peak: CGFloat = 0
    
    
}
