//
//  ViewController.swift
//  CoreDataPhotosApp
//
//  Created by Austin Sizemore on 3/20/19.
//  Copyright © 2019 Austin Sizemore. All rights reserved.
//

import UIKit
import CoreData

//Make an extension of this class?
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func openCamera(_ sender: Any) {
        
        if(UIImagePickerController.isSourceTypeAvailable(.camera)) {
            
            imagePicker.sourceType = .camera
            
            present(imagePicker, animated: true)
        }
        else {
            print("Camera not supported by this device")
            return
        }
    }
    
    @IBAction func openImagesFolder(_ sender: Any) {
        
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            imagePicker.sourceType = .photoLibrary
            
            present(imagePicker, animated: true)
        }
        else {
            print("Can't open photo library")
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imagePicker.delegate = self
    }
    
    //In example of link, we are accepting a string: any as an index for info so need to change that in params
    //and also code when indexing info!
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
//        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//            imageView.image = image
//        }
        
        //above implementation is better but for some reason image DNE for some code and says its
        //unidentified if i do the first way
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage

        imageView.image = image
        
        dismiss(animated: true)
        
        //Code above is from Module 8 Challenge: Photos
        //Code below is adding on to use Core Data with photos for Module 9
    }
    
    
    
    
    
    
    //Thanks Brenden
    #warning("Dont touch this austin")
}
