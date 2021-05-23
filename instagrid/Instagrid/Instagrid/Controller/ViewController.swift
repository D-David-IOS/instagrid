//
//  ViewController.swift
//  Instagrid
//
//  Created by Debehogne David on 22/05/2021.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var buttonSelect = -1
    
    // the 3 selects on down
    @IBOutlet weak var select1: UIImageView!
    @IBOutlet weak var select2: UIImageView!
    @IBOutlet weak var select3: UIImageView!
    
    //select 1, show view1
    @IBAction func button1Down(_ sender : Any) {
        select1.isHidden = false
        select2.isHidden = true
        select3.isHidden = true
        View1.isHidden = false
        View2.isHidden = true
        View3.isHidden = true
    }
    
    // select2 show view2
    @IBAction func button2Down(_ sender : Any) {
        select1.isHidden = true
        select2.isHidden = false
        select3.isHidden = true
        View1.isHidden = true
        View2.isHidden = false
        View3.isHidden = true
    }
    
    // select 3, show view3
    @IBAction func button3Down(_ sender : Any) {
        select1.isHidden = true
        select2.isHidden = true
        select3.isHidden = false
        View1.isHidden = true
        View2.isHidden = true
        View3.isHidden = false
    }
    
  
    // the 3 view
    @IBOutlet weak var View1: UIView!
    @IBOutlet weak var View2: UIView!
    @IBOutlet weak var View3: UIView!
    
 
    
    // *******vue 1***********
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var buttonImage1: UIButton!
  
    
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var buttonImage2: UIButton!
    
    
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var buttonImage3: UIButton!
    
    //**********vue 2***************
    
    @IBOutlet weak var view2Image1: UIImageView!
    @IBOutlet weak var view2Button1: UIButton!
    
    @IBOutlet weak var view2Image2: UIImageView!
    @IBOutlet weak var view2Button2: UIButton!
    
    @IBOutlet weak var view2Image3: UIImageView!
    @IBOutlet weak var view2Button3: UIButton!
    
    
    
    @IBAction func view2picture1(_ sender: Any) {
        buttonSelect = 4
        image()
    }
    
    @IBAction func view2picture2(_ sender: Any) {
        buttonSelect = 5
        image()
    }
    
    @IBAction func view2Picture3(_ sender: Any) {
        buttonSelect = 6
        image()
    }
    
    
    @IBAction func selectpicture1(_ sender: Any) {
        
        buttonSelect = 1
        image()
    }
    
    @IBAction func selectPicture(_ sender: Any) {
        buttonSelect = 2
        image()
    }

    @IBAction func selectPicture3(_ sender: Any) {
        buttonSelect = 3
        image()
    }
    
    
    
    
    
    
    
    func image(){
        let image = UIImagePickerController()
        image.sourceType = .photoLibrary
        image.delegate = self
        image.allowsEditing = true
        present(image, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            switch buttonSelect {
                case 1 :
                    image1.image = image
                    buttonImage1.backgroundColor = .none
                    buttonImage1.setImage(.none, for: .normal)
                case 2 :
                    image2.image = image
                    buttonImage2.backgroundColor = .none
                    buttonImage2.setImage(.none, for: .normal)
                case 3 :
                    image3.image = image
                    buttonImage3.backgroundColor = .none
                    buttonImage3.setImage(.none, for: .normal)
                case 4 :
                    view2Image1.image = image
                    view2Button1.backgroundColor = .none
                    view2Button1.setImage(.none, for: .normal)
                case 5 :
                    view2Image2.image = image
                    view2Button2.backgroundColor = .none
                    view2Button2.setImage(.none, for: .normal)
                case 6 :
                    view2Image3.image = image
                    view2Button3.backgroundColor = .none
                    view2Button3.setImage(.none, for: .normal)
            default :
                    break
            }
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    
}



    


