//
//  AnimationViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class AnimationViewController: UIViewController {
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Logo should fade out or fade in when the user hits the Fade In or Fade Out button
     *
     * 3) User should be able to drag the logo around the screen with his/her fingers
     *
     * 4) Add a bonus to make yourself stick out. Music, color, fireworks, explosions!!! Have Swift experience? Why not write the Animation 
     *    section in Swfit to show off your skills. Anything your heart desires!
     *
     */
    
    /* 2hrs of work*/
    private var logoUIImage: UIImageView!
    private var logoActionButton: UIButton!
    private let fadeIn = "FADE IN"
    private let fadeOut = "FADE OUT"
    private var fade = true
    private let trailingConstant = CGFloat(-30)
    private let leadingConstant = CGFloat(30)
    private let imageTopConstant = CGFloat(96)
    private let buttonBottomConstant = CGFloat(-30)
    private var imageOriginalCenter: CGPoint?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Animation"
        
        /* Logo image that we can drag around and fade*/
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(dragImg))
        self.logoUIImage = UIImageView(image: UIImage(named: "ic_logo"))
        self.logoUIImage.translatesAutoresizingMaskIntoConstraints = false
        self.logoUIImage.contentMode = .scaleAspectFit
        self.logoUIImage.isUserInteractionEnabled = true
        self.logoUIImage.addGestureRecognizer(panGesture)
        self.view.addSubview(logoUIImage)
        
        /*Button setup to fade in and out Logo*/
        self.logoActionButton = UIButton(type: .system)
        self.logoActionButton.translatesAutoresizingMaskIntoConstraints = false
        self.logoActionButton.setup(title: self.fadeOut)
        self.logoActionButton.addTarget(self, action: #selector(logoButtonAction), for: .touchUpInside)
        self.view.addSubview(self.logoActionButton)

        /*auto layout constraints for the button and logo*/
        NSLayoutConstraint.activate([self.logoUIImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: self.imageTopConstant),
                                     self.logoUIImage.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: self.leadingConstant),
                                     self.logoUIImage.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: self.trailingConstant),
                                     self.logoActionButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: self.buttonBottomConstant),
                                     self.logoActionButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: self.leadingConstant),
                                     self.logoActionButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: self.trailingConstant),
                                     self.logoActionButton.heightAnchor.constraint(equalToConstant: 55)])
        self.view.backgroundColor = UIColor(named: "background")
        self.view.clipsToBounds = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // MARK: - Actions
    @objc
    func logoButtonAction(sender: UIButton!) {
        self.logoActionButton.setTitle(self.fade ? self.fadeIn : self.fadeOut, for: .normal)
        let anim = UIViewPropertyAnimator(duration: 0.75, curve: .linear) {
            if let originalCenter = self.imageOriginalCenter,
               self.logoUIImage.center != originalCenter {
                self.logoUIImage.center = originalCenter
            }
            self.logoUIImage.alpha = self.fade ? 0.0 : 1.0
        }
        anim.startAnimation()

        self.fade.toggle()
    }
    
    @objc
    func dragImg(_ sender: UIPanGestureRecognizer) {
        if sender.state == .began {

            self.imageOriginalCenter = sender.view!.center
        }
        let translation = sender.translation(in: self.view)
        self.logoUIImage.center = CGPoint(x: self.logoUIImage.center.x + translation.x, y: self.logoUIImage.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
    }

}
