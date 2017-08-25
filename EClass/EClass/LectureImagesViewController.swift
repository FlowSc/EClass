//
//  LectureImagesViewController.swift
//  EClass
//
//  Created by Kang Seongchan on 2017. 8. 24..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit
import SwiftyJSON
import Photos
import DKImagePickerController

class LectureImagesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    @IBOutlet weak var photoPickerbuttonTouched: UIButton!
    @IBOutlet weak var myLecturePhotoCollectionView: UICollectionView!
    var imageList:[UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.myLecturePhotoCollectionView.reloadData()
        }
        
        photoPickerbuttonTouched.addTarget(self, action: #selector(pickerLoad), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LecturePhotoCell", for: indexPath) as! LecturePhotoCollectionViewCell
        
        
        
        cell.lectureImage.image = imageList[indexPath.item]
        cell.layer.borderWidth = 1
        
        
        return cell
    }
    
    func pickerLoad(){
        
        
      let picker = DKImagePickerController()
        
        picker.didSelectAssets = {[unowned self] (assets:[DKAsset]) in print("didselectAssets")
        print(assets)
            for asset in assets {
                
                asset.fetchOriginalImageWithCompleteBlock({ (image, info) in
                    guard let imageData = UIImagePNGRepresentation(image!) else {
                        return
                    }
                    let thumnail = UIImage(data: imageData)
                    self.imageList.append(thumnail!)
                    print(thumnail!)
                    print("~~~~~~~~~~")
                    print(self.imageList)
                    
                    DispatchQueue.main.async {
                        self.myLecturePhotoCollectionView.reloadData()
                    }
                    
                })
            }
        }
        self.present(picker, animated: true, completion: nil)

    }
    
    @IBOutlet weak var noticeTf: UITextField!
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func nextStepTouched(_ sender: Any) {
           classMakeParameter.updateValue(imageList, forKey: "lecture_photo")
        classMakeParameter.updateValue(noticeTf.text!, forKey: "notice")
        classMakeParameter.updateValue(noticeTf.text!, forKey: "region_comment")
    }
    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


