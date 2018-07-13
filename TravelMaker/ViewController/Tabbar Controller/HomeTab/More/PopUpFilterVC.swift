//
//  PopUpFilterViewController.swift
//  TravelMaker
//
//  Created by 이충신 on 2018. 7. 5..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import UIKit

class PopUpFilterVC
: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //백그라운드를 블러처리한다.
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)

        self.showAnimate()

    }
    
    
    
    @IBAction func pressedClose(_ sender: Any) {
        self.removeAnimate()
        self.view.removeFromSuperview()
    }
    @IBAction func setFilter(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
            
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
  

}
