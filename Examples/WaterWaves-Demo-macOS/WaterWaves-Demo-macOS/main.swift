//
//  main.swift
//  WaterWaves-Demo-macOS
//
//  Created by [sleepdefic1t](https://github.com/sleepdefic1t) on 12/7/16.
//  Copyright © 2016 [☠️👽🤖👻](https://github.com/deadAlienRobotGhost). All rights reserved.
//

import Cocoa

func main() {
    
    let app = NSApplication.shared(),
    delegate = AppDelegate() as NSApplicationDelegate
    app.delegate = delegate
    app.run()
    
}

main()
