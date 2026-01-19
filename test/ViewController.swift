//
//  ViewController.swift
//  test
//
//  Created by Mark Vadimov on 19.01.26.
//

import UIKit

final class ViewController: UIViewController {
    private var count = 0
    private var history: [String] = []
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var historyOfChangeLabel: UITextView!
    
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var trashButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.layer.cornerRadius = 50
        resultLabel.clipsToBounds = true
        historyOfChangeLabel.text = "История изменений: "
    }
    
    @IBAction func subtractOne(_ sender: Any) {
        if count > 0 {
            count -= 1
            writeResult()
            addChangeToHistory(type: -1)
        } else {
            addChangeToHistory(type: -2)
        }
    }
    
    
    @IBAction func addOne(_ sender: Any) {
        count += 1
        writeResult()
        addChangeToHistory(type: 1)
    }
    
    
    @IBAction func trashResult(_ sender: Any) {
        count = 0
        writeResult()
        addChangeToHistory(type: 0)
    }
    
    private func dateOfChange() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM HH:MM:SS"
        return formatter.string(from: Date())
    }
    
    func addChangeToHistory(type: Int) {
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
    
    func writeResult() {
        resultLabel.text = String(count)
        historyOfChangeLabel.text = history.joined(separator: "\n")
    }
}

