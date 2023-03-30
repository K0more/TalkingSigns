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
import AVFoundation

class backwardsTranslateViewController: UIViewController,AVCapturePhotoCaptureDelegate ,UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    

    @IBOutlet weak var galleryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        view.layer.addSublayer(previewLayer)
        //view.addSubview(shutterButton)
        checkCameraPermissions()
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
    
    
    
//    @IBOutlet weak var imageView: UIImageView!
//
//
//    @IBAction func shareButtonTapped(_ sender: UIButton ) {
//
//
//        guard let image = imageView.image else {
//            return
//        }
//
//        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
//
//        activityController.popoverPresentationController?.sourceView = sender
//
//        present(activityController, animated: true, completion: nil)
//
//        if let url = URL(string: "https://www.apple.com") {
//            let safariViewController = SFSafariViewController(url: url)
//
//            present(safariViewController, animated: true, completion: nil)
//        }
    
    
    @IBOutlet weak var screen: UIView!
    
    var captureSession = AVCaptureSession?.self
    let output = AVCapturePhotoOutput()
    var captureDevice: AVCaptureDevice?
    var captureDeviceInput: AVCaptureDeviceInput?
    let previewLayer = AVCaptureVideoPreviewLayer()
    var session = AVCaptureSession()
    
    enum CameraCase {
        case front
        case back
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        previewLayer.frame = screen.bounds
        
//        shutterButton.center = CGPoint(x: screen.frame.size.width/2, y: screen.frame.size.height - 100)
    }
    
    private func checkCameraPermissions() {
        switch AVCaptureDevice.authorizationStatus(for: .video){
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) {
                granted in guard granted else {
                    return
                }
                DispatchQueue.main.async {
                    self.setUpCamera()
                }
            }
        case .restricted:
            break
        case .denied:
            break
        case .authorized:
            setUpCamera()
        @unknown default:
            break
        }
    }
    
    private func setUpCamera() {
        
        if let device = AVCaptureDevice.default(for: .video){
            do {
                let input = try AVCaptureDeviceInput(device: device)
                if session.canAddInput(input){
                    session.addInput(input)
                }
                if session.canAddOutput(output){
                    session.addOutput(output)
                }
                
                previewLayer.videoGravity = .resizeAspectFill
                previewLayer.session = session
                
                session.startRunning()
                //self.session = session
            }
            catch{
                print(error)
                
            }
        }
    }
    
    @objc private func didTapTakePhoto() {
        output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let data = photo.fileDataRepresentation() else{
            return
        }
        let image = UIImage(data: data)
        session.stopRunning()
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.frame = view.bounds
        view.addSubview(imageView)
    }
}

    


