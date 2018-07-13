//
//  ExtensionControll.swift
//  TravelMaker
//
//  Created by 이충신 on 2018. 7. 3..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func gsno(_ value : String?) -> String{
        return value ?? ""
    }
    
    func gino(_ value : Int?) -> Int {
        return value ?? 0
    }
    
    
    
    func simpleAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인",style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func simpleAlertwithHandler(title: String, message: String, okHandler : ((UIAlertAction) -> Void)?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인",style: .default, handler: okHandler)
        let cancelAction = UIAlertAction(title: "취소",style: .cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    func addRightBarButton(image : UIImage, selector : Selector){
        let btn1 = UIButton(type: .custom)
        btn1.setImage(image, for: .normal)
        btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn1.addTarget(self, action: selector, for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: btn1)
        //navigation bar 에서 버튼 크기 조정하기 위함
        let currWidth = item1.customView?.widthAnchor.constraint(equalToConstant: 24)
        currWidth?.isActive = true
        let currHeight = item1.customView?.heightAnchor.constraint(equalToConstant: 24)
        currHeight?.isActive = true
        
        self.navigationItem.setRightBarButtonItems([item1], animated: true)
    }
    
    func networkFailed(){
        
        simpleAlert(title: "실패", message: "인터넷 연결상태를 확인해주세요");
    }
    
    
}


//네비게이션 컨트롤러바에 이미지를 삽입하는 함수
extension UIViewController {
    func makeNavImg(){
        let imgTitle = #imageLiteral(resourceName: "travelmaker_navi")
        navigationItem.titleView = UIImageView(image: imgTitle)
    }
}


extension NSObject {
    static var reuseIdentifier: String { //스토리보드 idetifier
        return String(describing: self)
    }
}


//hex code로 Color 생성하기
extension UIColor {
    
    public convenience init?(_ hexString: String) {
        let r, g, b, a: CGFloat
        
        if hexString.hasPrefix("#") {
            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            let hexColor = String(hexString[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }
}



extension FavoriteVC{
    
    func setCollectionViewDataSourceDelegate <D: UICollectionViewDelegate & UICollectionViewDataSource> (_ dataSourceDelegate: D, forRow row:Int){
        favoriteCollectionView.delegate = dataSourceDelegate
        favoriteCollectionView.dataSource = dataSourceDelegate
        
        favoriteCollectionView.reloadData()
    }
}
