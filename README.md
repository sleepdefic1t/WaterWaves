# WaterWaves

Swift 3.0 macOS / iOS Cross-Platform Animated Water Waves Framework - No StoryBoards -

[![Swift Version](https://img.shields.io/badge/swift-3.0-orange.svg?style=flat)](https://github.com/apple/swift)
![cross-platform](https://img.shields.io/badge/cross--platform-Apple-blue.svg?style=flat)
![Platform](https://img.shields.io/badge/platform-iOS-blue.svg?style=flat)
![Platform](https://img.shields.io/badge/platform-macOS-blue.svg?style=flat)
[![BUILD](https://img.shields.io/badge/build-passing-brightgreen.svg?style=flat)](https://github.com/deadAlienRobotGhost/WaterWaves)
[![License: CC BY-SA 4.0](https://img.shields.io/badge/license-CC%20BY--SA%204.0-brightgreen.svg?style=flat)](http://creativecommons.org/licenses/by-sa/4.0/)

## Usage

### Setup

##### Declaration

```swift
var wave: Wave = Wave()
var waveController: WaveController = WaveController()
```

##### Insertion
```swift
override public func viewDidLoad() { 

  super.viewDidLoad() 
  wave.setup(in: view)
  
}
```

-


#### Usage

##### Scrolling

- macOS / OSX
```swift
override func scrollWheel(with event: NSEvent) {

  waveController.swell(wave, with: event)
  waveController.start(wave)
  
}
```

- iOS
```swift
public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

  waveController.swell(wave, with: event!)
  
}
```

##### Waving

```swift
waveController.roll(wave)
```

-


## To Do

- [ ] readme gif
- [ ] markup source
- [ ] create continuous waving function
- [x] f.b. g.m. like biggie


## Requirements

- iOS 9.0+
- OSX 10.11+ || macOS 10.12


## Acknowledgments

>[marty-suzuki](https://github.com/marty-suzuki)
>- [SAWaveToast](https://github.com/marty-suzuki/SAWaveToast)

--


## Suggested Resources

> [Awesome-iOS](https://github.com/vsouza/awesome-ios)
> - THE best list of awesome iOS Open-Source Objective-C and Swift Projects by [vsouza](https://github.com/vsouza)

--


> [Build Time Analyzer for Xcode](https://github.com/RobertGummesson/BuildTimeAnalyzer-for-Xcode)
> - Exellent Swift Build-Time Analyzer for Xcode by [RobertGummeson](https://github.com/RobertGummesson)

--


> [Natasha the Robot](https://github.com/natashatherobot) - [natashatherobot.com](https://www.natashatherobot.com)
> - World-Class Swift Blogger/Developer/Speaker. 

--


## About

WaterWaves is maintained by [SleepDefic1t](http://github.com/sleepdefic1t).

The names and logos for DeadAlienRobotGhost are trademarks of [DeadAlienRobotGhost](https://github.com/deadAlienRobotGhost).


## License

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.

This is free software from [SleepDefic1t](https://github.com/sleepdefic1t) / [DeadAlienRobotGhost](https://github.com/deadAlienRobotGhost), and may be redistributed accordingly
under the terms specified in the [LICENSE] file.

[LICENSE]: /LICENSE
