import UIKit

class ClockView: UIView {
    
    var clockHand: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addClockHand()
        addCenterMark()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addClockHand()
        addCenterMark()
    }
    
    private func addClockHand() {
        let size = CGSize(width: 100, height: 5)
        let origin = CGPoint(x: center.x, y: center.y - size.height / 2)
        clockHand = UIView(frame: CGRect(origin: origin, size: size))
        clockHand.backgroundColor = .red
        addSubview(clockHand)
    }
    
    private func addCenterMark() {
        let size = CGSize(width: 5, height: 5)
        let origin = CGPoint(x: center.x - size.width / 2,
                             y: center.y - size.height / 2)
        let centerMark = UIView(frame: CGRect(origin: origin, size: size))
        centerMark.backgroundColor = .blue
        addSubview(centerMark)
    }
    
    func changeTime(hour: CGFloat) {
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
