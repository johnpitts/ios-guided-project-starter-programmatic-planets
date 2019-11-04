//
//  PlanetCollectionViewCell.swift
//  ProgrammaticPlanets
//
//  Created by Spencer Curtis on 9/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PlanetCollectionViewCell: UICollectionViewCell {
    
    private var imageView: UIImageView!
    private var nameLabel: UILabel!
    
    var planet: Planet! {
        didSet {
            updateViews()
        }
    }
    
    // used to create cells programmatically
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubViews()
    }
    
    // used by storyboard to initialize cells
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpSubViews()
    }
    
    private func setUpSubViews() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit    // scale it down, fit it inside frame, but keep aspect ratio
        addSubview(imageView)
        
        
        // we are doing this 2 different ways to show what's possible, typically you choose one or the other, not both
        //IMAGEVIEW
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        
        let leadingConstraint = NSLayoutConstraint(item: imageView,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .leading,
                                                   multiplier: 1,
                                                   constant: 4)
      
        let trailingConstraint = NSLayoutConstraint(item: imageView,
                                                   attribute: .trailing,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .trailing,
                                                   multiplier: 1,
                                                   constant: -4)
        
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint])
        
        self.imageView = imageView
        
        
        // LABEL
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = true
        addSubview(label)
        
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2).isActive = true
        label.trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: -2).isActive = true
        self.nameLabel = label
    }
    
    private func updateViews() {
        imageView.image = planet.image
        nameLabel.text = planet.name
    }
    
}
