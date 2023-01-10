//
//  CamViewController.swift
//  Project_graduate
//
//  Created by 윤한솔 on 2023/01/04.
//

import UIKit
import CropViewController

class CamViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate, CropViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        //안되면 mainpage 버튼으로 넘기기
        let camera = UIImagePickerController()
        camera.sourceType = .camera
        camera.allowsEditing = false
        camera.cameraDevice = .rear
        camera.cameraCaptureMode = .photo
        camera.delegate = self
        present(camera, animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.navigationController?.popViewController(animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        self.navigationController?.pushViewController(EditViewController(), animated: true)
        guard let image = info[.originalImage] as? UIImage else {
            return
        }
        picker.dismiss(animated: true)
        showCrop(image:image)
    }
    
    func showCrop(image : UIImage) {
        let vc = CropViewController(croppingStyle: .default, image: image)
        vc.aspectRatioPreset = .presetSquare
        vc.aspectRatioLockEnabled = false
        vc.doneButtonColor = .systemRed
        vc.cancelButtonColor = .systemRed
        vc.toolbarPosition = .bottom
        vc.doneButtonTitle = "Continue"
        vc.cancelButtonTitle = "Quit"
        vc.delegate = self
        present(vc, animated:true)
    }
    
    func cropViewController(_ cropViewController: CropViewController, didFinishCancelled cancelled: Bool) {
        cropViewController.dismiss(animated: true)
    }
    func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage,withRect cropRect: CGRect, angle: Int) {
        cropViewController.dismiss(animated: true)
    
        let imageVIEW = UIImageView(frame: view.frame)
        imageVIEW.contentMode = .scaleAspectFit
        imageVIEW.image = image
        view.addSubview(imageVIEW)
        //image 파일 업로드하기
        guard let newVC = self.storyboard?.instantiateViewController(withIdentifier:"ScanResultViewController") as? ScanResultViewController else {
            return
        }
        self.navigationController?.pushViewController(newVC, animated: true)        
    }

}
