//
//  ReceivePlanViewController.swift
//  TravelMaker
//
//  Created by 이충신 on 2018. 7. 2..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import UIKit

class ReceivePlanVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var receivePlanTV: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.receivePlanTV.delegate = self;
        self.receivePlanTV.dataSource = self;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        makeNavImg()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }else {
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
        let cell = receivePlanTV.dequeueReusableCell(withIdentifier: "ReceivePlanTVCell1") as! ReceivePlanTVCell1
            return cell
        }else {
            let cell = receivePlanTV.dequeueReusableCell(withIdentifier: "ReceivePlanTVCell2") as! ReceivePlanTVCell2
            return cell
        }
    
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let acceptVC = storyboard?.instantiateViewController(withIdentifier: "AcceptApplyVC") as? AcceptApplyVC {
            self.present(acceptVC, animated: true, completion: {
                
            })
        }
    }
}
