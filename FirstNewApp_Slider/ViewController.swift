//
//  ViewController.swift
//  FirstNewApp_Slider
//
//  Created by 심현희 on 2023/10/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        

    }
    
    
    // 일반적으로 viewDidLoad에 들어가야할 내용을 따로 함수로 빼서 정리해줌
    
    func configureUI(){
        mainLabel.text = "초를 선택하세요"
    }

    // 슬라이더 값이 변할때마다 해당 함수가 호출됨
    @IBAction func sliderChanged(_ sender: UISlider) {
        
    }
    
    // 버튼이 tap될때마다 해당 함수가 호출됨
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
        
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
    }
    
}

