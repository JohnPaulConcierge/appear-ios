//
//  ViewController.swift
//  Appear
//
//  Created by John Paul on 6/7/18.
//  Copyright © 2018 John Paul. All rights reserved.
//

import UIKit
import Appear

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Appear.build(components: [:])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
