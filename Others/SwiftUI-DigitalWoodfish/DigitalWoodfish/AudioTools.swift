//
//  AudioTools.swift
//  DigitalWoodfish
//
//  Created by 杨帆 on 2022/11/11.
//

import AVFoundation

class AudioTools {
    static let shared = AudioTools()

    private init() {
    }

    func playSound() {
        var soundID: SystemSoundID = 0
        let soundURL = Bundle.main.url(forResource: "muyu.mp3", withExtension: nil)
        if let soundURL = soundURL {
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &soundID)
            AudioServicesPlaySystemSound(soundID)
        }
    }
}
