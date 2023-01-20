//
//  ViewController.swift
//  FoursquareCloneParse
//
//  Created by Mustafa Adnan Tatlıcı on 20.01.2023.
//

import UIKit
import Parse


class ViewController: UIViewController {
    

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passswordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()



    }

    @IBAction func signInClicked(_ sender: Any) {
        
        if usernameText.text != "" && passswordText.text != "" {
            PFUser.logInWithUsername(inBackground: usernameText.text!, password: passswordText.text!) { user, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    //segue
                    print("giriş yapıldı")
                }
                     
            }
        } else {
            makeAlert(titleInput: "error", messageInput: "Username/Password??")
        }
        
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        print("Tıklandı")
        if usernameText.text != "" && passswordText.text != "" {
            let user = PFUser()
            user.username = usernameText.text!
            user.password = passswordText.text!
            
            user.signUpInBackground { success, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    //segue
                    print("ok")
                }
            }
        } else {
            makeAlert(titleInput: "Error", messageInput: "Username/Password??")
        }
        
        
    }
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}

