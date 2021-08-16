//
//  LoginViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class LoginViewController: UIViewController {

    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Take email and password input from the user
     *
     * 3) Use the endpoint and paramters provided in LoginClient.m to perform the log in
     *
     * 4) Calculate how long the API call took in milliseconds
     *
     * 5) If the response is an error display the error in a UIAlertController
     *
     * 6) If the response is successful display the success message AND how long the API call took in milliseconds in a UIAlertController
     *
     * 7) When login is successful, tapping 'OK' in the UIAlertController should bring you back to the main menu.
     **/
    private var backgroundImageView: UIImageView!
    private var stackView: UIStackView!
    private var email: UITextField!
    private var password: UITextField!
    private var loginButton: UIButton!
    
    
    private let leadingConstant = CGFloat(30)
    private let trailingConstant = CGFloat(-30)
    private let topConstant = CGFloat(64)
    private let height = CGFloat(55)
    private let spacing = CGFloat(24)
    
    // MARK: - Properties
    private var client: LoginClient?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        client = LoginClient()
        title = "Login"
        
        self.backgroundImageView = UIImageView(image: UIImage(named: "img_login"))
        self.backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(backgroundImageView)
        
        self.stackView = UIStackView()
        self.stackView.axis = .vertical
        self.stackView.alignment = .fill
        self.stackView.distribution = .fill
        self.stackView.spacing = self.spacing
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.stackView)
        
        self.email = UITextField()
        self.email.setup(title: "Email")
        self.email.autocapitalizationType = .none
        self.email.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(self.email)
        
        self.password = UITextField()
        self.password.setup(title: "Password")
        self.password.translatesAutoresizingMaskIntoConstraints = false
        self.password.isSecureTextEntry = true
        self.stackView.addArrangedSubview(self.password)
        
        self.loginButton = UIButton(type: .system)
        self.loginButton.setup(title: "Login")
        self.loginButton.translatesAutoresizingMaskIntoConstraints = false
        self.loginButton.addTarget(self, action: #selector(didPressLoginButton), for: .touchUpInside)
        self.stackView.addArrangedSubview(self.loginButton)
        
        
        
        
        NSLayoutConstraint.activate([self.backgroundImageView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                     self.backgroundImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                                     self.backgroundImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     self.backgroundImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     self.stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: self.leadingConstant),
                                     self.stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: self.trailingConstant),
                                     self.stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: self.topConstant),
                                     //stackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
                                     self.email.heightAnchor.constraint(equalToConstant: self.height),
                                     self.password.heightAnchor.constraint(equalToConstant: self.height),
                                     self.loginButton.heightAnchor.constraint(equalToConstant: self.height)])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @objc
    private func didPressLoginButton(_ sender: Any) {
        guard let client = client else { return }
        
        client.login(email: self.email.text ?? "", password: self.password.text ?? "") { value in
            let alert = UIAlertController(title: "Success", message: value, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { alert in
                self.view.isUserInteractionEnabled = false
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
        } error: { error in
            let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { alert in
            }))
            self.present(alert, animated: true, completion: nil)
        }

    }
}
