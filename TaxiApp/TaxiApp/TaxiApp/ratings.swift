//
//  ratings.swift
//  TaxiApp
//
//  Created by Jing Wei Nicholas Lim on 3/26/19.
//  Copyright © 2019 Jing Wei Nicholas Lim. All rights reserved.
//

import UIKit

@IBDesignable class ratings : UIStackView {
    
    private var ratingButtons = [UIButton]()
    var ratingNo = 0{
        didSet{
            updateButtonStates()
        }
    }
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0){
        didSet{
            setUpButtons()
        }
    }
    @IBInspectable var starCount: Int = 5{
        didSet{
            setUpButtons()
        }
    }
    
    override init(frame: CGRect){
        super.init(frame : frame)
        setUpButtons()
    }
    required init(coder: NSCoder) {
        super.init(coder : coder)
        setUpButtons()
    }
    private func setUpButtons(){
        
        //remove all previous buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        //load the star button images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "FilledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "EmptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "HighlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        for _ in 0..<starCount {
            
            //creates buttons
            let button = UIButton()
            
            //setting star images
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            //remove auto constraints and add in own constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            //adds button to stack view
            addArrangedSubview(button)
            
            //adds a target to the button so that when tap will take action
            button.addTarget(self, action: #selector(ratings.buttonTapped(button:)), for: .touchUpInside)
            
            //adds button to array of rating buttons
            ratingButtons.append(button)
        }
        updateButtonStates()
    }
    @objc func buttonTapped(button : UIButton){
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button, \(button) is not in the ratingButtons array: \(ratingButtons)")
        }
        
        //calc rating of selected button
        let selectedRating = index + 1
        
        if selectedRating == ratingNo {
            ratingNo = 0
        } else {
            ratingNo = selectedRating
        }
    }
    
    private func updateButtonStates(){
        for (index, button) in ratingButtons.enumerated(){
            button.isSelected = index < ratingNo
        }
    }
    
}
