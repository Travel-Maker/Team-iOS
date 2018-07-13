//
//  FavoriteViewController.swift
//  TravelMaker
//
//  Created by 이충신 on 2018. 7. 2..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

//좋아요페이지 = CollectionView + TableView
import UIKit

//테스트용 전문가 데이터
struct Expert {
    
    var image: UIImage?
    var id: String?
    var type: String?
    var maincity: String?
    var rate: Float?
    
}


class FavoriteVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var favoriteTableView: UITableView!
    @IBOutlet weak var favoriteCollectionView: UICollectionView!
    
    
    var expertData1 = Expert(image: #imageLiteral(resourceName: "gray_img") ,id: "내발산동 영맨충신", type: "고독한여행가", maincity: "도쿄", rate: 5.0)
    var expertData2 = Expert(image: #imageLiteral(resourceName: "gray_img") ,id: "ggommi92", type: "고독한여행가", maincity: "도쿄", rate: 3.0)

    
    
    var countryArray = ["프랑스","미국","영국"]
    var personArray = ["A", "B", "C","D","E"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        favoriteTableView.delegate = self;
        favoriteTableView.dataSource = self;
        favoriteTableView.register(UITableViewCell.self, forCellReuseIdentifier: "favoriteTableViewCell")
        
        favoriteCollectionView.delegate = self;
        favoriteCollectionView.dataSource = self;
        favoriteCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "favoriteCollectionVeiwCell")
        
        favoriteTableView.tableFooterView = UIView(frame: .zero)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        makeNavImg()
        self.tabBarController?.tabBar.isHidden = false
    }

    
    //***TableView Function***
    
    //테이블 뷰에 대한 section의 수 : 1
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //테이블 뷰에서 row의 수(cell의 수) : 전문가의 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personArray.count
    }
    //테이블 뷰에서 indexpath.row를 받을 수 있는 부분
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"FavoriteTVCell") as! FavoriteTVCell
        
        if indexPath.row == 0 {
            cell.profileImage.image = expertData1.image
            cell.idLabel.text = expertData1.id
            cell.typeLabel.text = expertData1.type
            cell.cityLabel.text = expertData1.maincity
            }
        else {
            cell.profileImage.image = expertData2.image
            cell.idLabel.text = expertData2.id
            cell.typeLabel.text = expertData2.type
            cell.cityLabel.text = expertData2.maincity
        }
        return cell
    }
    
    //테이블 뷰 셀 선택사항 추후 구현
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let showExpertVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ExpertDetailVC") as! ExpertDetailVC
        self.navigationController?.pushViewController(showExpertVC, animated: true)

    }
    
    //***CollectionView Function***
    
 
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //콜렉션 뷰에서 item의 수 : 나라의 수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return countryArray.count
    }

    //콜렉션 뷰에서 indexPath.row를 받을 수 있는 부분
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCVCell", for: indexPath) as! FavoriteCVCell
     
        
        if indexPath.row == 0 {
            cell.favoriteCountryImage.image = #imageLiteral(resourceName: "h_c_1")        }
        else if indexPath.row == 1 {
            cell.favoriteCountryImage.image = #imageLiteral(resourceName: "h_c_2")
        }
        else {
            cell.favoriteCountryImage.image = #imageLiteral(resourceName: "h_c_3")
        }
        
        return cell
    }
    
    
    //콜렉션뷰 셀 선택 사항 추후 구현
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let showCountryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeDetailVC") as! HomeDetailVC
        self.navigationController?.pushViewController(showCountryVC, animated: true)
    }
    
    
}






