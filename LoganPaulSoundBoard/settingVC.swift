//
//  settingVC.swift
//  LoganPaulSoundBoard
//
//  Created by Dmitri Marian on 8/21/17.
//  Copyright © 2017 DmitryRTV. All rights reserved.
//

import UIKit

class settingVC: UIViewController {

    @IBOutlet weak var settingBn: UIButton!
    
    @IBOutlet weak var changeBgBtn: UIButton!
    
    @IBOutlet weak var changeLogoBtn: UIButton!
    
    @IBOutlet weak var likeBtn: UIButton!
    
    @IBOutlet weak var upFace: UIImageView!
    
    @IBOutlet weak var upMlogo: UIImageView!
    
    @IBOutlet weak var downFace: UIImageView!
    
    @IBOutlet weak var downMlogo: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeLogoBtnPressed(_ sender: Any) {
        
        upFace.isHidden = false
        upMlogo.isHidden = true
        downFace.isHidden = false
        downMlogo.isHidden = true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
