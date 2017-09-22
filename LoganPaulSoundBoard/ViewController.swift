//
//  ViewController.swift
//  LoganPaulSoundBoard
//
//  Created by Dmitri Marian on 8/19/17.
//  Copyright © 2017 DmitryRTV. All rights reserved.
//

import UIKit
import AVFoundation
import GoogleMobileAds


class ViewController: UIViewController, GADBannerViewDelegate {

    
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
    
    @IBOutlet weak var twitterBack: UIButton!
    @IBOutlet weak var twitterBlue: UIButton!
    @IBOutlet weak var instagramBlack: UIButton!
    @IBOutlet weak var instagramBlue: UIButton!
  
    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var removeAdsBtn: UIButton!
   
   
    
    let soundFilesNames = ["hi_Mark", "introsong", "its_a_good_bro_servey", "rUgoodBro", "savage_doggy", "whatsInTheBox", "whatspapping", "drivingWithEven", "gotchubro", "hoodie", "littleBrother", "noHoney", "plates", "thatsMyBoy", "Yah yeet"]
    
    var audioPlayers = [AVAudioPlayer]()
    
    var lastAudioPlayer = 0
    var sw = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAds()
        popUpView.layer.cornerRadius = 15
        popUpView.layer.masksToBounds = true
        
        
        
            for sound in soundFilesNames {
            
            guard let urlString = Bundle.main.path(forResource: sound, ofType: "wav") else {
                
                print("Sound file not found: \(sound)")
                
                continue
            }
            
            let url = URL(fileURLWithPath:urlString)
            
            do {
                
                // Try to do something
                let audioPlayer = try AVAudioPlayer (contentsOf:url)
                
                audioPlayers.append(audioPlayer)
            }
            catch {
                
                // Catch the error that is thrown
                audioPlayers.append(AVAudioPlayer())
      }
    }
  }
    
    func setupAds() {
        if UserDefaults.standard.bool(forKey: PurchaseManager.instance.IAP_REMOVE_ADS) {
            removeAdsBtn.removeFromSuperview()
            bannerView.removeFromSuperview()
        } else {
            bannerView.adUnitID = "ca-app-pub-2103888227716232/2446723963"
            bannerView.rootViewController = self
            bannerView.load(GADRequest())
        }
    }
    
    @IBAction func removeAdsPressed(_ sender: Any) {
        //show a loading spinner ActivityIndicator
        PurchaseManager.instance.purchaseRemoveAds { success in
            //dismiss spinner
            if success {
                self.bannerView.removeFromSuperview()
                self.removeAdsBtn.removeFromSuperview()
            } else {
                //show message to the user
            }
        }
    }
    
    @IBAction func restoreBtnPressed(_ sender: Any) {
        PurchaseManager.instance.restorePurchases { success in
            if success {
                self.setupAds()
            }
        }
        
    }
    
    @IBAction func btnPressed(_ sender: UIButton) {
        let audioPlayer = audioPlayers[sender.tag]
        audioPlayer.play()
    }
    
    
    
    @IBAction func twitterBlueBtnPressed(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://twitter.com/dimamarian61")! as URL, options: [:], completionHandler: nil)
            }
    
    @IBAction func twitterBlackBtnPressed(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://twitter.com/dimamarian61")! as URL, options: [:], completionHandler: nil)             }

    @IBAction func instagramBlackBtnPressed(_ sender: Any)
{
    let Username =  "dmitryrtv" // Your Instagram Username here
    let appURL = NSURL(string: "instagram://user?username=\(Username)")!
    let webURL = NSURL(string: "https://instagram.com/\(Username)")!
    let application = UIApplication.shared
    
    if application.canOpenURL(appURL as URL) {
        application.open(appURL as URL)
    } else {
        // if Instagram app is not installed, open URL inside Safari
        application.open(webURL as URL)
    }
    
           }
    
    @IBAction func instagramBlueBtnPressed(_ sender: Any){
        let Username =  "dmitryrtv" // Your Instagram Username here
        let appURL = NSURL(string: "instagram://user?username=\(Username)")!
        let webURL = NSURL(string: "https://instagram.com/\(Username)")!
        let application = UIApplication.shared
        
        if application.canOpenURL(appURL as URL) {
            application.open(appURL as URL)
        } else {
            // if Instagram app is not installed, open URL inside Safari
            application.open(webURL as URL)
        }
           }
    
    
    @IBAction func changeBackgroundPressed(_
        sender: Any) {
        if feathersBgsmallImage.isHidden == true||smallBg.isHidden == false {
            feathersBgsmallImage.isHidden = false
            smallBg.isHidden = true
            
            self.twitterBlue.isHidden = true
            self.instagramBlue.isHidden = true
            self.instagramBlack.isHidden = false
            self.twitterBack.isHidden = false
            
        } else if smallBg.isHidden == true||feathersBgsmallImage.isHidden == false{
            smallBg.isHidden = false
            feathersBgsmallImage.isHidden = true
            
            self.twitterBlue.isHidden = false
            self.instagramBlue.isHidden = false
            self.instagramBlack.isHidden = true
            self.twitterBack.isHidden = true
        }
    }
   
    
    
    
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
    
   
    
    

}

