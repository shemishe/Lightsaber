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

    override func viewDidLoad() {
        super.viewDidLoad()
        lightsaberModel.whichLightsaber = "luke"
        lightsaberModel.isSaberOn = false
        mainView.lightsaberImage.addTarget(self, action: #selector(self.lightsaberTapped), for: .touchUpInside)
        mainView.changeSideButton.addTarget(self, action: #selector(self.changeLightsaberTapped), for: .touchUpInside)
    }
    
    override func loadView() {
        self.view = MainView(frame: UIScreen.main.bounds)
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEvent.EventSubtype.motionShake {
            
        }
    }
    
    @objc func lightsaberTapped() {
        print("lightsaber open!")
        
        if !lightsaberModel.isSaberOn {
            UIView.animate(withDuration: 0.2, animations: {
                self.mainView.saberImageHeightConstraint.constant = 530
                self.mainView.saberImageWidthConstraint.constant = 210
                self.mainView.layoutIfNeeded()
                self.viewDidLayoutSubviews()
            }, completion: nil)
            lightsaberModel.turnSaberOnAudio?.play()
            lightsaberModel.isSaberOn = true
            lightsaberModel.saberHumAudio?.play()
        } else {
            UIView.animate(withDuration: 0.2, animations: {
                self.mainView.saberImageHeightConstraint.constant = 1
                self.mainView.saberImageWidthConstraint.constant = 1
                self.mainView.layoutIfNeeded()
                self.viewDidLayoutSubviews()
            }, completion: nil)
            lightsaberModel.turnSaberOffAudio?.play()
            lightsaberModel.isSaberOn = false
            lightsaberModel.saberHumAudio?.stop()
        }
    }
    
    @objc func changeLightsaberTapped() {
        print("lightsaber changed!")
        
        if lightsaberModel.whichLightsaber == "luke" {
            lightsaberModel.whichLightsaber = "vader"
            mainView.lightsaberImage.setImage(UIImage(named: "vaderlightsaber"), for: .normal)
            mainView.saberImage.image = UIImage(named: "redsaber")
            mainView.changeSideButton.setTitle("Jedi Side", for: .normal)
        } else {
            lightsaberModel.whichLightsaber = "luke"
            mainView.lightsaberImage.setImage(UIImage(named: "lukelightsaber"), for: .normal)
            mainView.saberImage.image = UIImage(named: "bluesaber")
            mainView.changeSideButton.setTitle("Dark Side", for: .normal)
        }
    }
}

