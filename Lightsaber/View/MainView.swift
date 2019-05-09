//
//  MainView.swift
//  Lightsaber
//
//  Created by Sherman Shi on 5/5/19.
//  Copyright © 2019 Sherman Shi. All rights reserved.
//

import Foundation
import UIKit

class MainView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addViewSetup()
        addConstraintSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let backgroundImage: UIImageView = {
        let background = UIImageView(image: UIImage(named: "starwarsspace"))
        background.contentMode = .scaleAspectFill
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    let lightsaberImage: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "lukelightsaber")
        button.setImage(image, for: .normal)
        button.adjustsImageWhenHighlighted = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let saberImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "bluesaber"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let changeSideButton: UIButton = {
        let button = UIButton()
        button.setTitle("Dark Side", for: .normal)
        button.adjustsImageWhenHighlighted = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func addViewSetup() {
        self.addSubview(backgroundImage)
        self.addSubview(saberImage)
        self.addSubview(lightsaberImage)
        self.addSubview(changeSideButton)
    }
    
    func addConstraintSetup() {
        backgroundImage.anchorWithConstant(top: self.topAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeading: 0, paddingTrailing: 0, width: 0, height: 0)
        
        changeSideButton.anchorWithConstant(top: self.topAnchor, bottom: nil, leading: nil, trailing: self.trailingAnchor, paddingTop: 35, paddingBottom: 0, paddingLeading: 0, paddingTrailing: -25, width: 0, height: 0)
        
        lightsaberImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        lightsaberImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25).isActive = true
        lightsaberImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.17).isActive = true
        lightsaberImage.anchorWithConstant(top: nil, bottom: self.bottomAnchor, leading: nil, trailing: nil, paddingTop: 0, paddingBottom: -40, paddingLeading: 0, paddingTrailing: 0, width: 0, height: 0)
        
        saberImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        saberImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.65).isActive = true
//        saberImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.55).isActive = true
        saberImage.anchorWithConstant(top: nil, bottom: lightsaberImage.topAnchor, leading: nil, trailing: nil, paddingTop: 0, paddingBottom: 27, paddingLeading: 0, paddingTrailing: 0, width: 0, height: 0)
    }
        
}
