//: Playground sobre o funcionamento da class UIProgressView

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .black
        
        // Criando a barra de progresso
        let progressView = UIProgressView()
        
        // Adicionando e posicionando a barra de progresso na view
        view.addSubview(progressView)
        progressView.frame = CGRect(x: 85, y: 200, width: 200, height: 0)
        
        // Modificando o valor do progresso
        progressView.progress = 0.5
        
        // Configurando a cor de progress e de track
        progressView.progressTintColor = UIColor.red
        progressView.trackTintColor = UIColor.blue
        
        // Transformando a coordenada y da barra
        progressView.transform = CGAffineTransform(scaleX: 1.0, y: 15.0)
        
        
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()

//: Para ver o código da barra de progresso com gradiente:
//: [Próxima página](@next)
