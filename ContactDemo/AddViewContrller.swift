//
//  AddViewContrller.swift
//  ContactDemo
//
//  Created by iFlame on 5/27/17.
//  Copyright © 2017 iFlame. All rights reserved.
//

import UIKit

class AddViewContrller: UIViewController, UIGestureRecognizerDelegate ,UINavigationControllerDelegate ,UIImagePickerControllerDelegate {
    
    
    @IBOutlet weak var profilePicture: UIImageView!
    
       
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var contactName: UITextField!
    
    @IBOutlet weak var number: UILabel!
    
    @IBOutlet weak var contactNumber: UITextField!
    
    @IBOutlet weak var emailId: UILabel!
    
    
    @IBOutlet weak var contactEmail: UITextField!
    @IBOutlet var swipeDown: UISwipeGestureRecognizer!
    
    @IBAction func saveView(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func swipe(_ sender: UISwipeGestureRecognizer) {
        print("swipe")
        self.contactName.resignFirstResponder()
        self.contactNumber.resignFirstResponder()
        self.contactEmail.resignFirstResponder()
        self.profilePicture.resignFirstResponder()
        
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        profilePicture.isUserInteractionEnabled = true
        profilePicture.addGestureRecognizer(tapGestureRecognizer)
        self.view.addGestureRecognizer(self.swipeDown)

        // Do any additional setup after loading the view.
    }
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        // Your action
        
        // Create a UiPickerContoller
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a Photo", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        profilePicture.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
