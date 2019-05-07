//
//  ViewController.swift
//  Lightsaber
//
//  Created by Sherman Shi on 5/5/19.
//  Copyright © 2019 Sherman Shi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var mainView: MainView { return self.view as! MainView }
    var soundModel = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.lightsaberImage.addTarget(self, action: #selector(self.lightsaberTapped), for: .touchUpInside)
        soundModel.turnSaberOn()
    }
    
    override func loadView() {
        self.view = MainView(frame: UIScreen.main.bounds)
    }

    @objc func lightsaberTapped() {
        print("lightsaber open!")
        soundModel.turnSaberOnAudio.play()
    }
    
}

