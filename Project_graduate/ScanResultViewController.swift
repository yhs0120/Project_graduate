//
//  ScanResultViewController.swift
//  Project_graduate
//
//  Created by 윤한솔 on 2023/01/04.
//

import UIKit
import Alamofire

class ScanResultViewController: UIViewController {

    @IBOutlet weak var bookCoverLabel: UILabel!
    @IBOutlet weak var bookTitleLabel: UILabel!
    
    @IBOutlet weak var bookTitleTextField: UITextField!
    
    @IBOutlet weak var bookCoverImage: UIImageView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //label 둥글게 만듬
        bookCoverLabel.clipsToBounds = true
        bookTitleLabel.clipsToBounds = true
        bookTitleLabel.layer.cornerRadius = 10
        bookCoverLabel.layer.cornerRadius = 10
        bookCoverLabel.layer.borderWidth = 2
        bookTitleLabel.layer.borderWidth = 2
        //네비게이션 바 숨기기
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    //사진 다운 받아서 파싱 후 이미지, 제목 self.textfield -> 함수로 만들고 viewdidload()에 함수 넣기
    @IBAction func onBtnQuit(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func onBtnCamera(_ sender: UIButton) {
        let newVC = self.storyboard?.instantiateViewController(withIdentifier: "CamViewController") as! CamViewController
        self.navigationController?.popToViewController(newVC, animated: true)
    }
    
    @IBAction func onBtnSearch(_ sender: UIButton) {
        // 리뷰 보여주는 화면으로 넘어가기
    }
}
