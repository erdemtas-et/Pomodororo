//
//  LaunchSViewController.swift
//  Pomodororo
//
//  Created by Erdem Tas on 20.06.2021.
//

import UIKit
import CLTypingLabel
class LaunchSViewController: UIViewController {
    
    @IBOutlet weak var tomatoImage: UIImageView!
    var timer = Timer()
    var counter = 0
    @IBOutlet weak var launchText: CLTypingLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        launchText.text = "Pomodororo"
        tomatoImage.layer.shadowOpacity = 1.0
        tomatoImage.layer.shadowRadius = 3
        tomatoImage.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        tomatoImage.layer.shadowOffset = CGSize(width: 3, height: 10)
            after5seconds()
        
    
        
        
    }
    
  
    func after5seconds() {
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(selectorMethod), userInfo: nil, repeats: true)
        
       
    }
    
    
   @objc func selectorMethod() {
        if counter < 3 {
            counter += 1
        } else {
            performSegue(withIdentifier: "mainScreen", sender: self)
        }
    }
    
    
   

}
