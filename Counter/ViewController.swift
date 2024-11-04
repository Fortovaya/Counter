//
//  ViewController.swift
//  Counter
//
//  Created by Алина on 04.11.2024.
//

import UIKit

final class ViewController: UIViewController {
    // MARK: - @IBOutlet
    @IBOutlet private weak var infoCountLabel: UILabel!
    @IBOutlet private weak var infoHistoryTextView: UITextView!
    
    // MARK: - variables
    
    private var count = 0
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        formatter.locale = Locale(identifier: "ru_Ru")
        return formatter
    }()
    
    private lazy var date: Date = {
        return Date()
    }()
    
    private lazy var currentDay: String = {
        return dateFormatter.string(from: date)
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        infoCountLabel.text = "0"
        
        infoHistoryTextView.text = "История изменений:\n\n"
        infoHistoryTextView.isScrollEnabled = true
        infoHistoryTextView.isEditable = false
    }

    // MARK: - functions
    
    private func clear(){
        count = 0
        infoCountLabel.text = "0"
        updateHistory(message: "значение сброшено")
    }
    
    private func controlNegativeNumbers(){
        if count != 0 {
            count -= 1
            infoCountLabel.text = "Значение счетчика: \(count)"
            updateHistory(message: "значение изменено на -1")
        } else {
            updateHistory(message: "попытка уменьшить значение счётчика ниже 0") }
    }
    
    private func updateHistory(message: String) {
        let historyEntry = "\(currentDay): \(message)\n"
        infoHistoryTextView.text.append(historyEntry)
    }
    
    // MARK: - @IBAction
    
    @IBAction func minusCountButton(_ sender: Any) {
        controlNegativeNumbers()
    }
    
    
    @IBAction func plusCountButton(_ sender: Any) {
        count += 1
        infoCountLabel.text = "Значение счетчика: \(count)"
        updateHistory(message: "значение изменено на +1")
    }
    
    
    @IBAction func clearButton(_ sender: Any) {
        clear()
    }

    
    
    
}

