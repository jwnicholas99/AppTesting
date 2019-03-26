//
//  ViewController.swift
//  Simple Food Tracker
//
//  Created by Jing Wei Nicholas Lim on 3/25/19.
//  Copyright © 2019 Jing Wei Nicholas Lim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nameField: UILabel!
    @IBOutlet weak var originField: UILabel!
    @IBOutlet weak var priceField: UILabel!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var originText: UITextField!
    @IBOutlet weak var priceText: UITextField!
    @IBOutlet weak var imageField: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func resetDefault(_ sender: UIButton) {
        nameField.text = "Name?"
        originField.text = "Origin?"
        priceField.text = "Price?"
    }
    
    @IBAction func updateButt(_ sender: UIButton) {
        nameField.text = nameText.text
        originField.text = originText.text
        priceField.text = priceText.text
    }
    @IBAction func updateImage(_ sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
    }
    imageField.image = selectedImage
        dismiss(animated: true, completion: nil)
}

}
