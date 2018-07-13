//
//  ShowApplyViewController.swift
//  TravelMaker
//
//  Created by 조예은 on 2018. 7. 6..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import UIKit

class ShowApplyVC: UIViewController, UITableViewDelegate, UITableViewDataSource, APIService {
    

    @IBOutlet weak var showApplyTableView: UITableView!
    
    var commentNum = 3
    var commentBlank = 1
    
    var sender : String = ""
    var boards : [Board] = []
    var plans : [Plan] = []
    var comments : [Comment] = []
    var contents : [CommentData] = []
    var selectedApply : BoardData!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.showApplyTableView.dataSource = self;
        self.showApplyTableView.delegate = self;
        
        print("선택된 보드의 고유 인덱스 = \(selectedApply.boardIdx)")
        self.applyShowInit(url: url("/board/detail/\(selectedApply.boardIdx)"))
    }
    

    @IBAction func dismissBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func applyExpertBtn(_ sender: Any) {
        self.simpleAlertwithHandler(title: "신청하기", message: "전문가에게 신청하시겠습니까?", okHandler: self.ApplyOkHandler(_:))
    }
    func ApplyOkHandler(_ sender:UIAlertAction) -> Void {
        self.simpleAlert(title: "신청 완료", message: "보낸 신청함을 확인하세요.")
    }
    
    @IBAction func addCommentBtn(_ sender: Any) {
        if commentBlank == 0 {
            simpleAlert(title: "작성 오류", message: "댓글을 작성해주세요!")
        }else{
            commentNum += 1
            showApplyTableView.reloadData()
        }
        
    }
    
    
    func applyShowInit(url: String){
        print("result!!!!!")//작동!
        
        //********************* 함수 작동이 안됨!!!!!!
        ShowApplyService.shareInstance.applyInit(url: url, completion: { [weak self] (result) in
            guard let `self` = self else { return }
            print(result)
            
            switch result {
            case .networkSuccess(let GetBoardData):
        
                print("GetBoardData!!!!!@@@@@@@@")
                print(GetBoardData)
                
                //*************************
                self.boards = GetBoardData as! [Board]
                self.plans = GetBoardData as! [Plan]
                self.comments = GetBoardData as! [Comment]
                
                self.showApplyTableView.reloadData()
        
//                print("")
//                print("board배열의 수 = \(self.boards.count)")
//                print("")
//                print("plan배열의 수 = \(self.plans.count)")
                
                break
                
            case .networkFail :
                self.simpleAlert(title: "network", message: "check")
            default :
                break
            }
            
        })
    }
    
    //TableView 관련 함수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }else {
            return commentNum
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell1 = showApplyTableView.dequeueReusableCell(withIdentifier: "ShowApplyTVCell1") as! ShowApplyTVCell1
            
            //cell1.nickNameLB.text = sender.nickName
            cell1.configure(board: boards[indexPath.row])
            cell1.configure2(plan: plans[indexPath.row])
            
//            if cell1.addCommentTF.text == ""{
//                commentBlank = 0
//            }else {
//                commentBlank = 1
//            }
            return cell1
        }
        else{
            let cell2 = showApplyTableView.dequeueReusableCell(withIdentifier: "ShowApplyTVCell2") as! ShowApplyTVCell2
            
            cell2.configure3(comment: comments[indexPath.row], content: contents[indexPath.row])
            
            return cell2
        }
    }
    
}

