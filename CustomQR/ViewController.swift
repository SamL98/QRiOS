//
//  ViewController.swift
//  CustomQR
//
//  Created by Sam Lerner on 10/21/17.
//  Copyright © 2017 Sam Lerner. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var previewView: UIView!
    
    var session: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let captureDevice = AVCaptureDevice.default(for: .video)
        var input: AVCaptureDeviceInput
        
        do {
            input = try AVCaptureDeviceInput(device: captureDevice!)
        } catch let error as NSError {
            print(error)
            return
        }
        
        session = AVCaptureSession()
        session.addInput(input)
        
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        previewLayer.frame = view.layer.bounds
        previewView.layer.addSublayer(previewLayer)
        
        session.startRunning()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

