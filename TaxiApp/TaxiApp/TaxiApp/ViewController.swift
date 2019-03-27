//
//  ViewController.swift
//  TaxiApp
//
//  Created by Jing Wei Nicholas Lim on 3/26/19.
//  Copyright © 2019 Jing Wei Nicholas Lim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var driverPic: UIImageView!
    @IBOutlet weak var ratingControls: ratings!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var destinationField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func pickPhoto(_ sender: UITapGestureRecognizer){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Bad input")
        }
        driverPic.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func update(_ sender: UIButton) {
        let driver = Driver(photo: driverPic.image, name: nameField.text!, destination: destinationField.text!, rating: ratingControls.ratingNo)
    }
}

