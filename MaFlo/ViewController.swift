//
//  ViewController.swift
//  MaFlo
//
//  Created by Miguel D Rojas Cortés on 9/2/18.
//  Copyright © 2018 MRC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var counterView: CounterView!
    @IBOutlet private weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = String(describing: counterView.counter)
    }
    
    
    @IBAction func pushButtonPressed(_ button: PushButton) {
        if button.isAddButton {
            counterView.counter += 1
        } else {
            if counterView.counter > 0 {
                counterView.counter -= 1
            }
        }
        counterLabel.text = String(counterView.counter)        
    }
    
}

