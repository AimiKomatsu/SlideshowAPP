//
//  ViewController.swift
//  SlideshowAPP
//
//  Created by komatsuaimi on 2022/02/28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nextbutton: UIButton!
    @IBOutlet weak var lastbutton: UIButton!
    @IBOutlet weak var startstop: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var timer: Timer!
    var timer_sec: Int = 0
    let imageNameArray = [
        "currImage.jpeg",
        "rightImage.jpeg",
        "leftImage.jpeg",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let image = UIImage(named: "currImage.jpg")
        imageView.contentMode = .scaleAspectFit
        //image.isUserInteractionEnabled = true
        imageView.image = image
        
        self.timer = Timer.scheduledTimer(timeInterval:2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        self.changeButtonLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @objc func updateTimer(timer: Timer) {
        self.timer_sec += 2
        self.setImage(self.timer_sec)
    }
    
    func setImage(_ imageno : Int){
        let imageNo = (imageno / 2 ) % 3
        let image = UIImage(named: imageNameArray[imageNo])
        imageView.image = image
    }
    
    @IBAction func nextbutton(_ sender: Any) {
    
        if self.timer == nil {
            self.timer_sec += 2
            self.setImage(self.timer_sec)
        }
    }


    @IBAction func lastbutton(_ sender: Any) {
    if self.timer == nil {
            self.timer_sec -= 2
            self.setImage(self.timer_sec)
        }
    }
    
    func changeButtonLabel(){
        if self.timer == nil {
            nextbutton.isEnabled = true
            lastbutton.isEnabled = true
            startstop.setTitle("再生", for: [])
        }else{
            nextbutton.isEnabled = false
            lastbutton.isEnabled = false
            startstop.setTitle("停止", for: [])
        }
    }
    

    @IBAction func startstop(_ sender: Any) {
    print("stop")
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            self.changeButtonLabel()
        }else{
            self.timer = Timer.scheduledTimer(timeInterval:2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            self.changeButtonLabel()
        }
    }
    
    @IBAction func onTouchView(_ sender: Any) {
        print("onTouchView Called")
        if self.timer != nil {
            self.timer.invalidate()
        }
        self.timer = nil
        self.changeButtonLabel()
        let imageNo: Int = (self.timer_sec / 2 ) % 3
        print("Image Number \(imageNo)")
        performSegue(withIdentifier: "toSidercell", sender: UIImage(named: imageNameArray[imageNo]))
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSidercell" {
            let Sidercell = segue.destination as! Sidercell
            Sidercell.imageData = (sender as! UIImage)
        }
    }

}
