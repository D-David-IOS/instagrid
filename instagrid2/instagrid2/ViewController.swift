//
//  ViewController.swift
//  instagrid2
//
//  Created by Debehogne David on 25/05/2021.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipedLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipedLeft))
        swipedLeft.direction = UISwipeGestureRecognizer.Direction.left
        
        self.view.addGestureRecognizer(swipedLeft)
        
    }


    @objc func share()
    {
        let renderer = UIGraphicsImageRenderer(size: self.view1.bounds.size)
        let image = renderer.image { ctx in
            self.view1.drawHierarchy(in: self.view1.bounds, afterScreenUpdates: true)
        }
        let ac = UIActivityViewController(activityItems: [image], applicationActivities: [])
       
        present(ac, animated: true)
    }

    @objc func swipedLeft()
    {
        print("gauche")
      
        self.view1.transform = CGAffineTransform(translationX: -50, y: 0)
        
        share()
        
        
    }
    
/*
    @objc func swipedByUser( _ gesture: UISwipeGestureRecognizer)  {
        print("ça marche")
        
        if !select1.isHidden {
         
        UIView.animate(withDuration: 1, animations: {
            self.view1.transform = CGAffineTransform(translationX: 0, y: -500)
        })
          
        let renderer = UIGraphicsImageRenderer(size: view1.bounds.size)
        let image = renderer.image { ctx in
            view1.drawHierarchy(in: view1.bounds, afterScreenUpdates: true)
        }
        
        let ac = UIActivityViewController(activityItems: [image], applicationActivities: [])
            present(ac, animated: true)

            self.view1.transform = .identity
            
        } else if !select2.isHidden {
            UIView.animate(withDuration: 1, animations: {
                self.view2.transform = CGAffineTransform(translationX: 0, y: -500)
            })
            
            let renderer = UIGraphicsImageRenderer(size: view2.bounds.size)
            let image = renderer.image { ctx in
                view2.drawHierarchy(in: view2.bounds, afterScreenUpdates: true)
            }
            
            let ac = UIActivityViewController(activityItems: [image], applicationActivities: [])
            present(ac, animated: true)
            
            
            
        } else if !select3.isHidden {
            UIView.animate(withDuration: 1, animations: {
                self.view3.transform = CGAffineTransform(translationX: 0, y: -500)
            })
            
            let renderer = UIGraphicsImageRenderer(size: view3.bounds.size)
            let image = renderer.image { ctx in
                view3.drawHierarchy(in: view3.bounds, afterScreenUpdates: true)
            }
            
            let ac = UIActivityViewController(activityItems: [image], applicationActivities: [])
            present(ac, animated: true)
            
        }
      
    }
    */
    
    @objc func vue1Identite(){
        view1.transform = .identity
    }
    
    
    var buttonSelect = -1
    
    
    // the 3 view
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    
    
    // 3 selects buttons
    @IBOutlet weak var select1: UIImageView!
    @IBOutlet weak var select2: UIImageView!
    @IBOutlet weak var select3: UIImageView!
    
    @IBAction func button1Down(_ sender: Any) {
        select1.isHidden = false
        select2.isHidden = true
        select3.isHidden = true
        view1.isHidden = false
        view2.isHidden = true
        view3.isHidden = true
        
        /*
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedByUser(_:)))
        swipeGesture.direction = .up
        view.addGestureRecognizer(swipeGesture)
        */
    }
    
    @IBAction func button2Down(_ sender: Any) {
        select1.isHidden = true
        select2.isHidden = false
        select3.isHidden = true
        view1.isHidden = true
        view2.isHidden = false
        view3.isHidden = true
        
        /*
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedByUser(_:)))
        swipeGesture.direction = .up
        view.addGestureRecognizer(swipeGesture)
        */
    }
    
    @IBAction func button3Down(_ sender: Any) {
        select1.isHidden = true
        select2.isHidden = true
        select3.isHidden = false
        view1.isHidden = true
        view2.isHidden = true
        view3.isHidden = false
        
            /*
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedByUser(_:)))
        swipeGesture.direction = .up
        view.addGestureRecognizer(swipeGesture)
        */
    }
    
    //*****************view1*********************
    @IBOutlet weak var view1Image1: UIImageView!
    @IBOutlet weak var view1Button1: UIButton!
    
    @IBOutlet weak var view1Image2: UIImageView!
    @IBOutlet weak var view1Button2: UIButton!
    
    @IBOutlet weak var view1Image3: UIImageView!
    @IBOutlet weak var view1Button3: UIButton!
    
    //*****************view2**********************
        
    @IBOutlet weak var view2Image1: UIImageView!
    @IBOutlet weak var view2Button1: UIButton!
    
    @IBOutlet weak var view2Image2: UIImageView!
    @IBOutlet weak var view2Button2: UIButton!
    
    @IBOutlet weak var view2Image3: UIImageView!
    @IBOutlet weak var view2Button3: UIButton!
    
    //******************view3***********************
    
    @IBOutlet weak var view3Image1: UIImageView!
    @IBOutlet weak var view3Button1: UIButton!
    
    @IBOutlet weak var view3Image2: UIImageView!
    @IBOutlet weak var view3Button2: UIButton!
    
    @IBOutlet weak var view3Image3: UIImageView!
    @IBOutlet weak var view3Button3: UIButton!
    
    @IBOutlet weak var view3Image4: UIImageView!
    @IBOutlet weak var view3Button4: UIButton!
    
    //******************view1***********************
    
    
    @IBAction func view1Picture1(_ sender: Any) {
        buttonSelect = 1
        image()
    }
    
    @IBAction func view1Picture2(_ sender: Any) {
        buttonSelect = 2
        image()
    }
    
    @IBAction func view1Picture3(_ sender: Any) {
        buttonSelect = 3
        image()
    }
    
    //******************view2************************
    
    
    @IBAction func view2Picture1(_ sender: Any) {
        buttonSelect = 4
        image()
    }
    
    @IBAction func view2Picture2(_ sender: Any) {
        buttonSelect = 5
        image()
    }
    
    @IBAction func view2Picture3(_ sender: Any) {
        buttonSelect = 6
        image()
    }
    
    //**********************view3************************
    
    @IBAction func view3Picture1(_ sender: Any) {
        buttonSelect = 7
        image()
    }
    
    @IBAction func view3Picture2(_ sender: Any) {
        buttonSelect = 8
        image()
    }
    
    @IBAction func view3Picture3(_ sender: Any) {
        buttonSelect = 9
        image()
    }
    
    @IBAction func view3Picture4(_ sender: Any) {
        buttonSelect = 10
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
                        view1Image1.image = image
                        view1Button1.backgroundColor = .none
                        view1Button1.setImage(.none, for: .normal)
                    case 2 :
                        view1Image2.image = image
                        view1Button2.backgroundColor = .none
                        view1Button2.setImage(.none, for: .normal)
                    case 3 :
                        view1Image3.image = image
                        view1Button3.backgroundColor = .none
                        view1Button3.setImage(.none, for: .normal)
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
                    case 7 :
                        view3Image1.image = image
                        view3Button1.backgroundColor = .none
                        view3Button1.setImage(.none, for: .normal)
                    case 8 :
                        view3Image2.image = image
                        view3Button2.backgroundColor = .none
                        view3Button2.setImage(.none, for: .normal)
                    case 9 :
                        view3Image3.image = image
                        view3Button3.backgroundColor = .none
                        view3Button3.setImage(.none, for: .normal)
                    case 10 :
                        view3Image4.image = image
                        view3Button4.backgroundColor = .none
                        view3Button4.setImage(.none, for: .normal)
                default :
                        break
                }
            }
            
            dismiss(animated: true, completion: nil)
        }
    
    
}
