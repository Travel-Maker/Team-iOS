//
//  PlaceTVCell.swift
//  TravelMaker
//
//  Created by 조예은 on 2018. 7. 7..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import UIKit

class PlaceTVCell: UITableViewCell {

    @IBOutlet weak var infoTableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.infoTableView.delegate = self
        self.infoTableView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension PlaceTVCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTitleTVCell") as! InfoTitleTVCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoMemoTVCell") as! InfoMemoTVCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoPriceTVCell") as! InfoPriceTVCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoRouteTVCell") as! InfoRouteTVCell
            return cell
        }
            
    }
}
//extension PlaceTVCell{
//    func setTableViewDataSourceDelegate
//        <D:UITableViewDataSource & UITableViewDelegate>(_ dataSourceDelegate: D, forRow row: Int){
//
//        infoTableView.dataSource = dataSourceDelegate
//        infoTableView.delegate = dataSourceDelegate
//
//        infoTableView.reloadData()
//    }
//}
