//
//  PlayVC.swift
//  Plants
//
//  Created by Saska Rauhala on 21.4.2017.
//  Copyright © 2017 SarTekh. All rights reserved.
//

import UIKit

class PlayVC: UIViewController {
    @IBOutlet weak var option1Btn: UIButton!
    @IBOutlet weak var option2Btn: UIButton!
    @IBOutlet weak var option3Btn: UIButton!
    @IBOutlet weak var infoDetail: UILabel!
    @IBOutlet weak var infoTitle: UILabel!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var pointsLbl: UILabel!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var timerLabel: UILabel!
    
    var images = [UIImage]()
    var answers = [String]()
    
    var seconds = 0
    var timer = Timer()
    
    var playList = [Int]()
    
    var count: Int = 0
    var index = 0
    
    var joices = [Int]()
    
    var rightAnswer: String!
    var rightAnswerInt: Int!
    
    var category: String!
    
    var points = 0
    
    var isTimerPaused = false
    
    var rightAnswers = 0
    var wrongAnswers = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       pointsLbl.text = "Points: 0"
        if category == "Sammalet ja jäkälät" {
        
        images = [#imageLiteral(resourceName: "kerrossammal"), #imageLiteral(resourceName: "harmaaporonjäkälä"), #imageLiteral(resourceName: "palleroporonjäkälä"), #imageLiteral(resourceName: "karhunsammal"), #imageLiteral(resourceName: "kynsisammal"), #imageLiteral(resourceName: "rahkasammal"), #imageLiteral(resourceName: "seinäsammal"), #imageLiteral(resourceName: "hirvenjäkälä"), #imageLiteral(resourceName: "torvijäkälä")]
        answers = ["kerrossammal", "harmaaporonjäkälä", "palleroporonjäkälä", "karhunsammal", "kynsisammal", "rahkasammal", "seinäsammal", "hirvenjäkälä", "torvijäkälä"]
        
            seconds = 100
        
        } else if category == "Kasvit" {
            
            images = [#imageLiteral(resourceName: "vaahtera"), #imageLiteral(resourceName: "tammi"), #imageLiteral(resourceName: "metsalehmus"), #imageLiteral(resourceName: "pihlaja"), #imageLiteral(resourceName: "kuusi"), #imageLiteral(resourceName: "mänty"), #imageLiteral(resourceName: "hieskoivu"), #imageLiteral(resourceName: "rauduskoivu"), #imageLiteral(resourceName: "tervaleppä"), #imageLiteral(resourceName: "harmaaleppä"), #imageLiteral(resourceName: "haapa"), #imageLiteral(resourceName: "tuomi"), #imageLiteral(resourceName: "kataja"), #imageLiteral(resourceName: "pähkinäpensas"), #imageLiteral(resourceName: "puolukka"), #imageLiteral(resourceName: "mustikka"), #imageLiteral(resourceName: "kanerva"), #imageLiteral(resourceName: "variksenmarja"), #imageLiteral(resourceName: "riidenlieko"), #imageLiteral(resourceName: "sinivuokko"), #imageLiteral(resourceName: "valkovuokko"), #imageLiteral(resourceName: "kielo"), #imageLiteral(resourceName: "metsämansikka"), #imageLiteral(resourceName: "käenkaali"), #imageLiteral(resourceName: "metsätähti"), #imageLiteral(resourceName: "maitohorsma"), #imageLiteral(resourceName: "kultapiisku"), #imageLiteral(resourceName: "kangasmaitikka"), #imageLiteral(resourceName: "oravanmarja"), #imageLiteral(resourceName: "sudenmarja"), #imageLiteral(resourceName: "metsäkorte"), #imageLiteral(resourceName: "kallioimarre"), #imageLiteral(resourceName: "metsäimarre"), #imageLiteral(resourceName: "kotkansiipi"), #imageLiteral(resourceName: "sananjalka")]
            
            answers = ["vaahtera", "tammi", "metsälehmus", "pihlaja", "kuusi", "mänty", "hieskoivu", "rauduskoivu", "tervaleppä", "harmaaleppä", "Haapa", "tuomi", "kataja", "pähkinäpensas", "puolukka", "mustikka", "kanerva", "variksenmarja", "riidenlieko", "sinivuokko", "valkovuokko", "kielo", "metsämansikka", "käenkaali", "metsätähti", "maitohorsma", "kultapiisku", "kangasmaitikka", "oravanmarja", "sudenmarja", "metsäkorte", "kallioimarre", "metsäimarre", "kotkansiipi", "sananjalka" ]
        seconds = 200
        
        }
        
        startPlay()
        
        if seconds == 0 {
            timer.invalidate()
        }
   
    }
    func runTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(PlayVC.updateTimer), userInfo: nil, repeats: true)
    
    }
    
    func updateTimer() {
        seconds -= 1
        timerLabel.text = "\(seconds)"
        
        if seconds == 0 {
            timer.invalidate()
            print("You loose game")
        }
    }
    
    func generateRandom() {
        
            rightAnswer = answers[playList[index]]
            rightAnswerInt = playList[index]
            print("Index: " + String(playList[index]))
            image.image = images[playList[index]]
        
            var ranIndex = arc4random_uniform(3)
        
            var x = 0
        
            repeat {
            
            let randomNum = arc4random_uniform(UInt32(answers.count))
                
                if joices.contains(Int(randomNum)) {
                
                } else {
                joices.append(Int(randomNum))
                x += 1
                }
            
            } while x < 4
        
            if joices.contains(playList[index]) {
            
            } else {
                joices[Int(ranIndex)] = playList[index]
            }
        
            print("Joices: " + String(describing: joices))
        
            print("Right answer: " + rightAnswer)
    
            btn1.setTitle(answers[joices[0]], for: .normal)
            btn2.setTitle(answers[joices[1]], for: .normal)
            btn3.setTitle(answers[joices[2]], for: .normal)
            btn4.setTitle(answers[joices[3]], for: .normal)
        
    
        
    }
    
    func startPlay() {
        
        infoView.isHidden = true
        
        count = answers.count
        joices = []
        playList = []
        
        
        
        var x = 0
        
        var randomNum = arc4random_uniform(UInt32(answers.count))
        
        repeat {
            
            randomNum = arc4random_uniform(UInt32(answers.count))
            
            if playList.contains(Int(randomNum)) {
                
            } else {
                playList.append(Int(randomNum))
                x += 1
            }
            
        } while x < answers.count
        
        
        print(playList)
        
        runTimer()
        generateRandom()
    }
    
    
    @IBAction func btn1Pressed(_ sender: UIButton) {
        
        if joices[0] == rightAnswerInt {
            if index + 1 == count {
                timer.invalidate()
            } else {
                rightAnswers += 1
                points += 1
                pointsLbl.text = "Points: \(points)"
                joices = []
                index += 1
                generateRandom()
                btn1.setTitleColor(.blue, for: .normal)
                btn2.setTitleColor(.blue, for: .normal)
                btn3.setTitleColor(.blue, for: .normal)
                btn4.setTitleColor(.blue, for: .normal)
            }
            
        } else {
            sender.setTitleColor(.red, for: .normal)
            wrongAnswers += 1
        }
        

    }
    
    @IBAction func btn2Pressed(_ sender: UIButton) {
        if joices[1] == rightAnswerInt {
            if index + 1 == count {
                timer.invalidate()
            } else {
                rightAnswers += 1
                points += 1
                pointsLbl.text = "Points: \(points)"
            joices = []
            index += 1
            generateRandom()
             
                btn1.setTitleColor(.blue, for: .normal)
                btn2.setTitleColor(.blue, for: .normal)
                btn3.setTitleColor(.blue, for: .normal)
                btn4.setTitleColor(.blue, for: .normal)
            }
            
        } else {
            sender.setTitleColor(.red, for: .normal)
             wrongAnswers += 1
        }

        
        
    }
    
    @IBAction func btn3Pressed(_ sender: UIButton) {
        if joices[2] == rightAnswerInt {
            if index + 1 == count {
                timer.invalidate()
            } else {
                rightAnswers += 1
                points += 1
                pointsLbl.text = "Points: \(points)"
                joices = []
                index += 1
                generateRandom()
                btn1.setTitleColor(.blue, for: .normal)
                btn2.setTitleColor(.blue, for: .normal)
                btn3.setTitleColor(.blue, for: .normal)
                btn4.setTitleColor(.blue, for: .normal)
            }
            
        } else {
            sender.setTitleColor(.red, for: .normal)
             wrongAnswers += 1
        }
    }
    
    @IBAction func btn4Presseed(_ sender: UIButton) {
        if joices[3] == rightAnswerInt {
            if index + 1 == count {
                timer.invalidate()
                
                
                
            } else {
                rightAnswers += 1
                points += 1
                pointsLbl.text = "Points: \(points)"
                joices = []
                index += 1
                generateRandom()
                btn1.setTitleColor(.blue, for: .normal)
                btn2.setTitleColor(.blue, for: .normal)
                btn3.setTitleColor(.blue, for: .normal)
                btn4.setTitleColor(.blue, for: .normal)
            }
            
        } else {
            sender.setTitleColor(.red, for: .normal)
             wrongAnswers += 1
        }
    }
    @IBAction func pausePressed(_ sender: Any) {
        
        isTimerPaused = true
        timer.invalidate()
        
        
        
        btn1.isEnabled = false
        btn2.isEnabled = false
        btn3.isEnabled = false
        btn4.isEnabled = false
        
        UIView.animate(withDuration: 0.3, animations: {
        
            self.infoView.isHidden = false
            
        })
        
        infoView.backgroundColor = .lightGray
        infoTitle.text = "Pause"
        infoDetail.text = "Click 'resume' to continue training"
        
        option1Btn.setTitle("Quit", for: .normal)
        
        option2Btn.setTitle("Resume", for: .normal)
        
        option3Btn.setTitle("Restart", for: .normal)
    }
   
    @IBAction func option1Pressed(_ sender: Any) {
        
        if option1Btn.titleLabel?.text == "Quit" {
            
            self.performSegue(withIdentifier: "goHome", sender: category)
            
        }
        
    }

    
    @IBAction func option2Pressed(_ sender: Any) {
        
        if option2Btn.titleLabel?.text == "Resume" {
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(PlayVC.updateTimer), userInfo: nil, repeats: true)
            
            btn1.isEnabled = true
            btn2.isEnabled = true
            btn3.isEnabled = true
            btn4.isEnabled = true
            infoView.isHidden = true
            
            timer.fire()
            
        }
        
    }
    
    @IBAction func option3Pressed(_ sender: Any) {
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? TrainingVC {
            if let category = sender as? String {
                destination.category = category
            }
        }
    }

}
