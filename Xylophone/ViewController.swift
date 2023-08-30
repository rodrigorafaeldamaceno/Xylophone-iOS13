//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        let soundName = sender.currentTitle
        if(soundName==nil) {return}
                
        playSound(soundName: sender.titleLabel!.text!)
        sender.layer.opacity = 0.8;
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.layer.opacity = 1.0
        }
    }
    
    func playSound(soundName: String) {
        guard let path = Bundle.main.path(forResource: soundName, ofType: "wav") else { return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()   
        } catch let error {
            print(error.localizedDescription)
        }  
    }

}

