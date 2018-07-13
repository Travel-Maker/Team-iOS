//
//  HomeDetailViewController.swift
//  TravelMaker
//
//  Created by 이충신 on 2018. 7. 5..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import UIKit
import Alamofire

class HomeDetailVC: UIViewController, UITableViewDataSource, UITableViewDelegate, APIService{
    
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var detailTableView: UITableView!
    
    var applys : [BoardData] = []
    var temp: [BoardData] = []
    var countryIdx : String = "8"
    
    @IBAction func goExpertBtn1(_ sender: Any) {
        guard let showExpertVC1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ExpertDetailVC") as? ExpertDetailVC else { return}
        
        self.navigationController?.pushViewController(showExpertVC1, animated: true)
    }
    @IBAction func goExpertBtn2(_ sender: Any) {
        guard let showExpertVC2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ExpertDetailVC") as? ExpertDetailVC else { return}
        
        self.navigationController?.pushViewController(showExpertVC2, animated: true)
    }
    @IBAction func goExpertBtn3(_ sender: Any) {
        guard let showExpertVC3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ExpertDetailVC") as? ExpertDetailVC else { return}
        
        self.navigationController?.pushViewController(showExpertVC3, animated: true)
    }
    
    
    // 더보기 버튼을 통해 MoreExpert로 이동
    @IBAction func moreExpertList(_ sender: Any) {
        
        guard let moreExpertVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MoreExpertVC") as? MoreExpertVC else { return}
        
        self.navigationController?.pushViewController(moreExpertVC, animated: true)
    }
    
    // 더보기 버튼을 통해 MoreApply로 이동
    @IBAction func moreApplyList(_ sender: Any) {
        
        guard let moreApplyVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MoreApplyVC") as? MoreApplyVC else { return }
        
        self.navigationController?.pushViewController(moreApplyVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.detailTableView.delegate = self;
        self.detailTableView.dataSource = self;
        
        //신청하기 목록 Get
        self.ApplyBoardInit(url: url("/board/" + countryIdx))
        
        //국가별로 이미지를 받아와 countryImage 변수에 할당해야함
        //countryImage.image = #imageLiteral(resourceName: "china_img")
    }
    
    func ApplyBoardInit(url : String){
        
        MoreApplyService.shareInstance.moreApplyInit(url: url, completion: { [weak self] (result) in
            guard let `self` = self else { return }
            
            switch result {
                
            case .networkSuccess(let boardData):
                self.applys = boardData as! [BoardData]
                self.detailTableView.reloadData()
                break
                
            case .networkFail :
                self.simpleAlert(title: "network", message: "check")
            default :
                break
            }
            
        })
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    // 하단의 신청해요 테이블은 항상 5개를 유지한다.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return applys.count
        }else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeDetailTVCell1") as! HomeDetailTVCell1
            return cell
            
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeDetailTVCell2") as! HomeDetailTVCell2
            
           
                cell.configure(apply: applys[indexPath.row])
                cell.numLB.text = (String)(indexPath.row+1)
            
            return cell
            
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeDetailTVCell3") as! HomeDetailTVCell3
            return cell
        }
        //여기서 신청하는 데이터마다 할당
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let ApplyDetailVC = storyboard?.instantiateViewController(withIdentifier: "ShowApplyVC") as? ShowApplyVC {
            self.present(ApplyDetailVC, animated: true, completion: {
                
            })
        }
    }
    
    
    
    
    
}
