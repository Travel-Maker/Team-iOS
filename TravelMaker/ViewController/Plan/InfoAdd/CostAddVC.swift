//
//  CostAddVC.swift
//  TravelMaker
//
//  Created by 이충신 on 2018. 7. 7..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import UIKit

class CostAddVC: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var pickerTextField: UITextField!
    
    let moneyUnit = ["KRW(한국)", "USD(미국)", "CNY(중국)", "JPY(일본)", "GBP(영국)", "CAD(캐나다)", "MXN(멕시코)", "EUR(유럽연합)"]
    
    let pickerview = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initPicker()
    }
    
    
    // picker 구성.
    func initPicker() {
        
        pickerview.delegate = self;
        pickerview.dataSource = self;
        
        let bar = UIToolbar()
        bar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "확인", style: .done, target: self, action: #selector(selectedPicker))
        
        bar.setItems([doneButton], animated: true)
        
        pickerTextField.inputAccessoryView = bar
        pickerTextField.inputView = pickerview
        
    }
    
    // picker에서 완료 버튼을 눌렀을 때 실행되는 function.
    // #selector(function)에 들어갈 function은 @objc 어노테이션이 필요합니다.
    
    @objc func selectedPicker() {
        
        let row = pickerview.selectedRow(inComponent: 0)
        
        // 선택된 항목 textField에 넣기.
        pickerTextField.text = moneyUnit[row]
        
        view.endEditing(true)
        
    }
    
    // Component : 피커의 열.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    
    // Row in component : Component 안의 행.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return moneyUnit.count
    }
    
    // title : 피커에 넣고 싶은 내용.
    // titleForRow : 외부매개변수명, row : 내부매개변수명.
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return moneyUnit[row]
    }
    
    
}



