//
//  ViewController.swift
//  AdvancedTts
//
//  Created by me 5 minutes before this presentation
//  Text is taken from the Wikipedia page for Apple Inc. in multiple languages and is copyrighted by all contributors to that page on Wikipedia, including bots. All copyright infringements intended blah blah blah
//

import UIKit
import AVFoundation
import TraceLog

class ViewController: UIViewController {
    
    @IBOutlet weak var speakTextView: UITextView!
    @IBOutlet weak var speakButton: UIButton!
    @IBOutlet weak var languagePicker: UIPickerView!
    
    @IBOutlet weak var langLabel: UILabel!
    
    let speechSynthesizer = AVSpeechSynthesizer()
    
    // 3. language code of the text
    var voiceLangCode = "en-US" {
        // 5. update ui
        didSet {
            langLabel.text = "Speaking \(String(describing: Locale.current.localizedString(forIdentifier: voiceLangCode)!))"
        }
    }
    
    var languages: [Dictionary<String, String?>] = []
    
    
    
    override func viewDidLoad() {
        logInfo { "entering \(#function)" }
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 1. find the supported locales on your iphone
        logInfo { AVSpeechSynthesisVoice.speechVoices().description }
        
        // 2. save the languages needed in a list
        for voice in AVSpeechSynthesisVoice.speechVoices() {
            if (voice.language == "ar-SA" || voice.language == "ko-KR" || voice.language == "tr-TR")
            {
                let name = Locale.current.localizedString(forRegionCode: voice.language)
                let dictionary = ["name": name, "code": voice.language]
                languages.append(dictionary)
            }
        }
        
        

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
        
        // 4. setup language and voice used for utterance
        let voice = AVSpeechSynthesisVoice(language: voiceLangCode)
        let utterance = AVSpeechUtterance(string: speakTextView.text)
        utterance.voice = voice
        
        speechSynthesizer.speak(utterance)
        logInfo { "exiting \(#function)" }
    }
    
    @IBAction func changeTextToArabic(_ sender: Any) {
        logInfo { "entering \(#function)" }
        voiceLangCode = "ar-SA"
        speakTextView.text = "شركة أبل (Apple Inc.‎) هي شركةٌ أمريكيةٌ متعددةُ الجنسياتِ تعملُ على تصميم وتصنيع الإلكترونيات الاستهلاكية ومنتجات برامج الحاسوب. تشملُ منتجاتُ الشركةِ الأكثرُ شهرةً أجهزة َحواسيب ِماكينتوش، والجهاز الموسيقي آي بود (iPod) والجهاز المحمول آي فون(iPhone)."
        logInfo { "exiting \(#function)" }
    }
    
    @IBAction func ChangeTextToKorean(_ sender: Any) {
        logInfo { "entering \(#function)" }
        voiceLangCode = "ko-KR"
        speakTextView.text = "애플 주식회사(영어: Apple Inc.)는 미국의 소프트웨어및 컴퓨터 하드웨어를 개발, 제작하는 회사이다. 이전 명칭은 애플 컴퓨터 주식회사(영어: Apple Computer, Inc.)였다."
        logInfo { "exiting \(#function)" }
    }
    
    @IBAction func changeTextToTurkish(_ sender: Any) {
        logInfo { "entering \(#function)" }
        voiceLangCode = "tr-TR"
        speakTextView.text = "Apple Inc. ya da eski adıyla Apple Computer, Inc., merkezi Cupertino'da bulunan; tüketici elektroniği, bilgisayar yazılımı ve kişisel bilgisayar tasarlayan, geliştiren ve satan Amerikan çok uluslu şirkettir."
        logInfo { "exiting \(#function)" }
    }
    
    @IBAction func changeTextToEnglish(_ sender: Any) {
        logInfo { "entering \(#function)" }
        voiceLangCode = "en-US"
        speakTextView.text = "Apple Inc. is an American multinational technology company headquartered in Cupertino, California."
        logInfo { "exiting \(#function)" }
    }
    
    @IBAction func stopSpeech(_ sender: UIButton) {
        speechSynthesizer.stopSpeaking(at: AVSpeechBoundary.word)
    }
}

