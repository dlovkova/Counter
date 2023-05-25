//
//  ViewController.swift
//  Counter
//
//  Created by Daria Lovkova on 23.05.2023.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var history: UITextView!
    
    
    
    
    var count: Int = 0
    var historyText:[String] = []
    var historyDate:[String] = []
    
    func currentTime()  {
        let date = Date()
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MMM-dd HH:mm:ss"
        let dateString = dateFormatter.string(from: date)
        historyDate.append(dateString)
    }
    
    
    func updateHistory() {
        history.text = "History of changes: \n"
        for i in 0..<historyText.count {
            history.text += "\(String(historyDate[i])) : \(String(historyText[i])) \n"
        }
    }
    
    
    
    @IBAction func minusOne(_ sender: UIButton) {
        count -= 1
        
        if count > 0 {
            counter.text = String(count)
        } else {
            count = 0
            counter.text = String(count)
        }
        
        historyText.append("Removed: \(counter.text!)")
       
        currentTime()
        updateHistory()
        
    }
    
    @IBAction func plusOne(_ sender: UIButton) {
        count += 1
        counter.text = String(count)
        historyText.append("Added: \(counter.text!)")
        currentTime()
        updateHistory()

    }
    
    
    @IBAction func reset(_ sender: UIButton) {
        count = 0
        counter.text = String(count)
        historyText.append("Reset: \(counter.text!)")
        currentTime()
        updateHistory()
    }
   
}

