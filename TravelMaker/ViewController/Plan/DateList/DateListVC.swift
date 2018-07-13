//
//  DateListVC.swift
//  TravelMaker
//
//  Created by 조예은 on 2018. 7. 7..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import UIKit

class DateListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var dateListTableView: UITableView!
    
    @IBAction func cancelBtn(_ sender: Any) {
        self.simpleAlertwithHandler(title: "작성 취소", message: "내용은 저장되지 않습니다. \n취소하시겠습니까?", okHandler: self.registerOkHandler(_:))
    }
    
    
    @IBAction func sendPlanBtn(_ sender: Any) {
        self.simpleAlertwithHandler(title: "보내기", message: "계획서를 전달하시겠습니까?", okHandler: self.registerOkHandler(_:))
    }
    func registerOkHandler(_ sender:UIAlertAction) -> Void {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func moreViewApply(_ sender: Any) {
        if let ViewVC = storyboard?.instantiateViewController(withIdentifier: "MoreViewApplyVC") as? MoreViewApplyVC {
            self.present(ViewVC, animated: true, completion: {
                print(22222222) // present 이후 실행될 것.
            })
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dateListTableView.dequeueReusableCell(withIdentifier: "DateListTVCell") as! DateListTVCell
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let goPlaceVC = storyboard?.instantiateViewController(withIdentifier: "PlaceVC") as? PlaceVC {
            self.present(goPlaceVC, animated: true, completion: {
                
            })
        }
    }
}

