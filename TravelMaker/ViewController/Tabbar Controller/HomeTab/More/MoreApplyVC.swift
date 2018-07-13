//
//  MoreApplyViewController.swift
//  TravelMaker
//
//  Created by 이충신 on 2018. 7. 5..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import UIKit
import Alamofire

class MoreApplyVC: UIViewController, UITableViewDelegate, UITableViewDataSource, APIService {
    
    @IBOutlet weak var applyTableView: UITableView!
    var applys : [BoardData] = []
    
    var countryIdx : String = "8"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyTableView.delegate = self;
        applyTableView.dataSource = self;
        
        self.ApplyBoardInit(url: url("/board/" + countryIdx))
        
    }
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        ApplyBoardInit(url: url("/board/\(countryIdx)"))
//    }
    
    @IBAction func showFilter(_ sender: Any) {
        
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopUpFilterVC") as! PopUpFilterVC
        
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
        
    }
    
    @IBAction func writeApplyBtn(_ sender: Any) {
        if let ApplyDetailVC = storyboard?.instantiateViewController(withIdentifier: "WriteApplyVC") as? WriteApplyVC {
            
            self.present(ApplyDetailVC, animated: true, completion: {
                
            })
        }
    }
    
    //*************Get Networking
    func ApplyBoardInit(url : String){

        MoreApplyService.shareInstance.moreApplyInit(url: url, completion: { [weak self] (result) in

            guard let `self` = self else { return }

            switch result {

            case .networkSuccess(let boardData):

                self.applys = boardData as! [BoardData]
                self.applyTableView.reloadData()
                break

            case .networkFail :
                self.simpleAlert(title: "network", message: "check")
            default :
                break
            }

        })

    }
    
    //tableview 관련 함수
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if let ShowApplyVC = storyboard?.instantiateViewController(withIdentifier: "ShowApplyVC") as? ShowApplyVC {
            ShowApplyVC.selectedApply = applys[indexPath.row]
            self.present(ShowApplyVC, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return applys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = applyTableView.dequeueReusableCell(withIdentifier: "MoreApplyTVCell") as! MoreApplyTVCell
        
        cell.configure(apply: applys[indexPath.row])
        cell.numLabel.text = (String)(indexPath.row+1)
        
        return cell
    }
}
