//
//  MyViewController.swift
//  DelegateTest
//
//  Created by Emiko Clark on 3/5/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import UIKit

class MyViewControllerA: UIViewController {
    @IBOutlet weak var colorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        colorLabel.text = "white"
    }
    
    @IBAction func setColorButton(_ sender: UIButton) {
        // instantiate view controller from storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vcb = storyboard.instantiateViewController(withIdentifier: "MyViewControllerB") as! MyViewControllerB
        vcb.uicolor = view.backgroundColor
        vcb.delegate = self
        self.present(vcb, animated: true, completion: nil)
    }
}

extension MyViewControllerA: SetColorDelegate {
    func setColor(bgcolor: UIColor, label: String) {
        view.backgroundColor = bgcolor
        colorLabel.text = label
    }
}

class MyViewControllerB: UIViewController {
    var colorString: String?
    var uicolor: UIColor?
    weak var delegate: SetColorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = uicolor
    }
    
    @IBAction func brownButton(_ sender: UIButton) {
        view.backgroundColor = UIColor.brown
        uicolor = UIColor.brown
        colorString = "brown"
    }
    
    @IBAction func blueButton(_ sender: UIButton) {
        view.backgroundColor = UIColor.blue
        uicolor = UIColor.blue
        colorString = "blue"
    }
    
    @IBAction func YellowButton(_ sender: UIButton) {
        view.backgroundColor = UIColor.yellow
        uicolor = UIColor.yellow
        colorString = "yellow"
    }
    
    @IBAction func okButton(_ sender: UIButton) {
        delegate?.setColor(bgcolor: uicolor!, label: colorString!)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
