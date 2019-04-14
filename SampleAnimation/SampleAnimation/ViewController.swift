//
//  ViewController.swift
//  SampleAnimation
//
//  Created by Apinun Wongintawang on 4/14/19.
//  Copyright © 2019 Apinun Wongintawang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var liverpoolImgView: UIImageView!
    @IBOutlet weak var chelseaImgView: UIImageView!
    @IBOutlet weak var centerLabel: UILabel!
    @IBOutlet weak var liverpoolLabel: UILabel!
    @IBOutlet weak var chelseaLabel: UILabel!
    var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animation()
        
        //Using Trainsition method, View must added in viewDidLoad function.
        containerView = UIView(frame: view.bounds)
        containerView.frame = view.bounds
        view.addSubview(containerView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        transitionUI()
    }

    private func animation() {
        let tempPoint = liverpoolImgView.center
        liverpoolImgView.center.x = tempPoint.x - (UIScreen.main.bounds.width/2)
        liverpoolImgView.alpha = 0.0
        UIView.animate(withDuration: 0.75, delay: 0.25, options: [.transitionFlipFromLeft], animations: {
            self.liverpoolImgView.alpha = 1.0
            self.liverpoolImgView.center.x = tempPoint.x
        }, completion: { (isSuccess) in
            
        })
        
        let tempPointChelSea = chelseaImgView.center
        chelseaImgView.center.x = tempPointChelSea.x + (UIScreen.main.bounds.width/2)
        UIView.animate(withDuration: 0.75, delay: 0.25, options: [.transitionFlipFromLeft], animations: {
            self.chelseaImgView.center.x = tempPointChelSea.x
        }, completion: { (isSuccess) in
            
        })
        
        self.centerLabel.hiddenAnimation()
        self.liverpoolLabel.hiddenAnimation()
        self.chelseaLabel.hiddenAnimation()
    }
    
    private func transitionUI() {
        
        let newImageView = UIImageView(image: #imageLiteral(resourceName: "ic_liverpool"))
        newImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        newImageView.center = containerView.center
        newImageView.contentMode = .scaleAspectFit
        
        UIView.transition(with: containerView, duration: 1.0, options: [.curveEaseOut, .transitionFlipFromBottom], animations: {
            self.containerView.addSubview(newImageView)
        }, completion: { isSuccess in
            
        })
    }
}

extension UIView {
    func hiddenAnimation(duration: TimeInterval = 1.0) {
        self.alpha = 0.0
        UIView.animate(withDuration: duration, delay: 0.0, options: [.curveEaseIn], animations: {
            self.alpha = 1.0
        }, completion: { (isSuccess) in
            
        })
    }
}
