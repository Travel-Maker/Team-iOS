//
//  PlaceVC.swift
//  TravelMaker
//
//  Created by 조예은 on 2018. 7. 7..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import UIKit

class PlaceVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var PlaceTableView: UITableView!
    
    let sectionNum = 0
    var addPlace = 0
    
    var Places = Array<Int>()
    
    
    @IBAction func cancelBtn(_ sender: Any) {
        self.simpleAlertwithHandler(title: "취소", message: "내용이 저장되지 않습니다.\n작성을 취소하시겠습니까?", okHandler: self.registerOkHandler(_:))
    }
    
    //저장 버튼 누르면
    @IBAction func saveDateBtn(_ sender: Any) {
        self.simpleAlertwithHandler(title: "저장", message: "저장하시겠습니까?", okHandler: self.registerOkHandler(_:))
    }
    
    func registerOkHandler(_ sender:UIAlertAction) -> Void {
        self.dismiss(animated: true, completion: nil)
    }
    
    //추가 버튼을 누르면
    @IBAction func plusPlaceBtn(_ sender: Any) {
        addPlace += 4
        PlaceTableView.reloadData()
        
        print("plus버튼 클릭 = \(addPlace)")
        
        let LocationAddVC = storyboard?.instantiateViewController(withIdentifier: "LocationAddVC") as! LocationAddVC
        
        self.present(LocationAddVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.PlaceTableView.delegate = self;
        self.PlaceTableView.dataSource = self;
        
    }
    
    @IBAction func memoAdd(_ sender: Any) {
        

    }
    
    @IBAction func costAdd(_ sender: Any) {
        

    }
    
    @IBAction func routeAdd(_ sender: Any) {
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print("numberofsection = \(addPlace)")
        return addPlace
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
    }

    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let deleteAction = UIContextualAction(style: .normal, title:  "Delete", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            success(true)
        })
        
        //PlaceTableView.cellForRow(at: indexPath.row)
        deleteAction.backgroundColor = .red
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 400
//    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sectionNum = (indexPath.section) % 4
        
        switch sectionNum{
        case 0:
            let cell = self.PlaceTableView.dequeueReusableCell(withIdentifier: "InfoTitleTVCell") as! InfoTitleTVCell
            return cell
        case 1:
            let cell = self.PlaceTableView.dequeueReusableCell(withIdentifier: "InfoMemoTVCell") as! InfoMemoTVCell
            return cell
        case 2:
            let cell = self.PlaceTableView.dequeueReusableCell(withIdentifier: "InfoPriceTVCell") as! InfoPriceTVCell
            return cell
        case 3:
            let cell = self.PlaceTableView.dequeueReusableCell(withIdentifier: "InfoRouteTVCell") as! InfoRouteTVCell
            return cell
        default:
            let emptyCell = UITableViewCell()
            print("fail")
            return emptyCell
        }
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let offset = scrollView.contentOffset.y
//
//        if offset < 0 {
//            print(offset)
//            scrollView.contentOffset.y = 0
//        }
//    }
    
    
}
