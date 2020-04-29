//: [Página anterior](@previous)

import Foundation
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        // Criando a barra de progresso
        let progressView = UIProgressView()
        
        // Adicionando e posicionando a barra de progresso na view
        view.addSubview(progressView)
        progressView.frame = CGRect(x: 85, y: 200, width: 200, height: 0)
        
        // Modificando o valor do progresso
        progressView.progress = 0.50
        
        // Configurando a cor de progress
        progressView.progressTintColor = #colorLiteral(red: 0.3019607843, green: 0.3019607843, blue: 0.3019607843, alpha: 1)
        
        // Criando uma view gradiente e posicionando-a como trackImage
        let gradientView = GradientView(frame: progressView.bounds)
        progressView.trackImage = UIImage(view: gradientView)
        
        // Transformando a coordenada y da barra
        progressView.transform = CGAffineTransform(scaleX: -1.0, y: 5.0)
        
        
        self.view = view
    }
}

//Construindo a classe GradientView
class GradientView: UIView {
    var gradientLayer = CAGradientLayer()
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.colors = [#colorLiteral(red: 0.5450980392, green: 0.9529411765, blue: 0.3490196078, alpha: 1).cgColor, #colorLiteral(red: 1, green: 0.3333333333, blue: 0.3333333333, alpha: 1).cgColor] // definição das cores
        gradientLayer.locations = [0.0, 1.0]
        self.layer.insertSublayer(gradientLayer, at: 0)
        
    }
}

//Extensão que permite criar uma imagem a partir de uma view
public extension UIImage{
    convenience init(view: UIView) {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: (image?.cgImage)!)
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
