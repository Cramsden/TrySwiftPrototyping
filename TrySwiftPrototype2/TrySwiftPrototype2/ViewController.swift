//
//  ViewController.swift
//  TrySwiftPrototype2
//
//  Created by Carson Ramsden on 8/17/19.
//  Copyright © 2019 Carson Ramsden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let networkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.fetchLabs { (error, labs) in
            print(labs)
        }

        networkManager.fetchProviders { (error, providers) in
            print(providers)
        }

        networkManager.fetchOffices { (error, offices) in
            print(offices)
        }

        networkManager.fetchRiskScores { (error, riskScores) in
                print(riskScores)
            }
        // Do any additional setup after loading the view.
    }

}

