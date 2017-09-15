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

    @IBOutlet weak var backGroundBtn: UIButton!
    @IBOutlet weak var centerPopUpConstraint: NSLayoutConstraint!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var face2: UIImageView!
    @IBOutlet weak var mavreck2: UIImageView!
    @IBOutlet weak var headMavrickLogo: UIImageView!
    @IBOutlet weak var face: UIImageView!
   
    
    @IBOutlet weak var feathersBgsmallImage: UIImageView!
    @IBOutlet weak var feathersBgBIgImage: UIImageView!
    
    @IBOutlet weak var smallBg: UIImageView!
    
    @IBOutlet weak var bigBg: UIImageView!
    
    var rUgoodBro: AVAudioPlayer!
    var whatspopping: AVAudioPlayer!
    var goodBroSurvey: AVAudioPlayer!
    var introsong: AVAudioPlayer!
    var kongSavageDoggy: AVAudioPlayer!
    var whatsInTheBox: AVAudioPlayer!
    var hiMark: AVAudioPlayer!
    
    var sw = false
         
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        popUpView.layer.cornerRadius = 15
        popUpView.layer.masksToBounds = true
        
      
        
        
        
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
        
        let pathsix = Bundle.main.path(forResource: "hiMark", ofType: "wav")
        let soundURLsix = URL(fileURLWithPath: pathsix!)
        do {
            try hiMark = AVAudioPlayer(contentsOf: soundURLsix)
            hiMark.prepareToPlay()
           
        } catch let err as NSError {
            print(err.debugDescription)
            
        }
        
        let pathseven = Bundle.main.path(forResource: "whatsInTheBox", ofType: "wav")
        let soundURLSeven = URL(fileURLWithPath: pathseven!)
        do {
            try whatsInTheBox = AVAudioPlayer(contentsOf: soundURLSeven)
            whatsInTheBox.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        
        
    }
    
    
    
    @IBAction func changeBackgroundPressed(_
        sender: Any) {
        if feathersBgsmallImage.isHidden == true||smallBg.isHidden == false {
            feathersBgsmallImage.isHidden = false
            smallBg.isHidden = true
        } else if smallBg.isHidden == true||feathersBgsmallImage.isHidden == false{
            smallBg.isHidden = false
            feathersBgsmallImage.isHidden = true
        }    }
   
    
    
    
    @IBAction func changeLogoPressed(_ sender: Any)
    {
        if face2.isHidden == true||mavreck2.isHidden == false {
            face2.isHidden = false
            mavreck2.isHidden = true
        } else if mavreck2.isHidden == true||face2.isHidden == false{
            mavreck2.isHidden = false
            face2.isHidden = true
        }
        
    }
   
  
    
    
    
   
    @IBAction func showPopUp(_ sender: Any) {
        centerPopUpConstraint.constant = 0
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut, animations:{
            self.view.layoutIfNeeded()
            
        }, completion: nil)
    
        UIView.animate(withDuration: 0.2, animations: {
            
            self.backGroundBtn.alpha = 0.5        })
    
    }
    
    @IBAction func closePopUo(_ sender: Any) {
        centerPopUpConstraint.constant = -700
        UIView.animate(withDuration: 0.1, animations: {
            self.view.layoutIfNeeded()
            self.backGroundBtn.alpha = 0
           
            
            
            if self.face2.isHidden == true{
                self.face.isHidden = true
                self.headMavrickLogo.isHidden = false
            }
            
            else if self.face2.isHidden == false{
                self.face.isHidden = false
                self.headMavrickLogo.isHidden = true
            }
            
            else if self.mavreck2.isHidden == true{
                self.headMavrickLogo.isHidden = true
                self.face.isHidden = false
            }
            
            else if self.mavreck2.isHidden == false{
                self.headMavrickLogo.isHidden =
                false
                self.face.isHidden = true
                
            }
            
            
            
            
            
            
            
            if self.smallBg.isHidden == true{
                self.bigBg.isHidden = true
                self.feathersBgBIgImage.isHidden = false
            }
                
            else if self.smallBg.isHidden == false{
                self.bigBg.isHidden = false
                self.feathersBgBIgImage.isHidden = true
            }
                
            else if self.feathersBgsmallImage.isHidden == true{
                self.feathersBgBIgImage.isHidden = true
                self.bigBg.isHidden = false
            }
                
            else if self.feathersBgsmallImage.isHidden == false{
                self.feathersBgBIgImage.isHidden =
                false
                self.bigBg.isHidden = true
                
            }
            
            
        })
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
    
    @IBAction func whatsInTheBoxPressed(sender: UIButton){
       playwhatsInTheBox()
    }
    
    @IBAction func hiMarkPressed(sender: UIButton){
       
        playHiMark()
    }
    
    func playHiMark(){
        if hiMark.isPlaying{
            hiMark.stop()
        }
        
            hiMark.play()
        
    
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
       func playwhatsInTheBox(){
        if whatsInTheBox.isPlaying{
            whatsInTheBox.stop()
        }
        whatsInTheBox.play()
    }
}

