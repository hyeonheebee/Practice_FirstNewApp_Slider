//
//  ViewController.swift
//  FirstNewApp_Slider
//
//  Created by 심현희 on 2023/10/28.
//

import UIKit

// let step: Float = 5

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    
    @IBOutlet weak var slider: UISlider!
    
    
    
    // viewDidLoad 함수 위에서는 outlet으로 자동설정 됨(끌어오면)
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        

    }
    
    
    // 일반적으로 viewDidLoad에 들어가야할 내용을 따로 함수로 빼서 정리해줌
    
    func configureUI(){
        mainLabel.text = "초를 선택하세요"
        // 슬라이더의 가운데설정
        slider.setValue(0.5, animated: false)
        
        /* stack over flow 에서 찾아서 변형한 내용
           https://developer.apple.com/documentation/uikit/uislider
           UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
            self.slider.setValue(0.5, animated: true)
        }, completion: nil)
        */
    }

    // 슬라이더 값이 변할때마다 해당 함수가 호출됨
    @IBAction func sliderChanged(_ sender: UISlider) {
        // 슬라이더의 value 값을 가지고 main label의 text를 셋팅
        let seconds = Int(slider.value * 60)
        // 정수형은 나머지를 버리는 변환을 함
        // print(seconds)
        mainLabel.text = "\(seconds) 초"
        

        
    }
    
    // 버튼이 tap될때마다 해당 함수가 호출됨
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // 1초씩 지날때마다 무언가를 실행
        
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 버튼 누를때 초기화 셋팅
        // 메인레이블 초기화
        mainLabel.text = "초를 선택하세요"
        
        
        // 슬라이더의 가운데설정
        
        // 방법1
        // let roundedValue = round(slider.value / step) * step
        // slider.value = roundedValue
        // 중요한 코드는 slider.value 임을 알기
        // slider.value = 0.5
        
        // 방법2
        slider.setValue(0.5, animated: false)
        
    }
    
}

