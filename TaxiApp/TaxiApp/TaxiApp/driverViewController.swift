//
//  ViewController.swift
//  TaxiApp
//
//  Created by Jing Wei Nicholas Lim on 3/26/19.
//  Copyright © 2019 Jing Wei Nicholas Lim. All rights reserved.
//

import UIKit
import os.log

class driverViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var driveR: driver?

    @IBOutlet weak var driverPic: UIImageView!
    @IBOutlet weak var ratingControls: ratings!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var destinationField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    //MARK: Navigation
    //configure view controller before its presented
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button == saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
            let name = nameField.text ?? ""
            let photo = driverPic.image
            let ratings = ratingControls.ratingNo
            let destination = destinationField.text ?? ""
            driveR = driver(photo: photo, name: name, destination: destination, rating: ratings)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let driveR = driveR {
            nameField.text = driveR.name
            driverPic.image = driveR.photo
            ratingControls.ratingNo = driveR.rating
            destinationField.text = driveR.destination
        }
    }
    
    
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddDriverMode = presentingViewController is UINavigationController
        
        if isPresentingInAddDriverMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The driverViewController is not inside a navigation controller.")
        }
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
    
}

