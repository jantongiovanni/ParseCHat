//
//  LoginViewController.swift
//  ParseChat
//
//  Created by Joe Antongiovanni on 2/25/18.
//  Copyright © 2018 Joe Antongiovanni. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignIn(_ sender: AnyObject) {
        PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) { (user: PFUser?, error: Error?) in
            if let error = error {
                print("User log in failed: \(error.localizedDescription)")
            } else {
                print("User logged in successfully")
                // manually segue to logged in view
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }

    @IBAction func onSignUp(_ sender: AnyObject) {
        let newUser = PFUser()
        
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        
        let alertController = UIAlertController(title: "Error", message: "Username or password cannot be empty", preferredStyle: .alert)

        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // handle response here.
        }
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        
        if ((newUser.username?.isEmpty)! || (newUser.password?.isEmpty)!){
            present(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }}
      
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
                let errorController = UIAlertController(title: "Error", message: "There was a problem connecting to the server, please try again", preferredStyle: .alert)
                // add the OK action to the alert controller
                errorController.addAction(OKAction)
                self.present(errorController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
            } else {
                print("User Registered successfully")
                // manually segue to logged in view
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
