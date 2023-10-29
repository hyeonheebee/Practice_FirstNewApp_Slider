//
//  ViewController.swift
//  FirstNewApp_Slider
//
//  Created by 심현희 on 2023/10/28.
//

import UIKit
import AVFoundation

// let step: Float = 5

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    
    @IBOutlet weak var slider: UISlider!
    
    // Timer 은 클래스로 선언되어있으므로 인스턴스를 weak 선언
    weak var timer: Timer?
    
    
    // 전체적으로 초에 따른 동작을 컨트롤 하기위한 전역변수
    var number: Int = 0
    
    
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
        number = Int(slider.value * 60)
        // 정수형은 나머지를 버리는 변환을 함
        // let seconds = Int(sender.value * 60) 도 가능한 코드 (파라미터로 sender가 slider 받는 중)
        mainLabel.text = "\(number) 초"
        // 바로 number을 넣는 것으로 클린코딩
        
    }
    
    // 버튼이 tap될때마다 해당 함수가 호출됨
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // 1초씩 지날때마다 무언가를 실행
        // how to run a function after some time in swift
        
        
        /* 다르게 구현하는 방법 method 2
        // target 을 self 로 가르키고 있으므로(여기서 self는 UIViewController의 인스턴스 의미) UIViewController.doSomethingAfter1Second의 주소 즉 인스턴스의 메서드 주소를 selector로 받아서(연결해서) 매 초마다 실행하는 효과 (기존 objc 에서 사용하던 기법으로 함수앞에 @objc 필요)
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSomethingAfter1Second), userInfo: nil, repeats: true)
         */
        
        // method 1
        timer?.invalidate()
        // just in case you had existing `Timer`, `invalidate` it before we lose our reference to it
        // 이미 존재하는 타이머가 있을때 비활성화 할 수 있다는 의미
        // 예를들어 스타트 버튼을 두번누를경우 타이머가 중복 생성됨을 방지하는 코드
        
        // 위에서 Timer의 인스턴스 timer를 만들때 weak 으로 선언하여 만들었기 때문에 클로져가 timer를 [self] 로 강하게 가르켜도 강한참조 사이클이 일어나지 않는다
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
            // 반복하고 싶은 행위를 작성
            // 슬라이더가 줄어들고 main label의 내용이 변경됨
            // 마지막에 0이 되면 소리가 나도록 작성
            // 문법 : 클로저 사용시 객체내에서 사용시 self 를 반드시 붙이는 것 혹은 캡쳐리스트에 self 를 넣어주는 것 택 1 가능
            
            if number > 0 {
                number -= 1
                slider.value = Float(number) / 60
                // slider.value 는 0~1 의 값, number 최대 60까지 가능 하므로 number을 60으로 나눈 후 Float 로 변환하여 넣기
                mainLabel.text = "\(number) 초"
                
            } else {
                number = 0
                mainLabel.text = "초를 선택하세요"
                
                // 소리를 나게 해야함
                AudioServicesPlayAlertSound(SystemSoundID(1322))
                
                // 타이머를 멈춰야함
                timer?.invalidate()
                
            }
            // 클로저 내에서의 내용작성
        }
        
    }
    
    /* method 2 로 구현할때
    @objc func doSomethingAfter1Second() {
        if number > 0 {
            number -= 1
            slider.value = Float(number) / 60
            mainLabel.text = "\(number) 초"
        } else {
            number = 0
            mainLabel.text = "초를 선택하세요"
            AudioServicesPlayAlertSound(SystemSoundID(1322))
            timer?.invalidate()
        }
    }
     */
    
    
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
        timer?.invalidate()
        
        // 내가 잊을뻔 했던 조건
        number = 0
    }
    
}

