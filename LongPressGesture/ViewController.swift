//
//  ViewController.swift
//  LongPressGesture
//
//  Created by SaiSandeep on 16/11/17.
//  Copyright © 2017 iOSRevisited. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView = UIImageView()
    
    var longPressGesture = UILongPressGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "cat")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1).isActive = true
        
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressGestureHandler))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(longPressGesture)
    }
    @objc func longPressGestureHandler(recognizer:UIPinchGestureRecognizer){
        switch recognizer.state {
        case .began:
            UIView.animate(withDuration: 0.05,
                           animations: {
                            self.imageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            },
                           completion: nil)
        case .ended:
            UIView.animate(withDuration: 0.05) {
                self.imageView.transform = CGAffineTransform.identity
            }
        default: break
        }
    }
}

