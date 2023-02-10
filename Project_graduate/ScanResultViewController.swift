//
//  ScanResultViewController.swift
//  Project_graduate
//
//  Created by 윤한솔 on 2023/01/04.
//

import UIKit
import SDWebImage
import Alamofire
import SwiftyJSON

class ScanResultViewController: UIViewController {

    @IBOutlet weak var bookCoverLabel: UILabel!
    @IBOutlet weak var bookTitleLabel: UILabel!
    
    
    @IBOutlet weak var bookTitleTextView: UITextView!
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
        //서버로부터 이미지 다운로드 -> 이미지 self.bookCoverImage = image -> 해놓기
        downloadImage()
//        downloadTitle()
    }
    
    
    
    @IBAction func onBtnQuit(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func onBtnCamera(_ sender: UIButton) {
//        let newVC = self.storyboard?.instantiateViewController(withIdentifier: "CamViewController") as! CamViewController
//        self.navigationController?.popToViewController(newVC, animated: true)
        let controllers = self.navigationController?.viewControllers
        for newVC in controllers! {
            if newVC is CamViewController {
//                self.navigationController?.popToViewController(newVC, animated: true)
                //북마크에서 dismiss 한 뒤 present 하는 법 참고
                self.navigationController?.popViewController(animated: true)
//                self.present(newVC, animated: true)
//                newVC.modalPresentationStyle = .fullScreen
            }
        }
       
    }
    
    @IBAction func onBtnSearch(_ sender: UIButton) {
        // 리뷰 보여주는 화면으로 넘어가기.
//        AF.request
//        self.navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
        
    }
    //제목, 사진 다운 받아서 파싱 후 이미지, 제목 self.textfield.text -> 함수로 만들고 viewdidload()에 함수 넣기
    
    //서버에서 따로 보내줄 수 있는지 확인
    func downloadImage() {
        //서버 url 알아오기
//        let url: URL = URL(string: "https://")!
        let url: URL = URL(string: "https://contents.kyobobook.co.kr/sih/fit-in/142x0/pdt/9791190538510.jpg")!
        self.bookCoverImage.sd_setImage(with: url) { (image, Error, cacheType, imageURL) in
            //sd_setimage바로 imageview에 image 들어감
        }
    }
    //서버로 부터 다운로드.
    func downloadTitle() {
//        let param = ["Title": "bookTitle"]
        //param 이 필요한것일까
        guard let url = URL(string: "https://") else {
            return
        }
        AF.request(url, method: .post, encoding: URLEncoding.httpBody, headers: ["Content-Type": "application/x-www-form-urlencoded", "Accept" : "application/json"]).validate().responseJSON (completionHandler:{ (response) in
            print(response)
            //json 결과 파싱
            self.parseJSON(response)
            
        })
        
    }
    func parseJSON(_ response: AFDataResponse<Any>) {
        switch response.result {
        case .success(_):
            //swiftyjson 라이브러리 이용, JSON을 파싱하여 사용
            if let json = try? JSON(data: response.data!){
                let result = json["Title"]["bookTitle"].string
                //json 파일 어떻게 생겼는지 확인.
                self.bookTitleTextView.text.append(result!)
            }
            break
        case .failure(_):
            print("fail", String(describing: response.result))
            break
        }
    }
}
