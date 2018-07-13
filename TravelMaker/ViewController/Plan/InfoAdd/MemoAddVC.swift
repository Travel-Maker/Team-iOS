//
//  PhotoAddVC.swift
//  TravelMaker
//
//  Created by 이충신 on 2018. 7. 7..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import UIKit

class MemoAddVC: UIViewController {
    
    let picker = UIImagePickerController()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var memoView: UITextView!
    
    @IBAction func dismissBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self;
        
        //메모뷰 설정(테두리 크기)
        self.memoView.layer.borderWidth = 0.5
        self.memoView.layer.borderColor = UIColor.black.cgColor
    }
    
    
    @IBAction func addPhoto(_ sender: Any) {
        
        let alert =  UIAlertController(title: "PHOTO", message: "사진 선택", preferredStyle: .actionSheet)
        
        
        let library =  UIAlertAction(title: "앨범", style: .default) { (action) in self.openLibrary()
        }
        
        
        let camera =  UIAlertAction(title: "카메라", style: .default) { (action) in

            self.openCamera()
            
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}


extension MemoAddVC : UIImagePickerControllerDelegate,
    
UINavigationControllerDelegate{
    
    func openLibrary(){
        
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
        
    }
    
    func openCamera(){
        
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            picker.sourceType = .camera
            present(picker, animated: false, completion: nil)
        }
            
        else{
            print("Camera not available")
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            
            imageView.image = image
            print(info)
            
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
}


