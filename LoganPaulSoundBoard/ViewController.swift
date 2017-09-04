//
//  ViewController.swift
//  LoganPaulSoundBoard
//
//  Created by Dmitri Marian on 8/19/17.
//  Copyright © 2017 DmitryRTV. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    var rUgoodBro: AVAudioPlayer!
    var whatspopping: AVAudioPlayer!
    var goodBroSurvey: AVAudioPlayer!
    var introsong: AVAudioPlayer!
    var kongSavageDoggy: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "rUgoodBro", ofType: "wav")
        let soundURL = URL(fileURLWithPath: path!)
        
        do {
            try rUgoodBro = AVAudioPlayer(contentsOf: soundURL)
            rUgoodBro.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        
        
        
        let pathTwo = Bundle.main.path(forResource: "whatspapping", ofType: "wav")
       let soundURLtwo = URL(fileURLWithPath: pathTwo!)
        do {
            try whatspopping = AVAudioPlayer(contentsOf: soundURLtwo)
            whatspopping.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
       
        
        
        let pathThree = Bundle.main.path(forResource: "goodBroSurvey", ofType: "wav")
        let soundURLthree = URL(fileURLWithPath: pathThree!)
        do {
            try goodBroSurvey = AVAudioPlayer(contentsOf: soundURLthree)
            goodBroSurvey.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        
        let pathFour = Bundle.main.path(forResource: "introsong", ofType: "wav")
        let soundURLfour = URL(fileURLWithPath: pathFour!)
        do {
            try introsong = AVAudioPlayer(contentsOf: soundURLfour)
            introsong.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        
        let pathFive = Bundle.main.path(forResource: "kongSavageDoggy", ofType: "wav")
        let soundURLFive = URL(fileURLWithPath: pathFive!)
        do {
            try kongSavageDoggy = AVAudioPlayer(contentsOf: soundURLFive)
            kongSavageDoggy.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    
    
    @IBAction func introsongPressed(sender: UIButton){
        playintrosong()
    }
    
    @IBAction func playrUgoodBroPressed(sender: UIButton){
        playrUgoodBro()
    }
    
    @IBAction func whatspoppingPressed(sender: UIButton){
        playwhatspopping()
    }
    
    @IBAction func goodBroSurveyPressed(sender: UIButton){
        playgoodBroSurvey()
    }
    
    @IBAction func kongSavageDoggyPressed(sender: UIButton){
        playkongSavageDoggy()
    }
    
    func playkongSavageDoggy(){
        if kongSavageDoggy.isPlaying{
            kongSavageDoggy.stop()
        }
        kongSavageDoggy.play()
    }
    
    func playintrosong(){
        if introsong.isPlaying{
            introsong.stop()
        }
        introsong.play()
    }
    func playgoodBroSurvey() {
        if goodBroSurvey.isPlaying{
            goodBroSurvey.stop()
        }
        goodBroSurvey.play()
    }
    
    func playwhatspopping(){
        if whatspopping.isPlaying{
            whatspopping.stop()
        }
        whatspopping.play()
    }
    func playrUgoodBro(){
        if rUgoodBro.isPlaying{
            rUgoodBro.stop()
        }
        rUgoodBro.play()
    }
    
}

