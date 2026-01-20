//
//  ViewController.swift
//  test
//
//  Created by Mark Vadimov on 19.01.26.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var resultLabel: UILabel!
    
    @IBOutlet private weak var historyOfChangeLabel: UITextView!
    
    @IBOutlet private weak var minusButton: UIButton!
    
    @IBOutlet private weak var plusButton: UIButton!
    
    @IBOutlet private weak var trashButton: UIButton!
    
    private var count = 0
    private var history: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.layer.cornerRadius = 50
        resultLabel.clipsToBounds = true
        historyOfChangeLabel.text = "История изменений: "
    }
    
    private func dateOfChange() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM HH:mm:ss"
        return formatter.string(from: Date())
    }
    
    private func addChangeToHistory(type: Int) {
        let positionInHistory = history.count + 1
        let date = dateOfChange()
        
        switch type {
        case 0:
            history.append("\(positionInHistory). \(date) значение сброшено")
        case 1:
            history.append("\(positionInHistory). \(date) значение изменено на +1")
        case -1:
            history.append("\(positionInHistory). \(date) значение изменено на -1")
        case -2:
            history.append("\(positionInHistory). \(date) попытка уменьшить значение ниже 0")
        default:
            break
        }
        writeResult()
    }
    
    private func writeResult() {
        resultLabel.text = String(count)
        historyOfChangeLabel.text = history.joined(separator: "\n")
    }
    
    @IBAction private func subtractOne(_ sender: Any) {
        if count > 0 {
            count -= 1
            writeResult()
            addChangeToHistory(type: -1)
        } else {
            addChangeToHistory(type: -2)
        }
    }
    
    
    @IBAction private func addOne(_ sender: Any) {
        count += 1
        writeResult()
        addChangeToHistory(type: 1)
    }
    
    
    @IBAction private func trashResult(_ sender: Any) {
        count = 0
        writeResult()
        addChangeToHistory(type: 0)
    }
}

