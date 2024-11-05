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
    
    private var count: Int = .zero
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "ru_Ru")
        return formatter
    }()
    
    private var date = Date()
    
    private lazy var currentDay: String = {
        return dateFormatter.string(from: date)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoCountLabel.text = "0"
        infoHistoryTextView.text = "История изменений:\n\n"
        infoHistoryTextView.isScrollEnabled = true
        infoHistoryTextView.isEditable = false
    }
    
    // MARK: - functions
    
    private func clear(){
        count = .zero
        infoCountLabel.text = "Значение счетчика: \(count)"
        updateHistory(message: "значение сброшено")
    }
    
    private func controlNegativeNumbers(){
        if count != .zero {
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
    
    @IBAction private func minusCountButton(_ sender: Any) {
        controlNegativeNumbers()
    }
    
    @IBAction private func plusCountButton(_ sender: Any) {
        count += 1
        infoCountLabel.text = "Значение счетчика: \(count)"
        updateHistory(message: "значение изменено на +1")
    }
    
    @IBAction private func clearButton(_ sender: Any) {
        clear()
    }
    
}

