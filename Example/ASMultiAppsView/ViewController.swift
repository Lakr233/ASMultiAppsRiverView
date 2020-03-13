import UIKit
import ASMultiAppsView

class ViewController: UIViewController {
    
    lazy private var multiAppView: ASMultiAppsView = {
        let multiAppView = ASMultiAppsView()
        let image_container: [UIImage]   = [UIImage(named: "0")!,
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "3")!,
        UIImage(named: "4")!]
        multiAppView.apart_init(images: image_container)
        multiAppView.backgroundColor = .white
        multiAppView.setRadius()
        multiAppView.dropShadow()
        return multiAppView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(multiAppView)
        multiAppView.snp.makeConstraints { (x) in
            x.center.equalTo(self.view.snp.center)
            x.height.equalTo(multiAppView.bounds.height)
            x.width.equalTo(multiAppView.bounds.width)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    


}

extension UIView {

    func setRadius(how_much: CGFloat = 8) {
        self.layer.cornerRadius = how_much;
        self.layer.masksToBounds = true;
    }

    func dropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 8, height: 8)
        self.layer.shadowRadius = 8
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}
