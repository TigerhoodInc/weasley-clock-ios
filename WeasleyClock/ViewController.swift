import UIKit

class ViewController: UIViewController {
    
    var clockView: ClockView!
    var clockHand: UIView!
    var hour: CGFloat = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        clockView = ClockView(frame: view.frame)
        view.addSubview(clockView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        clockView.changeTime(hour: hour)
        hour += 1
    }
}

