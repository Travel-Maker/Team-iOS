//
//  ExpertDetailViewController.swift
//  TravelMaker
//
//  Created by 이충신 on 2018. 7. 6..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import UIKit

class ExpertDetailVC: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //배경이미지 할당 필요
        //backgroundImage = UIImage
    }
    
    override func viewWillAppear(_ animated: Bool) {
        makeNavImg()
    }
    @IBAction func applyPressed(_ sender: Any) {
        
        if let goGiveApplyVC = storyboard?.instantiateViewController(withIdentifier: "ExpertApplyVC") as? ExpertApplyVC {
            self.present(goGiveApplyVC, animated: true, completion: {
                
            })
        }
        
    }
    
}
