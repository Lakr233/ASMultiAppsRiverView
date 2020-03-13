import UIKit
import ASMultiAppsView

class ViewController: UIViewController {
    
    lazy private var multiAppView: ASMultiAppsView = {
        let multiAppView = ASMultiAppsView(with: ASMultiAppsView.ASMultiAppsViewConfig())
        let imgSets: [UIImage]   = [UIImage(named: "0")!,
                                    UIImage(named: "1")!,
                                    UIImage(named: "2")!,
                                    UIImage(named: "3")!,
                                    UIImage(named: "4")!]
        multiAppView.setImages(images: imgSets)
        multiAppView.backgroundColor = .white
        return multiAppView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(multiAppView)
        multiAppView.snp.makeConstraints { (x) in
            x.center.equalTo(self.view.snp.center)
            x.height.equalTo(multiAppView.getConfig().cardHeight)
            x.width.equalTo(multiAppView.getConfig().cardWidth)
        }
        multiAppView.setRadius()
        multiAppView.dropShadow()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

}

extension UIView {

    func setRadius(how_much: CGFloat = 8) {
        self.layer.cornerRadius = how_much;
    }

    func dropShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 8, height: 8)
        self.layer.shadowRadius = 8
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}
