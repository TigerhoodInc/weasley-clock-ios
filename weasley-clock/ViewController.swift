import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    
    var clockView: ClockView!
    var clockHand: UIView!
    var hour: CGFloat = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
//        clockView = ClockView(frame: view.frame)
//        view.addSubview(clockView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        clockView.changeTime(hand: MyClockHand(), hour: hour)
        hour += 1
    }
    
    @IBAction func signupPressed(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailField.text!, password: "password") { (result, error) in
            logger.warning("dani gay")
            logger.debug(result)
            logger.error(error)
        }
    }
}

struct MyClockHand: ClockHand {
    var tag = 1
}
