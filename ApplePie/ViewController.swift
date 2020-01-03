//
//  ViewController.swift
//  ApplePie
//
//  Created by 🧔🏻Alikhan Batchaev on 03.01.2020.
//  Copyright © 2020 Alikhan Batchaev. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var listOfWords = ["собака", "кошка", "медведь", "попугай", "лошадь"]
    let incorrectMovesAlowed = 7
    
    var totalWins = 0
    var totalLosses = 0
    
    
    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        
        // Do any additional setup after loading the view.
    }
    
    var currentGame: Game!
    
    
    // Functions
    
    func newRound() {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAlowed, guessedLetters: [])
        updateUI()
    }
    
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Побед: \(totalWins),  Проигрышей: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateUI()
    }
    
    
}

