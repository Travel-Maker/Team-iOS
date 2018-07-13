//
//  WriteApplyViewController.swift
//  TravelMaker
//
//  Created by 조예은 on 2018. 7. 5..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import UIKit

class WriteApplyVC: UIViewController, UITableViewDataSource, UITableViewDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate, APIService {
    
    var boardTitle : String = ""
    var boardCity : String = ""
    var boardArrTime : String = ""
    var boardDepTime : String = ""
    var boardDays : Int = 0
    var boardContent : String?
    var boardCoin : Int?
    var countryIdx : Int = 8
    var expertIdx : Int?
    
    var planIn : String = ""
    var planInDate : String = ""
    var accName : String = ""
    var planOut : String = ""
    var planOutDate : String = ""
    
    var innData : [[String : Any]] = []
    var accData : [[String : Any]] = []
    var outData : [[String : Any]] = []
    
    var inn : [String : Any] = [:]
    var acc : [String : Any] = [:]
    var out : [String : Any] = [:]
    
    
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var applyTitle: UITextField!
    
    
    @IBOutlet weak var inOutTableView: UITableView!
    
    var menuCount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inOutTableView.delegate = self;
        inOutTableView.dataSource = self;
        
        initPicker()
        initDatePicker()
        
    }
    
    @IBAction func dismissButton(_ sender: Any) {
        self.simpleAlertwithHandler(title: "작성 취소", message: "내용은 저장되지 않습니다. \n취소하시겠습니까?", okHandler: self.dismissOkHandler(_:))
    }
    
    func dismissOkHandler(_ sender:UIAlertAction) -> Void {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerBtn(_ sender: Any) {
       
        self.simpleAlertwithHandler(title: "등록하기", message: "신청서를 게시하시겠습니까?", okHandler: self.registerOkHandler(_:))
        self.tabBarController?.selectedIndex = 3
    }
    

    func registerOkHandler(_ sender:UIAlertAction) -> Void {
        
        self.dismiss(animated: true, completion: nil)
        
        for i in 0...menuCount-1 {
            
            let indexPath = IndexPath(row: i , section: 0)
            
            print("for문 확인 = \(i)번째 루프 작동!")
            
            // if let cell1 = self.inOutTableView.cellForRow(at: indexPath) as? WriteApplyTVCell1 {
            
             let cell1 = inOutTableView.dequeueReusableCell(withIdentifier: "WriteApplyTVCell1", for: indexPath) as! WriteApplyTVCell1
            
                planIn = cell1.inCityTextField.text!
                planInDate = cell1.inDateTextField.text!
                
                accName = cell1.houseTextField.text!
                
                planOut = cell1.outCityTextField.text!
                planOutDate = cell1.outDateTextField.text!
            
            print("planIn==")
            print("a ="+planIn, "c =\(indexPath)")
            
                inn = [
                    "plan_in_date": planInDate,
                    "plan_in" : planIn
                ]
                acc = [
                    "name" : accName
                ]
                out = [
                    "plan_out_date" : planOutDate,
                    "plan_out" : planOut
                ]
                
                innData.append(inn)
                accData.append(acc)
                outData.append(out)
        
            
                print("")
                print("<innData> \(innData)")
                print("")
                print("<accData> \(accData)")
                print("")
                print("<outData> \(outData)")
            
        }
        
        
        
        if let cell2 = self.inOutTableView.cellForRow(at: IndexPath(row: 0, section: 1)) as? WriteApplyTVCell2 {
            boardContent = cell2.specialTextView.text
        }
        
        let boardPlan : [[String : Any]] = [[
            "inn" : innData,
            "acc" : accData,
            "out" : outData
            ]]
        
        let params : [String : Any] = [
            "board_title" : applyTitle.text!,
            "board_city" : cityTextField.text!,
            "board_arr_time" : startDate.text!,
            "board_dep_time" : endDate.text!,
            "board_days" : boardDays,
            "board_content" : boardContent as Any,
            "board_coin" : boardCoin as Any,
            "country_idx" : countryIdx,
            "board_plan" : boardPlan,
            "expert_idx" : expertIdx as Any
        ]
        
        
        WriteApplyService.shareInstance.writeApply(url: url("/board"), params: params){ [weak self] (result) in
            guard let `self` = self else { return }
            switch result {
            case .networkSuccess(_):
                self.simpleAlertwithHandler(title: "성공", message: "등록성공", okHandler: { (_) in
                    
                    self.navigationController?.popViewController(animated: false)
                    
                })
            case .nullValue :
                self.simpleAlert(title: "오류", message: "텍스트 비어있음")
            case .networkFail :
                self.simpleAlert(title: "오류", message: "인터넷 연결상태를 확인해주세요")
            default :
                break
            }
        }
        
        
    }
    
    
    
    @objc func addTextField(){
        
        menuCount += 1
        
        self.inOutTableView.beginUpdates()
        self.inOutTableView.insertRows(at: [IndexPath(row: menuCount-1, section: 0)], with : .bottom )
        self.inOutTableView.endUpdates()
        
        
        
    }

    
    //***** 1) 도시 선택 피커뷰를 생성(완성) *****
    var cityArray = ["베이징","상하이","시안"]
    let pickerview = UIPickerView()
    
    @IBOutlet weak var cityTextField: UITextField!
    
    func initPicker(){

        pickerview.delegate = self;
        pickerview.dataSource = self;

        let bar = UIToolbar()
        bar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "확인", style: .done, target: self, action: #selector(selectedPicker))
        bar.setItems([doneButton], animated: true)

        cityTextField.inputAccessoryView = bar
        cityTextField.inputView = pickerview
        
    }

    // picker에서 완료 버튼을 눌렀을 때 실행되는 function.
    // #selector(function)에 들어갈 function은 @objc 어노테이션이 필요합니다.

    @objc func selectedPicker() {

        let row = pickerview.selectedRow(inComponent: 0)
        cityTextField.text = cityArray[row]
        view.endEditing(true)

    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cityArray.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cityArray[row]
    }

    


    //***** 2)날짜선택을 위한 날짜피커 *****
    //출발, 귀국
    @IBOutlet weak var startDate: UITextField!
    @IBOutlet weak var endDate: UITextField!

    var datePicker = UIDatePicker()
    
    func initDatePicker(){
        
        self.startDate.tag = 0
        self.endDate.tag = 1

        self.startDate.delegate = self;
        self.endDate.delegate = self;
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        setupDatePicker(textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        setupDatePicker(textField)
    }
    

    func setupDatePicker(_ text: UITextField) {

        datePicker.datePickerMode = .date

        // Creates the toolbar
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        // Adds the buttons
        let doneButton = UIBarButtonItem(title: "저장", style: .done, target: self, action: #selector(doneClick))
        toolBar.setItems([doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        
        if text == startDate {
            self.startDate.inputView = datePicker
            self.startDate.inputAccessoryView = toolBar
        }
        else
        {
            self.endDate.inputView = datePicker
            self.endDate.inputAccessoryView = toolBar
        }
        
        }
    
    @objc func doneClick() {
        
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "yyyy-mm-dd"
        
        if startDate.isFirstResponder{
                startDate.text = dateFormatter1.string(from: datePicker.date)
                startDate.resignFirstResponder()
        }else{
                endDate.text = dateFormatter1.string(from: datePicker.date)
                endDate.resignFirstResponder()
            }
        }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return menuCount
        }
        else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = inOutTableView.dequeueReusableCell(withIdentifier: "WriteApplyTVCell1") as! WriteApplyTVCell1
            
            cell.inDateTextField.tag = indexPath.row * 10 + 1
            cell.outDateTextField.tag = indexPath.row * 10 + 2
            
            createPickerView(sender: (cell.inDateTextField))
            createPickerView(sender: (cell.outDateTextField))
            
            return cell
            
        }else {
        
            let cell = inOutTableView.dequeueReusableCell(withIdentifier: "WriteApplyTVCell2") as! WriteApplyTVCell2
            
            cell.addTextField.addTarget(self, action: #selector(addTextField), for: UIControlEvents.touchUpInside)
            
            return cell
        }
        
    }

    
//***** 3)날짜와 시간 선택을 위한 날짜피커 *****
    func createPickerView(sender: UITextField){
        
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.dateAndTime
        sender.inputView = datePickerView
        createToolbar(sender: sender)
        datePickerView.tag = sender.tag
        
        datePickerView.addTarget(self, action: #selector(datePickerValueChanged(caller:)), for: UIControlEvents.valueChanged)
    }
    
    @objc func datePickerValueChanged(caller: UIDatePicker){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd hh:mm"
        
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.none
        
        let indexRow = caller.tag / 10
        let indexPath = IndexPath(row: indexRow, section: 0)
        
        let cell = inOutTableView.cellForRow(at: indexPath) as! WriteApplyTVCell1

        if caller.tag % 10 == 1
        { cell.inDateTextField.text = dateFormatter.string(from: caller.date)}
        else if caller.tag % 10 == 2
        { cell.outDateTextField.text = dateFormatter.string(from: caller.date)}
        
        
    }
    
    
    func createToolbar(sender: UITextField){
        
        let bar = UIToolbar()
        bar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(dismissKeyboard))
        
        doneButton.tag = sender.tag
        bar.setItems([doneButton], animated: false)
        bar.isUserInteractionEnabled = true
        sender.inputAccessoryView = bar
        
    }
    
    
    @objc func dismissKeyboard(on: UIButton){
        view.endEditing(true)
    }
    
    


}

