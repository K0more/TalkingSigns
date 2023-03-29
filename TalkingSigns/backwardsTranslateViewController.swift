//
//  backwardsTranslateViewController.swift
//  TalkingSigns
//
//  Created by Archit Khanna on 26/02/23.
//
import PhotosUI
import MessageUI
import SafariServices
import UIKit

class backwardsTranslateViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    
    @IBOutlet weak var galleryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //    @IBAction func galleryButtonTapped(_ sender: Any) {
    //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //
    //        let vc = storyboard.instantiateViewController(withIdentifier: "galleryCollectionView")
    ////        vc.modalPresentationStyle = .overFullScreen
    ////        self.present(vc, animated: true)
    //        let transition = CATransition()
    //        transition.duration = 0.5
    //        transition.type = CATransitionType.push
    //        transition.subtype = CATransitionSubtype.fromRight
    //        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
    //        view.window!.layer.add(transition, forKey: kCATransition)
    //        vc.modalPresentationStyle = .overFullScreen
    //        present(vc, animated: false, completion: nil)
    //    }
    
    
    @IBAction func galleryButtonTapped(_ sender: Any) {
        var config = PHPickerConfiguration()
        config.selectionLimit = 3
        
        let phPickerVC = PHPickerViewController(configuration: config)
        self.present(phPickerVC, animated: true)
    }
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBAction func shareButtonTapped(_ sender: UIButton ) {
        
        
        guard let image = imageView.image else {
            return
        }
        
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        activityController.popoverPresentationController?.sourceView = sender
        
        present(activityController, animated: true, completion: nil)
        
        if let url = URL(string: "https://www.apple.com") {
            let safariViewController = SFSafariViewController(url: url)
            
            present(safariViewController, animated: true, completion: nil)
        }
    }
}
