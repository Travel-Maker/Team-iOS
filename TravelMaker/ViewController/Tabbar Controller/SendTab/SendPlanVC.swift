//
//  SendPlanViewController.swift
//  TravelMaker
//
//  Created by 이충신 on 2018. 7. 2..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import UIKit

class SendPlanVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var sendPlanTableVIew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sendPlanTableVIew.delegate = self;
        self.sendPlanTableVIew.dataSource = self;
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
            return 7
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = sendPlanTableVIew.dequeueReusableCell(withIdentifier: "SendPalnTVCell1") as! SendPalnTVCell1
            
            return cell
        }else {
            let cell = sendPlanTableVIew.dequeueReusableCell(withIdentifier: "SendPalnTVCell2") as! SendPalnTVCell2
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if let ShowVC = storyboard?.instantiateViewController(withIdentifier: "ShowSimpleApplyVC") as? ShowSimpleApplyVC {
                self.present(ShowVC, animated: true, completion: {
                    
                })
            }
        }
        
    }
    
}
