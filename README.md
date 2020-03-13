# ASMultiAppsRiverView

App Store like multi-apps river view

[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/Co2333/ASMultiAppsRiverView/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/Co2333/ASMultiAppsRiverView/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/Co2333/ASMultiAppsRiverView/pulls)


![Preview](./main.png)

## How to add it?

    pod 'ASMultiAppsView'

## How to use it?

```
var multiAppView: ASMultiAppsView = {
    let multiAppView = ASMultiAppsView(with: ASMultiAppsViewASMultiAppsViewConfig())
    let imgSets: [UIImage]   = [UIImage(named: "0")!,
                                UIImage(named: "1")!,
                                UIImage(named: "2")!,
                                UIImage(named: "3")!,
                                UIImage(named: "4")!]
    multiAppView.setImages(images: imgSets)
    multiAppView.backgroundColor = .white
    return multiAppView
}()

self.view.addSubview(multiAppView)
multiAppView.snp.makeConstraints { (x) in
    x.center.equalTo(self.view.snp.center)
    x.height.equalTo(multiAppView.getConfig().cardHeight)
    x.width.equalTo(multiAppView.getConfig().cardWidth)
}
multiAppView.setRadius()
multiAppView.dropShadow()
```

## Contributor

- @Lakr233 [https://twitter.com/Lakr233]
- DesGuard [https://github.com/Desgard]