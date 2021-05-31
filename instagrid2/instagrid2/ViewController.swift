//
//  ViewController.swift
//  instagrid2
//
//  Created by Debehogne David on 25/05/2021.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
 
    // add 2 uiSwipeGestureRecogniser : left and up when the app start
    override func viewDidLoad() {
        super.viewDidLoad()

        // if the user swipe left, call the function swipedleft
        let swipedLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipedUp))
        swipedLeft.direction = UISwipeGestureRecognizer.Direction.left
        
        self.view.addGestureRecognizer(swipedLeft)
        
        // if the user swipe up, call the function swipeUp
        let swipedUp = UISwipeGestureRecognizer(target: self, action: #selector(self.swipedLeft))
        swipedUp.direction = UISwipeGestureRecognizer.Direction.up
        
        self.view.addGestureRecognizer(swipedUp)
        
    }

    // this function share the current view ( view1, view2 or view3)
    // the user can save the image or share on another app
    // if the current orientation is portrait, the current view swipe UP
    // if the current orientation is landscape, the current view swipe Left
    // when the share is complete or failed, the view return to .identity
    @objc func share(selectedView : UIView)
    {
        if UIDevice.current.orientation.isPortrait {
            let screenWidth = view.bounds.height
            UIView.animate(withDuration: 0.5, animations: {
                selectedView.transform = CGAffineTransform(translationX: 0, y: -screenWidth)
            })
        }
        
        if UIDevice.current.orientation.isLandscape{
            let screenWidth = view.bounds.width
            UIView.animate(withDuration: 0.5, animations: {
                selectedView.transform = CGAffineTransform(translationX: -screenWidth, y: 0)
            })
        }
            
            let renderer = UIGraphicsImageRenderer(size: selectedView.bounds.size)
            let image = renderer.image { ctx in
                selectedView.drawHierarchy(in: selectedView.bounds, afterScreenUpdates: true)
            }
            let ac = UIActivityViewController(activityItems: [image], applicationActivities: [])
            ac.completionWithItemsHandler = { (activityType, completed:Bool, returnedItems:[Any]?, error: Error?) in
                if completed {
                    selectedView.transform = .identity
                } else {
                    UIView.animate(withDuration: 0.5, animations: {
                    selectedView.transform = .identity
                    })
                }
             }
            
            present(ac, animated: true)
            
    }

    // this function share the current view ( if a view is selected)
    // swipe left doesn't work here because the orientation is Portrait
    @objc func swipedUp()
    {
        if !UIDevice.current.orientation.isPortrait {

            if !select1.isHidden {
                    share(selectedView : view1)
                } else if !select2.isHidden {
                    share(selectedView : view2)
                } else if !select3.isHidden {
                    share(selectedView : view3)
                }
        }
    }

    // this function share the current view ( if a view is selected)
    // swipe up doesn't work here because the orientation is Landscape
    @objc func swipedLeft()
    {
        if !UIDevice.current.orientation.isLandscape {
        if !select1.isHidden {
            share(selectedView : view1)
        } else if !select2.isHidden {
            share(selectedView : view2)
        } else if !select3.isHidden {
            share(selectedView : view3)
        }
        }
    }
    
    // buttonselect can memorise the current button selected
    // each button is associated with an image
    // it's used in the function image() for know the image will be changed
    var buttonSelect = -1
    
    // the 3 view (contains the 3 or 4 images)
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    
    // the 3 images select (behind the 3 image at the bottom)
    @IBOutlet weak var select1: UIImageView!
    @IBOutlet weak var select2: UIImageView!
    @IBOutlet weak var select3: UIImageView!
    
    // when a view is selected, the 2 other view are hidden
    // the 2 other select too
    @IBAction func button1Down(_ sender: Any) {
        select1.isHidden = false
        select2.isHidden = true
        select3.isHidden = true
        view1.isHidden = false
        view2.isHidden = true
        view3.isHidden = true
    }
    
    // when a view is selected, the 2 other view are hidden
    // the 2 other select too
    @IBAction func button2Down(_ sender: Any) {
        select1.isHidden = true
        select2.isHidden = false
        select3.isHidden = true
        view1.isHidden = true
        view2.isHidden = false
        view3.isHidden = true
    }
    
    // when a view is selected, the 2 other view are hidden
    // the 2 other select too
    @IBAction func button3Down(_ sender: Any) {
        select1.isHidden = true
        select2.isHidden = true
        select3.isHidden = false
        view1.isHidden = true
        view2.isHidden = true
        view3.isHidden = false
    }
    
    // the 3 buttons of the first view
    // each button associated with an image
    //*****************view1*********************
    @IBOutlet weak var view1Image1: UIImageView!
    @IBOutlet weak var view1Button1: UIButton!
    
    @IBOutlet weak var view1Image2: UIImageView!
    @IBOutlet weak var view1Button2: UIButton!
    
    @IBOutlet weak var view1Image3: UIImageView!
    @IBOutlet weak var view1Button3: UIButton!
    
    // the 3 buttons of the second view
    // each button associated with an image
    //*****************view2**********************
    @IBOutlet weak var view2Image1: UIImageView!
    @IBOutlet weak var view2Button1: UIButton!
    
    @IBOutlet weak var view2Image2: UIImageView!
    @IBOutlet weak var view2Button2: UIButton!
    
    @IBOutlet weak var view2Image3: UIImageView!
    @IBOutlet weak var view2Button3: UIButton!
    
    // the 4 buttons of the first view
    // each button associated with an image
    //******************view3***********************
    @IBOutlet weak var view3Image1: UIImageView!
    @IBOutlet weak var view3Button1: UIButton!
    
    @IBOutlet weak var view3Image2: UIImageView!
    @IBOutlet weak var view3Button2: UIButton!
    
    @IBOutlet weak var view3Image3: UIImageView!
    @IBOutlet weak var view3Button3: UIButton!
    
    @IBOutlet weak var view3Image4: UIImageView!
    @IBOutlet weak var view3Button4: UIButton!
    
    // when the user presses a button, he can change the current image
    // if the image is already select, he can change again the image
    // the button is not hidden, the background is .none and the image is deleted
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
    
    // when the user presses a button, he can change the current image
    // if the image is already select, he can change again the image
    // the button is not hidden, the background is .none and the image is deleted
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
    
    // when the user presses a button, he can change the current image
    // if the image is already select, he can change again the image
    // the button is not hidden, the background is .none and the image is deleted
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
    

    // this function can select an image from the gallery
    func image(){
            let image = UIImagePickerController()
            image.sourceType = .photoLibrary
            image.delegate = self
            image.allowsEditing = true
            present(image, animated: true)
        }
        
    // here when the user change the picture :
    // the backgroundColor become .none, and the picture "+" is deleted
    // so the button is always present if the user want to change again
    // if the user doesn't select an image, nothing happens
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
