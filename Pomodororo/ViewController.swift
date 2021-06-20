//
//  ViewController.swift
//  Pomodororo
//
//  Created by Erdem Tas on 20.06.2021.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var player : AVAudioPlayer?
    var timer = Timer()
    var counter = 0
    @IBOutlet weak var tenminBut: UIButton!
    @IBOutlet weak var twentyMinBut: UIButton!
    @IBOutlet weak var thirtyMinBut: UIButton!
    
    var totalTime = 0
    @IBOutlet weak var progressBarView: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        progressBarView.layer.cornerRadius = 10.0
        progressBarView.clipsToBounds = true
        progressBarView.progress = 0.0
        
        shadowsForButtons(button: tenminBut)
        shadowsForButtons(button: twentyMinBut)
        shadowsForButtons(button: thirtyMinBut)
        
        
    }


    @IBAction func timeButtonPressed(_ sender: UIButton) {
        counter = 0
        timer.invalidate()
        
        
        if sender.tag == 10 {
            makeBackgroundWhite()
            totalTime = 1200
            sender.tintColor = .gray
            
        } else if sender.tag == 20 {
            makeBackgroundWhite()
            sender.tintColor = .white
            totalTime = 1800
            sender.tintColor = .gray
           
        } else {
           makeBackgroundWhite()
            totalTime = 2400
            sender.tintColor = .gray
           
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
    }
    
    @objc func timerFunc() {
        
        if totalTime > counter {
            
            counter += 1
            progressBarView.progress = Float(Float(counter)/Float(totalTime))
            print(counter)
        } else {
            self.timer.invalidate()
            
           
            
            let alert = UIAlertController(title: "Time's Up", message: "It is time to take a break!", preferredStyle: UIAlertController.Style.alert)
            let alertButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel) { alertAction in
                self.totalTime = 0
                self.counter = 0
                self.progressBarView.progress = 0.0
                self.makeBackgroundWhite()
               
                
            }
            alert.addAction(alertButton)
            present(alert, animated: true, completion: nil)
            self.playSound(file: "timeup")
        }
    }
    
    func playSound(file: String ) {
           let url = Bundle.main.url(forResource: file, withExtension: "wav")
           player = try? AVAudioPlayer(contentsOf: url!)
            player?.play()
           
}

    func makeBackgroundWhite() {
        self.tenminBut.tintColor = .white
        self.twentyMinBut.tintColor = .white
        self.thirtyMinBut.tintColor = .white
    }

    
    func shadowsForButtons (button : UIButton) {
        button.layer.shadowOffset = CGSize(width: 0.0, height: 10.0)
        button.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 1.0
        
    }


}
