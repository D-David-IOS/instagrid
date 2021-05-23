//
//  ViewController.swift
//  Instagrid
//
//  Created by Debehogne David on 22/05/2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var leftView: UIImageView!
    @IBOutlet weak var middleView: UIImageView!
    @IBOutlet weak var rightView: UIImageView!
    
    @IBOutlet weak var selectLeft: UIImageView!
    @IBOutlet weak var selectView: UIImageView!
    @IBOutlet weak var selectRight: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func selected1(_ sender: Any) {
        selectLeft.isHidden = false
        selectView.isHidden = true
        selectRight.isHidden = true
    }
    
    @IBAction func selected2(_ sender: Any) {
        selectLeft.isHidden = true
        selectView.isHidden = false
        selectRight.isHidden = true
        
    }
    
    
    @IBAction func selected3(_ sender: Any) {
        selectLeft.isHidden = true
        selectView.isHidden = true
        selectRight.isHidden = false
        
    }
}

