//
//  BNRQuizViewController.swift
//  HypnoNerd
//
//  Created by Donald Steinert on 2/2/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import UIKit

class BNRQuizViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    var currentQuestionIndex: Int
    var questions: [String]
    var answers: [String]
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        currentQuestionIndex = 0
        questions = ["From what is cognac made?", "What is 7+7?", "What is the capital of Vermont?"]
        answers = ["Grapes", "14", "Montpelier"]
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
        tabBarItem.title = "Quiz"
        let image = UIImage(named: "Hypno.png")
        tabBarItem.image = image
    }
    
    // this is required for all UIViewConroller subclasses
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func showQuestion(sender: UIButton) {
        currentQuestionIndex++
        if currentQuestionIndex >= questions.count {
            currentQuestionIndex = 0
        }
        let question = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
    }
    
    @IBAction func showAnswer(sender: UIButton) {
        let answer = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
