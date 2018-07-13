//
//  HomeViewController.swift
//  TravelMaker
//
//  Created by 이충신 on 2018. 7. 2..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    var sectionNum:Int = -1
    var countryCount:Int = 0
    
    var continentArray = ["a", "e", "n"]
    
    var asiaImageArray = [#imageLiteral(resourceName: "asia_img1"), #imageLiteral(resourceName: "asia_img2"), #imageLiteral(resourceName: "asia_img3")]
    var europeImageArray = [#imageLiteral(resourceName: "europe_img_1"), #imageLiteral(resourceName: "euro_img_2"),#imageLiteral(resourceName: "euro_img_3")]
    var northImageArray = [#imageLiteral(resourceName: "usa"),#imageLiteral(resourceName: "canada"),#imageLiteral(resourceName: "mexico")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func searchBtn(_ sender: Any) {
        if let SearchVC = storyboard?.instantiateViewController(withIdentifier: "ExploreVC") as? ExploreVC {
            self.present(SearchVC, animated: true, completion: {
                // present 이후 실행될 것.
            })
        }

    }
    
    @IBAction func countryBtnPressed(_ sender: Any) {
        guard let HomeDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeDetailVC") as? HomeDetailVC else
        { return print("this")}
        
        self.navigationController?.pushViewController(HomeDetailVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        makeNavImg()
    }
    
    //***테이블 뷰 관련***
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return continentArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTVCell") as! HomeTVCell
        
        sectionNum = indexPath.section
    
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTVHCell") as! HomeTVHCell
        
        if section == 0 {
            cell.continentLabel.text = "아시아"
        }else if section == 1 {
            cell.continentLabel.text = "유럽"
        }else {
            cell.continentLabel.text = "북아메리카"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
    }
    
    //*** 콜렉션 뷰 관련 ***
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCVCell", for: indexPath) as! HomeCVCell
        
        if sectionNum == 0 {
            cell.countryBtn.setImage(asiaImageArray[indexPath.row], for: UIControlState.normal)
        }else if sectionNum == 1 {
            
            cell.countryBtn.setImage(europeImageArray[indexPath.row], for: UIControlState.normal)
        }else {
            cell.countryBtn.setImage(northImageArray[indexPath.row], for: UIControlState.normal)
        }
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if sectionNum == 0 {
            countryCount = asiaImageArray.count
        }else if sectionNum == 1 {
            countryCount = europeImageArray.count
        }else {
            countryCount = northImageArray.count
        }
        return countryCount
    }
    
    
    //    추후 구현
    //    버튼을 선택하면 화면전환이 이루어짐
    //    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //        <#code#>
    //    }
    
}




