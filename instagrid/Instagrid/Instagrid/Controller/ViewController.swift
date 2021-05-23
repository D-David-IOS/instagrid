//
//  ViewController.swift
//  Instagrid
//
//  Created by Debehogne David on 22/05/2021.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var buttonSelect = -1
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var buttonImage1: UIButton!
  
    
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var buttonImage2: UIButton!
    
    
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var buttonImage3: UIButton!
    
    
    @IBOutlet weak var select1: UIImageView!
    @IBOutlet weak var select2: UIImageView!
    @IBOutlet weak var select3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func button1Down(_ sender : Any) {
        select1.isHidden = false
        select2.isHidden = true
        select3.isHidden = true
    }
    
    
    @IBAction func button2Down(_ sender : Any) {
        select1.isHidden = true
        select2.isHidden = false
        select3.isHidden = true
    }
    
    
    @IBAction func button3Down(_ sender : Any) {
        select1.isHidden = true
        select2.isHidden = true
        select3.isHidden = false
    }
    
    
    @IBAction func selectpicture1(_ sender: Any) {
        buttonSelect = 1
        let image = UIImagePickerController()
        image.sourceType = .photoLibrary
        image.delegate = self
        image.allowsEditing = true
        present(image, animated: true)
    }
    

    
    @IBAction func selectPicture(_ sender: UIImagePickerController) {
        buttonSelect = 2
        let image = UIImagePickerController()
        image.sourceType = .photoLibrary
        image.delegate = self
        image.allowsEditing = true
        present(image, animated: true)
    }
    
    
    
    @IBAction func selectPicture3(_ sender: Any) {
        buttonSelect = 3
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
                default :
                    break
            }
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    
}



    


