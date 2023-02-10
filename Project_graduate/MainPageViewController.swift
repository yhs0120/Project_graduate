//
//  MainPageViewController.swift
//  Project_graduate
//
//  Created by 윤한솔 on 2023/01/04.
//

import UIKit
import SDWebImage

class MainPageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var searchList_label: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    let images = ["a.jpeg","b.jpeg","c.jpeg","d.jpeg","e.jpeg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //이거 해줘야 label 둥글게 적용 가능
        searchList_label.clipsToBounds = true
//        searchList_label.layer.cornerRadius = 10
//        searchList_label.layer.borderWidth = 2
        
//        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
//        tapGesture.delegate = self
//        self.view.addGestureRecognizer(tapGesture)
        // 클릭 된지 확인하기 위한 태그
        collectionView.tag = 1004
        //클릭 가능하도록 설정
        self.collectionView.isUserInteractionEnabled = true
        //제스쳐 추가
        self.collectionView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewTapped)))
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    @objc func viewTapped(_ sender : UITapGestureRecognizer) {
        print("\(sender.view!.tag) 클릭됨")
        //책 정보 페이지로 넘어가는 함수 만들기.
//        self.navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: true)
    }
    
    //    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
    //            //책 정보 페이지로 넘어가기
    //            self.view.endEditing(true)
    //            return true
    //        }
        
    @IBAction func onBtnCamera(_ sender: UIButton) {
        let newVC = self.storyboard?.instantiateViewController(withIdentifier: "CamViewController") as! CamViewController
        self.navigationController?.pushViewController(newVC, animated: true)
        self.navigationController?.isNavigationBarHidden = true
    }
    //-MARK
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "BookCoverCollectionViewCell", for: indexPath) as! BookCoverCollectionViewCell

        cell.BookCoverImage.image = UIImage(named: images[indexPath.row])
//        let url : URL = URL(string: "https://")!
//        cell.BookCoverImage.sd_setImage(with: url)
        cell.BookCoverImage.layer.cornerRadius = 10
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat(197), height: CGFloat(344))
    }
}
