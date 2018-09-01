import UIKit

class ViewController: UIViewController {
    
    var clockHand: UIView!
    var hour: CGFloat = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        addCenterMark()
        addClockHand()
    }
    
    private func addClockHand() {
        let size = CGSize(width: 100, height: 5)
        let origin = CGPoint(x: view.center.x, y: view.center.y - size.height / 2)
        clockHand = UIView(frame: CGRect(origin: origin, size: size))
        clockHand.backgroundColor = .red
        view.addSubview(clockHand)
    }
    
    private func addCenterMark() {
        let size = CGSize(width: 5, height: 5)
        let origin = CGPoint(x: view.center.x - size.width / 2,
                             y: view.center.y - size.height / 2)
        let centerMark = UIView(frame: CGRect(origin: origin, size: size))
        centerMark.backgroundColor = .blue
        view.addSubview(centerMark)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        animateClockRotation()
        hour += 1
    }
    
    private func animateClockRotation() {
        let transform = CGAffineTransform
            .identity
            .translatedBy(x: -50, y: 0)
            .rotated(by: hour / 12.0 * CGFloat.pi * 2.0)
            .translatedBy(x: 50, y: 0)
        UIView.animate(withDuration: 1.0) { [weak self] in
            self?.clockHand.transform = transform
        }
    }
}

