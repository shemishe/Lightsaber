//
//  Model.swift
//  Lightsaber
//
//  Created by Sherman Shi on 5/7/19.
//  Copyright © 2019 Sherman Shi. All rights reserved.
//

import Foundation
import AVFoundation

class Model {
    
    var turnSaberOnAudio: AVAudioPlayer?
    var turnSaberOffAudio: AVAudioPlayer?
    var saberHumAudio: AVAudioPlayer?
    var whichLightsaber: String = ""
    var isSaberOn: Bool = false
    
    init() {
        let turnSaberOnPath = Bundle.main.url(forResource: "SaberOn", withExtension: "wav")!
        do {
            turnSaberOnAudio = try AVAudioPlayer(contentsOf: turnSaberOnPath)
            turnSaberOnAudio!.prepareToPlay()
            print("saber on!")
        } catch {
            print(error)
        }
        let turnSaberOffPath = Bundle.main.url(forResource: "SaberOff", withExtension: "m4a")!
        do {
            turnSaberOffAudio = try AVAudioPlayer(contentsOf: turnSaberOffPath)
            turnSaberOffAudio!.prepareToPlay()
        } catch {
            print(error)
        }
        let saberHumPath = Bundle.main.url(forResource: "longhum", withExtension: "mp3")!
        do {
            saberHumAudio = try AVAudioPlayer(contentsOf: saberHumPath)
            saberHumAudio!.prepareToPlay()
        } catch {
            print(error)
        }
    }
    
    
    
//    func turnSaberOn() {
//        let turnSaberOnPath = Bundle.main.path(forResource: "SaberOn", ofType: "wav")
//        do {
//            turnSaberOnAudio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: turnSaberOnPath!))
//        }
//        catch {
//            print(error)
//        }
//    }
//    
//    func turnSaberOff() {
//        let turnSaberOffPath = Bundle.main.path(forResource: "SaberOff", ofType: "mp3")
//        do {
//            turnSaberOffAudio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: turnSaberOffPath!))
//        }
//        catch {
//            print(error)
//        }
//    }
}

