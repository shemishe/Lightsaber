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
    private var lightsaberModel = Model()
    
    var saberImageHeightConstraint: NSLayoutConstraint!
    var saberImageWidthConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lightsaberModel.whichLightsaber = "luke"
        lightsaberModel.isSaberOn = false
        saberImageHeightConstraint = NSLayoutConstraint(item: mainView.saberImage, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0.0, constant: 1)
        saberImageWidthConstraint = NSLayoutConstraint(item: mainView.saberImage, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0.0, constant: 1)
        saberImageHeightConstraint.isActive = true
        saberImageWidthConstraint.isActive = true
        mainView.lightsaberImage.addTarget(self, action: #selector(self.lightsaberTapped), for: .touchUpInside)
        mainView.changeSideButton.addTarget(self, action: #selector(self.changeLightsaberTapped), for: .touchUpInside)
        lightsaberModel.turnSaberOn()
    }
    
    override func loadView() {
        self.view = MainView(frame: UIScreen.main.bounds)
    }

    @objc func lightsaberTapped() {
        print("lightsaber open!")
        
        if lightsaberModel.isSaberOn == false {
            UIView.animate(withDuration: 0.2, animations: {
                self.saberImageHeightConstraint.constant = 530
                self.saberImageWidthConstraint.constant = 210
                self.mainView.layoutIfNeeded()
                self.viewDidLayoutSubviews()
            }, completion: nil)
            lightsaberModel.turnSaberOnAudio.play()
            lightsaberModel.isSaberOn = true
        } else {
            UIView.animate(withDuration: 0.2, animations: {
                self.saberImageHeightConstraint.constant = 1
                self.saberImageWidthConstraint.constant = 1
                self.mainView.layoutIfNeeded()
                self.viewDidLayoutSubviews()
            }, completion: nil)
            lightsaberModel.turnSaberOffAudio.play()
            lightsaberModel.isSaberOn = false
        }
    }
    
    @objc func changeLightsaberTapped() {
        print("lightsaber changed!")
        
        if lightsaberModel.whichLightsaber == "luke" {
            lightsaberModel.whichLightsaber = "vader"
            mainView.lightsaberImage.setImage(UIImage(named: "vaderlightsaber"), for: .normal)
            mainView.saberImage.image = UIImage(named: "redsaber")
        } else {
            lightsaberModel.whichLightsaber = "luke"
            mainView.lightsaberImage.setImage(UIImage(named: "lukelightsaber"), for: .normal)
            mainView.saberImage.image = UIImage(named: "bluesaber")
        }
    }
}

