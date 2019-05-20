//
//  ViewController.swift
//  Sunrise
//
//  Created by Indah Fitriany on 20/05/19.
//  Copyright © 2019 Indah Fitriany. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
   
    var player : AVAudioPlayer!
    var temp = 0
    
    @IBOutlet weak var sunriseView: UIImageView!
    
    let soundArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    var selectedSoundFileName = ""
    
    @IBOutlet var noteButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for note in noteButtons {
             note.layer.cornerRadius =
            note.frame.width/2
        }
        
        self.noteButtons[2].alpha = 0.5
       
    }

    @IBAction func noteButtonPressed(_ sender: UIButton) {
        selectedSoundFileName = soundArray[sender.tag - 1]
        
        playSound()
        
        if sunriseView.center.y >= 0 {
            UIView.animate(withDuration: 0.5, animations: {
            self.sunriseView.center.y += -50
            })
        }
        
        if self.temp == 0{
            UIButton.animate(withDuration: 1, animations: {
                self.noteButtons[2].alpha = 1 //3
                self.temp = 1
            }) { _ in
                self.noteButtons[2].alpha = 0.5
            }
        }else if self.temp == 1{
            UIButton.animate(withDuration: 1, animations: {
                self.noteButtons[2].alpha = 1 //3
                self.temp = 2
            }) { _ in
                self.noteButtons[3].alpha = 0.5
            }
        }else if self.temp == 2{
            UIButton.animate(withDuration: 1, animations: {
                self.noteButtons[3].alpha = 1 //4
                self.temp = 3
            }) { _ in
                self.noteButtons[4].alpha = 0.5
            }
        }
        else if self.temp == 3{
            UIButton.animate(withDuration: 1, animations: {
                self.noteButtons[4].alpha = 1 //5
                self.temp = 4
            }) { _ in
                self.noteButtons[4].alpha = 0.5
            }
        }else if self.temp == 4{
            UIButton.animate(withDuration: 1, animations: {
                self.noteButtons[4].alpha = 1 //5
                self.temp = 5
            }) { _ in
                self.noteButtons[3].alpha = 0.5
            }
        }else if self.temp == 5{
            UIButton.animate(withDuration: 1, animations: {
                self.noteButtons[3].alpha = 1 //4
                self.temp = 6
            }) { _ in
                self.noteButtons[2].alpha = 0.5
            }
        }else if self.temp == 6{
            UIButton.animate(withDuration: 1, animations: {
                self.noteButtons[2].alpha = 1 //3
                self.temp = 7
            }) { _ in
                self.noteButtons[1].alpha = 0.5
            }
        }
        else if self.temp == 7{
            UIButton.animate(withDuration: 1, animations: {
                self.noteButtons[1].alpha = 1 //2
                self.temp = 8
            }) { _ in
                self.noteButtons[0].alpha = 0.5
            }
        }else if self.temp == 8{
            UIButton.animate(withDuration: 1, animations: {
                self.noteButtons[0].alpha = 1 //1
                self.temp = 9
            }) { _ in
                self.noteButtons[0].alpha = 0.5
            }
        }else if self.temp == 9{
            UIButton.animate(withDuration: 1, animations: {
                self.noteButtons[0].alpha = 1 //1
                self.temp = 10
            }) { _ in
                self.noteButtons[1].alpha = 0.5
            }
        }else if self.temp == 10{
            UIButton.animate(withDuration: 1, animations: {
                self.noteButtons[1].alpha = 1 //2
                self.temp = 11
            }) { _ in
                self.noteButtons[2].alpha = 0.5
            }
        }else if self.temp == 11{
            UIButton.animate(withDuration: 1, animations: {
                self.noteButtons[2].alpha = 1 //3
                self.temp = 12
            }) { _ in
                self.noteButtons[1].alpha = 0.5
            }
        }else if self.temp == 12{
            UIButton.animate(withDuration: 1, animations: {
                self.noteButtons[1].alpha = 1 //2
                self.temp = 13
            }) { _ in
                self.noteButtons[0].alpha = 0.5
            }
        }else if self.temp == 13{
            UIButton.animate(withDuration: 1, animations: {
                self.noteButtons[0].alpha = 1 //1
                self.temp = 14
            }) { _ in
                self.noteButtons[0].alpha = 0.5
            }
        }else if self.temp == 14{
            UIButton.animate(withDuration: 1, animations: {
                self.noteButtons[0].alpha = 1 //1
                self.temp = 15
            }) { _ in
                self.noteButtons[0].alpha = 0.5
            }
        }
        
        
        
    }
    
    
    
    func playSound() {
        
        guard let url = Bundle.main.url(forResource: selectedSoundFileName, withExtension: "wav", subdirectory: "SoundFile") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
            
            
        } catch let error {
            print(error.localizedDescription)
        }
        
       
    }
}

