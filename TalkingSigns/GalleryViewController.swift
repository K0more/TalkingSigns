//
//  GalleryViewController.swift
//  TalkingSigns
//
//  Created by Archit Khanna on 03/03/23.
//
import PhotosUI
import UIKit

class GalleryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        
        var config = PHPickerConfiguration()
        config.selectionLimit = 3
        
        let phPickerVC = PHPickerViewController(configuration: config)
        self.present(phPickerVC, animated: true)
    }
    
}


