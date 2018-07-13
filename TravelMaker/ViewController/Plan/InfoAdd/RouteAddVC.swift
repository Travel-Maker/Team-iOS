//
//  RouteAddVC.swift
//  TravelMaker
//
//  Created by 이충신 on 2018. 7. 7..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import UIKit
    
class RouteAddVC: UIViewController, UITextViewDelegate {
        
        //출발시간, 도착시간
        @IBOutlet weak var departTime: UITextField!
        @IBOutlet weak var arriveTime: UITextField!
        var datePicker1: UIDatePicker!
        var datePicker2: UIDatePicker!
        
        //운송수단 버튼
        @IBOutlet weak var carBtn: UIButton!
        @IBOutlet weak var walkBtn: UIButton!
        @IBOutlet weak var subwayBtn: UIButton!
        @IBOutlet weak var planeBtn: UIButton!
        @IBOutlet weak var bikeBtn: UIButton!
        @IBOutlet weak var busBtn: UIButton!
        
        //운송수단 메모
        @IBOutlet weak var memoView: UITextView!
        
        //비용추가 관련
        @IBOutlet weak var moneyUnit: UITextField!
        let moneyPicker = UIPickerView()
        var moneyArray: [String] = ["KRW(한국)", "USD(미국)", "CNY(중국)"]
        
        
        
        @IBAction func dismissBtn(_ sender: Any) {
            dismiss(animated: true, completion: nil)
        }
    
        @IBAction func saveBtn(_ sender: Any) {
            
        }
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            memoView.delegate = self;
            
            //메모뷰 플레이스홀더 설정
            setMemoPlaceholder()
            //시간피커뷰 설정
            initTimePicker()
            //화폐단위피커뷰 설정
            initMoneyPicker()
        }
        
        
    }
    
    //datePicker 설정
    extension RouteAddVC {
        
        func initTimePicker(){
            
            datePicker1 = UIDatePicker()
            datePicker1.datePickerMode = .time
            datePicker1.addTarget(self, action: #selector(self.dateChanged(datePicker1:)), for: .valueChanged)
            
            datePicker2 = UIDatePicker()
            datePicker2.datePickerMode = .time
            datePicker2.addTarget(self, action: #selector(self.dateChanged2(datePicker2:)), for: .valueChanged)
            
            
            let bar = UIToolbar()
            bar.sizeToFit()
            
            let doneButton = UIBarButtonItem(title: "확인", style: .done, target: self, action: #selector(self.dateChanged(datePicker1:)))
            bar.setItems([doneButton], animated: true)
            
            departTime.inputAccessoryView = bar
            arriveTime.inputAccessoryView = bar
            
            
            
            departTime.inputView = datePicker1
            arriveTime.inputView = datePicker2
            
        }
        
   
        
        @objc func dateChanged(datePicker1: UIDatePicker){
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "a hh:mm"
            departTime.text = dateFormatter.string(from: datePicker1.date)
            view.endEditing(true)
        }
        @objc func dateChanged2(datePicker2: UIDatePicker){
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "a hh:mm"
            arriveTime.text = dateFormatter.string(from: datePicker2.date)
            view.endEditing(true)
        }
        
    }
    
    // moneyPicker 구성
    extension RouteAddVC: UIPickerViewDelegate, UIPickerViewDataSource {
        
        func initMoneyPicker()
        {
            moneyPicker.delegate = self;
            moneyPicker.dataSource = self;
            
            //바 버튼 아이템 설정
            let bar = UIToolbar()
            bar.sizeToFit()
            let doneButton = UIBarButtonItem(title: "확인", style: .done, target: self, action: #selector(selectedPicker))
            bar.setItems([doneButton], animated: true)
            
            moneyUnit.inputAccessoryView = bar
            moneyUnit.inputView = moneyPicker
            
        }
        
        @objc func selectedPicker() {
            let row = moneyPicker.selectedRow(inComponent: 0)
            
            moneyUnit.text = moneyArray[row]  // 선택된 항목 textField에 넣기.
            
            view.endEditing(true)
        }
        
        // Component : 피커의 열.
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        // Row in component : Component 안의 행.
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return moneyArray.count
        }
        
        
        // titleForRow : 외부매개변수명, row : 내부매개변수명.     // title : 피커에 넣고 싶은 내용.
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return moneyArray[row]
        }
        
        
    }
    
    
//TextView(MemoView)에 Placeholder 기능을 추가
extension RouteAddVC {
        
        func setMemoPlaceholder(){
            
            if(memoView.text == ""){
                textViewDidEndEditing(memoView)
            }
            var tapDismiss = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
            
            //메모뷰 설정(테두리 크기)
            self.memoView.layer.borderWidth = 0.3
            self.memoView.layer.borderColor = Colors.bordercolor.cgColor
        }
        
        func dismissKeyboard(){
            memoView.resignFirstResponder()
        }
        
        func textViewDidEndEditing(_ textView: UITextView){
            if(textView.text == ""){
                textView.text = "상세한 이동경로를 적어주세요."
                textView.textColor = Colors.bordercolor
            }
            textView.resignFirstResponder()
        }
        
        func textViewDidBeginEditing(_ textView: UITextView){
            if(textView.text == "상세한 이동경로를 적어주세요."){
                textView.text = ""
                textView.textColor = UIColor.black
            }
            textView.becomeFirstResponder()
        }
        
}
