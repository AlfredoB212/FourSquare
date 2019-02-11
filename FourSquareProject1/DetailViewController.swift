//
//  ViewController.swift
//  FourSquareProject1
//
//  Created by Alfredo Barragan on 2/8/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var detailViewSetup = DetailViewSetup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailViewSetup)
        // Do any additional setup after loading the view, typically from a nib.
    }


}

