//
//  RainScene.swift
//  iTV Plus
//
//  Created by YASSER FARAHI on 26/01/2022.
//

import SpriteKit
import UIKit

class WeatherScene: SKScene, WeatherSceneInterface   {
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        size = UIScreen.main.bounds.size
        scaleMode = .aspectFill
        backgroundColor = .clear
        anchorPoint = CGPoint(x: 0.5, y: 1.0)
        NotificationCenter.default.addObserver(self, selector: #selector(addSceneNode),
                                               name: kUpdateWeatherSceneNotificationName,
                                               object: nil)
        
    }
    
    @objc private func addSceneNode() {
        let image = UIImage.gradientImage(colors:
                                            kWeatherGradientColor[shouldDetectDayTime()])
        let texture = SKTexture(image: image)
        let gradientNode = SKSpriteNode(texture: texture)
        gradientNode.size = CGSize(width: UIScreen.main.bounds.size.width,
                                   height: UIScreen.main.bounds.size.height * 2)
        addChild(gradientNode)
        guard let rainNode = SKEmitterNode(fileNamed: "\(kWeatherSceneName).sks") else { return }
        addChild(rainNode)
        rainNode.particlePositionRange.dx = UIScreen.main.bounds.width
    }
    
    internal func shouldDetectDayTime() -> Int {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        let hour = formatter.calendar.component(Calendar.Component.hour, from: Date())
        if hour < 18 && hour > 7 {
            return 0
        } else {
            return 1
        }
    }
}

protocol WeatherSceneInterface {
    func shouldDetectDayTime() -> Int
}

//UIImage Extension Builds Gradient Image
extension UIImage {
    
    static func gradientImage(colors: [CGColor]) -> UIImage {
        let gradient = CAGradientLayer()
        gradient.colors = colors
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradient.frame = UIScreen.main.bounds
        UIGraphicsBeginImageContext(gradient.bounds.size)
        gradient.render(in: UIGraphicsGetCurrentContext()!)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {fatalError()}
        UIGraphicsEndImageContext()
        return image
        
    }
 
}
