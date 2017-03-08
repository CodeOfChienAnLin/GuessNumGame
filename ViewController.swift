//
//  ViewController.swift
//  DemoOfLearnGame
//
//  Created by Apple on 08/03/2017.
//  Copyright © 2017 packerapp. All rights reserved.
//  \

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var displayLable: UILabel!
    @IBOutlet weak var guessNumberField: UITextField!
    var answer = Int(arc4random_uniform(100) + 1)
    var maxNum = 100
    var minNum = 1
    var isOver = false
    
    
    @IBAction func makeAGuess(_ sender: UIButton) {
        print("touchButton")
        print("answer = \(answer)")
        
     
        
        
        //enter number
        let inputText = guessNumberField.text!
        print("inputText = \(inputText)")
        
        //clear number
        guessNumberField.text = ""
        
        let inputNumber = Int(inputText)
        print("inputNumber = \(inputNumber)")
        print(inputNumber)
        
        if isOver == false {
            //Playing Game
            if inputNumber == nil{
                //print("no nil")
                displayLable.text = "guess the number bwtween \(minNum) ~ \(maxNum)"
            }else{
                print("get input")
                if inputNumber! > maxNum{
                    print("too large")
                    displayLable.text = "too large,guess the number bwtween \(minNum) ~ \(maxNum)"
                    
                }else if inputNumber! < minNum{
                    print("too small")
                    displayLable.text = "too small,guess the number bwtween \(minNum) ~ \(maxNum)"
                    
                }else{
                    print("check answer \(answer)")
                    if inputNumber! < answer {
                        //if inputNum not more than answer
                        print("minNum = inputNumber!")
                        minNum = inputNumber!
                        //dispaly the number
                        displayLable.text = "guess the number bwtween \(minNum) ~ \(maxNum)"
                    }else if inputNumber! > answer {
                        //if inputNum not less than answer
                        print("manNum = inputNumber!")
                        maxNum = inputNumber!
                        //dispaly the number
                        displayLable.text = "guess the number bwtween \(minNum) ~ \(maxNum)"
                    }else{
                        //Match answer
                        print("Match answer")
                        displayLable.text = "Answer is \(answer). Please press [ guess ] again"
                        isOver = true
                    }
                }
            }
            
        }else {
            //Over Game
            //reset minNum,maxNum,isOver,answer
            minNum = 1
            maxNum = 100
            displayLable.text = "guess the number bwtween \(minNum) ~ \(maxNum)"
            answer = Int(arc4random_uniform(100) + 1)
            isOver = false
            
        }
        
        
        
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        guessNumberField.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

