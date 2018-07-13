//
//  ToggleButton.swift
//  TravelMaker
//
//  Created by 이충신 on 2018. 7. 2..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//


import Foundation
import UIKit

class ToggleButton: UIButton {
    
    var isOn = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    
    func initButton() {
        
        //테두리 굵기 및 색상, 원형 설정
        layer.borderWidth = 0.7
        layer.borderColor = Colors.bordercolor.cgColor
        layer.cornerRadius = frame.size.height/2
        
        //타이틀 색상
        setTitleColor(Colors.initTitle, for: .normal)
        backgroundColor = Colors.initbg
        addTarget(self, action: #selector(ToggleButton.buttonPressed), for: .touchUpInside)
        
    }
    
    @objc func buttonPressed() {
        activateButton(bool: !isOn)
    }
    
    func activateButton(bool: Bool) {
        
        isOn = bool
        
        //버튼의 배경색
        let bgcolor = bool ?  Colors.changebg : Colors.initbg
        backgroundColor = bgcolor
        
        //버튼의 텍스트 색
        let titleColor = bool ?  .white : Colors.initTitle
        setTitleColor(titleColor, for: .normal)
        
    }
    
    
}








