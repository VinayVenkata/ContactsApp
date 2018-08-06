//
//  NewContactViewController.swift
//  ContactsApp
//
//  Created by Vinay Ponnuri on 8/6/18.
//  Copyright © 2018 Vinay Ponnuri. All rights reserved.
//

import UIKit

protocol NewContactDelegate {
    func addContact(firstName: String, lastName: String, company: String)
}

class NewContactViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    weak var delegate: NewContactViewController?
    var arrayOfCells: [String] = []
    var firstName: String?
    var lastName: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Add New Contact"
        let nib = UINib(nibName: "TextFieldTableViewCell", bundle: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveContact(_ sender: Any) {
        if let name = self.firstName {
            print(name)
        }
//        self.alias = cell.aliasTextField.text!
//        self.primaryPhone = cell.primaryPhoneTextField.text!
//        self.secondaryPhone = cell.seondaryPhoneTextField.text!
//        self.email = cell.emailAddressTextField.text!
    }
    
    @IBAction func uploadPicture(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Open Camera", style: .default) { action in
            self.openCamera()
        }
        let choosePhoto = UIAlertAction(title: "Choose Photo", style: .default) { action in
            self.choosePhoto()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(cameraAction)
        alert.addAction(choosePhoto)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func choosePhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    // MARK: - ImagePicker Delegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.contentMode = .scaleAspectFit
            imageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion:nil)
    }
}
