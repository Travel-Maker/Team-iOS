//
//  ExpertApplyVC.swift
//  TravelMaker
//
//  Created by 조예은 on 2018. 7. 6..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import UIKit

class ExpertApplyVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var expertApplyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.expertApplyTableView.dataSource = self;
        self.expertApplyTableView.delegate = self;
        
//        initPicker()
    }
    
    @IBAction func dismissBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = expertApplyTableView.dequeueReusableCell(withIdentifier: "ExpertApplyTVCell1") as! ExpertApplyTVCell1
            
            return cell
        }else if indexPath.section == 1{
            let cell = expertApplyTableView.dequeueReusableCell(withIdentifier: "ExpertApplyTVCell2") as! ExpertApplyTVCell2
            
            return cell
        }else {
            let cell = expertApplyTableView.dequeueReusableCell(withIdentifier: "ExpertApplyTVCell3") as! ExpertApplyTVCell3
            
            return cell
        }
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0 || section == 2){
            return 1
        }else {
            //여행경로 숫자로 구현
            return 1
        }
    }
    
//    //***** 1) 도시 선택 피커뷰를 생성(완성) *****
//    var cityArray = ["베이징","상하이","시안"]
//    let pickerview = UIPickerView()
//
//    @IBOutlet weak var cityTextField: UITextField!
//
//    func initPicker(){
//
//        pickerview.delegate = self;
//        pickerview.dataSource = self;
//
//        let bar = UIToolbar()
//        bar.sizeToFit()
//
//        let doneButton = UIBarButtonItem(title: "확인", style: .done, target: self, action: #selector(selectedPicker))
//
//        bar.setItems([doneButton], animated: true)
//
//        cityTextField.inputAccessoryView = bar
//        cityTextField.inputView = pickerview
//
//
//    }
//
//    // picker에서 완료 버튼을 눌렀을 때 실행되는 function.
//    // #selector(function)에 들어갈 function은 @objc 어노테이션이 필요합니다.
//
//    @objc func selectedPicker() {
//
//        let row = pickerview.selectedRow(inComponent: 0)
//        cityTextField.text = cityArray[row]
//        view.endEditing(true)
//
//    }
//
//    // Component : 피커의 열.
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//
//    // Row in component : Component 안의 행.
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return cityArray.count
//    }
//
//    // title : 피커에 넣고 싶은 내용.
//    // titleForRow : 외부매개변수명, row : 내부매개변수명.
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return cityArray[row]
//    }
//
//
//
//
//    /////////////////////////////
//    //***** 2)날짜선택을 위한 날짜피커 *****
//    //텍스트필드 위 2개 아래 2개 오토레이아웃 필요!!!
//
//    //출발, 귀국
//    @IBOutlet weak var startDate: UITextField!
//    @IBOutlet weak var endDate: UITextField!
//    //In, Out
//
//    var datePicker = UIDatePicker()
//
//    func initDatePicker(){
//        self.startDate.tag = 0
//        self.endDate.tag = 1
//        self.startDate.delegate = self;
//        self.endDate.delegate = self;
//
//    }
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        setupDatePicker(textField)
//    }
//
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        setupDatePicker(textField)
//    }
//
//
//    func setupDatePicker(_ text: UITextField) {
//        datePicker.datePickerMode = .date
//        // Creates the toolbar
//        let toolBar = UIToolbar()
//        toolBar.sizeToFit()
//
//        // Adds the buttons
//        let doneButton = UIBarButtonItem(title: "저장", style: .done, target: self, action: #selector(doneClick))
//        toolBar.setItems([doneButton], animated: true)
//        toolBar.isUserInteractionEnabled = true
//
//        // Adds the toolbar to the view
//        if text == startDate{
//            self.startDate.inputView = datePicker
//            self.endDate.inputAccessoryView = toolBar
//        }
//        else
//        {
//            self.endDate.inputView = datePicker
//            self.endDate.inputAccessoryView = toolBar
//        }
//
//    }
//
//    @objc func doneClick() {
//        let dateFormatter1 = DateFormatter()
//
//
//        dateFormatter1.dateFormat = "yyyy-mm-dd"
//
//
//        if startDate.isFirstResponder{
//            startDate.text = dateFormatter1.string(from: datePicker.date)
//            startDate.resignFirstResponder()
//        }else{
//            endDate.text = dateFormatter1.string(from: datePicker.date)
//            endDate.resignFirstResponder()
//        }
//    }
//
    
    /////////////////////////////
    
    
    @IBAction func confirmBtnPressed(_ sender: Any) {
        self.simpleAlertwithHandler(title: "신청서 전송", message: "신청서를 보내시겠습니까?", okHandler: self.sendOkHandler(_:))
    }
    
    func sendOkHandler(_ sender:UIAlertAction) -> Void {
        self.dismiss(animated: true, completion: nil)
    }
    
   
    
        
}

