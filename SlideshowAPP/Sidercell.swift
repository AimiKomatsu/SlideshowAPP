//
//  Sidercell.swift
//  SlideshowAPP
//
//  Created by komatsuaimi on 2022/02/28.
//

import UIKit

class Sidercell: UIViewController {
    var imageData : UIImage!
    @IBOutlet weak var Image2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Image2.contentMode = .scaleAspectFit
        Image2.image = self.imageData
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


