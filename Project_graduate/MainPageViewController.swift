//
//  MainPageViewController.swift
//  Project_graduate
//
//  Created by 윤한솔 on 2023/01/04.
//

import UIKit

class MainPageViewController: UIViewController {

    @IBOutlet weak var searchList_label: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //이거 해줘야 label 둥글게 적용 가능
        searchList_label.clipsToBounds = true
        searchList_label.layer.cornerRadius = 10
        searchList_label.layer.borderWidth = 2
        
//        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
//        tapGesture.delegate = self
//        self.view.addGestureRecognizer(tapGesture)
        // 클릭 된지 확인하기 위한 태그
        collectionView.tag = 1004
        //클릭 가능하도록 설정
        self.collectionView.isUserInteractionEnabled = true
        //제스쳐 추가
        self.collectionView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewTapped)))
        
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
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "BookCoverCollectionViewCell", for: indexPath) as! BookCoverCollectionViewCell
        //cell.BookCoverimage.image = UIImage(named: )
        //사진이름 어떻게 설정할 지 ...
        return cell
    }
}
