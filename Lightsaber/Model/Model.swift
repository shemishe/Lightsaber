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
    
    var turnSaberOnAudio: AVAudioPlayer = AVAudioPlayer()
    
    func turnSaberOn() {
        let turnSaberOnPath = Bundle.main.path(forResource: "SaberOn", ofType: "wav")
        do {
            turnSaberOnAudio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: turnSaberOnPath!))
        }
        catch {
            print(error)
        }
    }
    
}
