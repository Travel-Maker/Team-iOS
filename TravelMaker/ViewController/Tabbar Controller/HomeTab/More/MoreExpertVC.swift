//
//  MoreExpertViewController.swift
//  TravelMaker
//
//  Created by 이충신 on 2018. 7. 5..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import UIKit

class MoreExpertVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var monthExpertTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        monthExpertTableView.delegate = self;
        monthExpertTableView.dataSource = self;
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tabBarItem.isEnabled = true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = monthExpertTableView.dequeueReusableCell(withIdentifier: "MoreExpertTVCell") as! MoreExpertTVCell
        
        cell.profileImage.image = #imageLiteral(resourceName: "expert_img_2")
        cell.idLabel.text = "천방지축 어리둥절 빙글빙글 돌아가는 충신의 하루"
        cell.crownImage.image = #imageLiteral(resourceName: "blue_crown_master")
        cell.typeLabel.text = "먹방형"
        cell.cityLabel.text = "목동"
        cell.starRateImage.image = #imageLiteral(resourceName: "star4")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let expertDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ExpertDetailVC") as! ExpertDetailVC
        
        self.navigationController?.pushViewController(expertDetailVC, animated: true)
    }
    
    @IBAction func showFilter(_ sender: Any) {
        
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopUpFilterVC") as! PopUpFilterVC
        
        
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
        
        
    }
    
    
    
    
}
