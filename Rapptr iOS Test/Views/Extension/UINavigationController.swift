//
//  UINavigationController.swift
//  Rapptr iOS Test
//
//  Created by Hector Barrios on 8/17/21.
//

import UIKit

extension UINavigationController {
    func setup() {
        let blue = UIColor(named: "primary_blue")
        let white = UIColor(named: "white")
        let font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
        
        if #available(iOS 13.0, *) {
            let app = UINavigationBarAppearance()
            app.titleTextAttributes = [.foregroundColor: white!, .font: font]
            app.largeTitleTextAttributes = [.foregroundColor: white!]
            app.backgroundColor = blue
            app.shadowColor = nil
            self.navigationBar.standardAppearance = app
            self.navigationBar.scrollEdgeAppearance = app
            self.navigationBar.tintColor = white
            self.overrideUserInterfaceStyle = .dark
            
        } else {
            let image = UIImage()
            self.navigationBar.setBackgroundImage(image, for: .default)
            self.navigationBar.shadowImage = UIImage()
            self.navigationBar.isTranslucent = false
            self.navigationBar.barTintColor = blue
            self.navigationBar.barStyle = .black
            self.navigationBar.tintColor = white
            self.navigationBar.titleTextAttributes = [.font: font]
        }
    }
}
