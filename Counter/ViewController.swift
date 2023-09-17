
// Не придумал, как сделать каждое сообщение своего цвета, поэтому меняется весь лог
// Точнее, можно просто в список добавлять строчки, но требуется TextView...

import UIKit

class ViewController: UIViewController {
    enum Message: String {
        case increase = "value has been changed by +1\n"
        case decrease = "value has been changed by -1\n"
        case decreaseBelowZero = "tryed to change value below 0\n"
        case reset = "value has been reset\n"
    }
    
    private var counterValue: Int = 0
    private var counterLog: String = ""

    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var increaseBtn: UIButton!
    @IBOutlet weak var decreaseBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var changelog: UITextView!
    
    @IBAction func tapIncreaseBtn(_ sender: Any) {
        addMessageWithDate(message: .increase)
        counterValue += 1
        changeCounterColor()
        counter.text = "\(counterValue)"
        changelog.text = "\(counterLog)"
        changelog.textColor = UIColor.green
    }
    
    @IBAction func tapDecreaseBtn(_ sender: Any) {
        if (counterValue == 0) {
            addMessageWithDate(message: .decreaseBelowZero)
            changelog.text = "\(counterLog)"
            changelog.textColor = UIColor.red
            return;
        }
        addMessageWithDate(message: .decrease)
        counterValue -= 1
        changeCounterColor()
        counter.text = "\(counterValue)"
        changelog.text = "\(counterLog)"
        changelog.textColor = UIColor.red
    }

    @IBAction func tapResetBtn(_ sender: Any) {
        addMessageWithDate(message: .reset)
        counterValue = 0
        changeCounterColor()
        counter.text = "\(counterValue)"
        changelog.text = "\(counterLog)"
        changelog.textColor = UIColor.gray
    }
    
    func changeCounterColor() {
        if (counterValue > 0) {
            counter.textColor = UIColor.green
        } else {
            counter.textColor = UIColor.white
        }
    }
        
    func addMessageWithDate(message: Message) {
        var date = Date()
        
        counterLog += formatDate(date: date) + " " + message.rawValue
    }
    
    func formatDate(date: Date) -> String {
        var dateFormatter = DateFormatter();
        dateFormatter.dateFormat = "dd.MM HH:mm:ss"
        
        return dateFormatter.string(from: date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

