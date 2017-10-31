//
//  ViewController.swift
//  SCAN
//
//  Created by admin on 31/10/2017.
//  Copyright © 2017 MuhammadAamir. All rights reserved.
//

import UIKit
import IRLDocumentScanner
import IRLDocumentScanner.IRLDocumentScanner
import IRLDocumentScanner.IRLScannerViewController
import TOCropViewController


class ViewController: UIViewController,IRLScannerViewControllerDelegate {

    @IBOutlet weak var scan: UIImageView!
    @IBOutlet weak var btnScan: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ScanBtn(_ sender: Any) {
        let scanner = IRLScannerViewController.standardCameraView(with: self)
        scanner.showControls = true
        scanner.showAutoFocusWhiteRectangle = true
        present(scanner, animated: true, completion: nil)
    }
    // MARK: IRLScannerViewControllerDelegate
    
    func pageSnapped(_ page_image: UIImage, from controller: IRLScannerViewController) {
        controller.dismiss(animated: true) { () -> Void in
            self.imageView.image = page_image
        }
    }
    
    func cameraViewWillUpdateTitleLabel(_ cameraView: IRLScannerViewController) -> String? {
        
        var text = ""
        switch cameraView.cameraViewType {
        case .normal:           text = text + "NORMAL"
        case .blackAndWhite:    text = text + "B/W-FILTER"
        case .ultraContrast:    text = text + "CONTRAST"
        }
        
        switch cameraView.detectorType {
        case .accuracy:         text = text + " | Accuracy"
        case .performance:      text = text + " | Performance"
        }
        
        return text
    }
    
    func didCancel(_ cameraView: IRLScannerViewController) {
        cameraView.dismiss(animated: true){ ()-> Void in
            NSLog("Cancel pressed");
        }
    }
    
    
}

