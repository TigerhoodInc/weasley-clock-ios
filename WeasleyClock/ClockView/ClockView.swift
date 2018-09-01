import UIKit

class ClockView: UIView {
    
    var centerMark: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    private func sharedInit() {
        addClockHand()
        addCenterMark()
    }
    
    private func addClockHand() {
        let size = CGSize(width: 100, height: 5)
        let origin = CGPoint(x: center.x, y: center.y - size.height / 2)
        let clockHand = UIView(frame: CGRect(origin: origin, size: size))
        clockHand.backgroundColor = .red
        clockHand.tag = 1
        addSubview(clockHand)
    }
    
    private func addCenterMark() {
        let size = CGSize(width: 5, height: 5)
        let origin = CGPoint(x: center.x - size.width / 2,
                             y: center.y - size.height / 2)
        centerMark = UIView(frame: CGRect(origin: origin, size: size))
        centerMark.backgroundColor = .blue
        addSubview(centerMark)
    }
    
    func changeTime(hand: ClockHand, hour: CGFloat) {
        let transform = CGAffineTransform
            .identity
            .translatedBy(x: -50, y: 0)
            .rotated(by: hour / 12.0 * CGFloat.pi * 2.0)
            .translatedBy(x: 50, y: 0)
        UIView.animate(withDuration: 1.0) { [weak self] in
            self?.viewWithTag(hand.tag)?.transform = transform
        }
    }
}

protocol ClockHand {
    var tag: Int { get set }
}
