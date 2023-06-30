//
//  ViewController.swift
//  LetterCruncher
//
//  Created by Grant Yap on 9/20/20.
//  Copyright © 2020 Grant Yap. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var LabelText: UILabel!
    @IBOutlet weak var ExampleText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.ExampleText.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""

        guard let stringRange = Range(range, in: currentText) else { return false }

        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

        let allowedCharacters = CharacterSet.letters
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet) && updatedText.count < 8
    }

    @IBAction func TextChanger(_ sender: UITextField) {
        if let newText = sender.text, !newText.isEmpty {
            LabelText.text = makeDigitsString(inputString: newText)
        } else {
            LabelText.text = ""
        }
    }
    
    func makeDigitsString(inputString: String) -> String {
        var outputString = ""
        for chr in inputString {
            if (chr >= "A" && chr <= "C"){
                outputString.append("2")
            } else if (chr >= "D" && chr <= "F"){
                outputString.append("3")
            } else if (chr >= "G" && chr <= "I"){
                outputString.append("4")
            } else if (chr >= "J" && chr <= "L"){
                outputString.append("5")
            } else if (chr >= "M" && chr <= "O"){
                outputString.append("6")
            } else if (chr >= "P" && chr <= "S"){
                outputString.append("7")
            } else if (chr >= "T" && chr <= "V"){
                outputString.append("8")
            } else if (chr >= "W" && chr <= "Z"){
                outputString.append("9")
            }
        }
        return outputString
    }
    
}

