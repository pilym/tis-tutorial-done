//
//  ViewController.swift
//  AdvancedTts
//
//  Created by Nathan Miles on 2018-02-22.
//  Copyright © 2018 Advanced Text To Speech Tutorial. All rights reserved.
//

import UIKit
import AVFoundation
import TraceLog

class ViewController: UIViewController {
    
    @IBOutlet weak var speakTextView: UITextView!
    @IBOutlet weak var speakButton: UIButton!
    @IBOutlet weak var languagePicker: UIPickerView!
    
    let speechSynthesizer = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        logInfo { "entering \(#function)" }
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        logInfo { "exiting \(#function)" }
    }

    override func didReceiveMemoryWarning() {
        logInfo { "entering \(#function)" }
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        logInfo { "exiting \(#function)" }
    }


    @IBAction func speakText(_ sender: UIButton) {
        logInfo { "entering \(#function)" }
        let utterance = AVSpeechUtterance(string: speakTextView.text)
        
        speechSynthesizer.speak(utterance)
        logInfo { "exiting \(#function)" }
    }
    
    @IBAction func changeTextToArabic(_ sender: Any) {
        logInfo { "entering \(#function)" }
        speakTextView.text = "شركة أبل (Apple Inc.‎) هي شركةٌ أمريكيةٌ متعددةُ الجنسياتِ تعملُ على تصميم وتصنيع الإلكترونيات الاستهلاكية ومنتجات برامج الحاسوب. تشملُ منتجاتُ الشركةِ الأكثرُ شهرةً أجهزة َحواسيب ِماكينتوش، والجهاز الموسيقي آي بود (iPod) والجهاز المحمول آي فون(iPhone)."
        logInfo { "exiting \(#function)" }
    }
    
    @IBAction func ChangeTextToKorean(_ sender: Any) {
        logInfo { "entering \(#function)" }
        speakTextView.text = "애플 주식회사(영어: Apple Inc.)는 미국의 소프트웨어및 컴퓨터 하드웨어를 개발, 제작하는 회사이다. 이전 명칭은 애플 컴퓨터 주식회사(영어: Apple Computer, Inc.)였다."
        logInfo { "exiting \(#function)" }
    }
}

