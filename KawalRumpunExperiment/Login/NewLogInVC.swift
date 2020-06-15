import UIKit

class NewLogInVC: UIViewController {
   
    let scrollViewContainer: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        return scrollView
        
    }()
    
    let textContainer: UITextView = {
        let text = UITextView()
        let attributedText = NSMutableAttributedString(string: "Kawal Rumpun", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 32, weight: .heavy)])
        
        attributedText.append(NSAttributedString(string: "\n\nJaga dan kontrol lingkungan anda agar terhindar dari bahaya pandemik Covid-19.", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .medium)]))
        
        text.attributedText = attributedText
        text.isScrollEnabled = false
        text.isEditable = false
        text.textAlignment = .center
        text.backgroundColor = .clear
        return text
    }()
    
    let imageContainer: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "login-pict")
        image.sizeThatFits(CGSize(width: 20, height: 20))
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .clear
        return image
    }()
    
    let buttonContainer: UIButton = {
        let button = UIButton()
        button.setTitle("Mulai", for: .normal)
        button.backgroundColor = UIColor(red: 35/255, green: 79/255, blue: 114/255, alpha: 1)
        button.layer.cornerRadius = 10
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
    }
    
    func layout() {
        scrollViewContainer.translatesAutoresizingMaskIntoConstraints = false
        textContainer.translatesAutoresizingMaskIntoConstraints = false
        buttonContainer.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollViewContainer)
        scrollViewContainer.addSubview(textContainer)
        scrollViewContainer.addSubview(buttonContainer)
        scrollViewContainer.addSubview(imageContainer)
        
        NSLayoutConstraint.activate([
            scrollViewContainer.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollViewContainer.topAnchor.constraint(equalTo: view.topAnchor),
            scrollViewContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            textContainer.centerYAnchor.constraint(equalTo: scrollViewContainer.centerYAnchor, constant: -150),
            textContainer.widthAnchor.constraint(equalTo: scrollViewContainer.widthAnchor, multiplier: 0.9),
            textContainer.centerXAnchor.constraint(equalTo: scrollViewContainer.centerXAnchor),
            
            buttonContainer.topAnchor.constraint(equalTo: textContainer.bottomAnchor, constant: 20),
            buttonContainer.heightAnchor.constraint(equalToConstant: 50),
            buttonContainer.widthAnchor.constraint(equalTo: scrollViewContainer.widthAnchor, constant: -20),
            buttonContainer.centerXAnchor.constraint(equalTo: scrollViewContainer.centerXAnchor),
            
            imageContainer.topAnchor.constraint(equalTo: buttonContainer.bottomAnchor, constant: 20),
            imageContainer.bottomAnchor.constraint(equalTo: scrollViewContainer.bottomAnchor, constant: 20),
            imageContainer.centerXAnchor.constraint(equalTo: scrollViewContainer.centerXAnchor),
            imageContainer.widthAnchor.constraint(equalTo: scrollViewContainer.widthAnchor),
            imageContainer.heightAnchor.constraint(equalToConstant: 400)
            
        ])
        
    }
    
}


