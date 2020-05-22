import UIKit

class CheckInVCA: UIViewController {
    
    
    //MARK: - Items for container
    let imageContainer: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "washingMachine"))
        image.sizeThatFits(CGSize(width: 50, height: 50))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let textContainer: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Cuci Baju", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 36, weight: .heavy)])
        
        attributedText.append(NSAttributedString(string: "\n\nBaju yang Anda kenakan memiliki tingkat kontaminasi tinggi tercemar virus, kami menyarankan Anda untuk segera mencucinya.", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .regular)]))
        
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .none
        textView.textColor = .white
        return textView
    }()
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 35/255, green: 79/255, blue: 114/255, alpha: 1)
        
        containerLayout()
        
    }
    
    //MARK: - Functions
    func containerLayout() {
        let containerView = UIView()
        view.addSubview(containerView)
        containerView.addSubview(imageContainer)
        containerView.addSubview(textContainer)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        textContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            
            imageContainer.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -30),
            imageContainer.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageContainer.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.3),
            //imageContainer.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 150),
            
            textContainer.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            textContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            textContainer.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            textContainer.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
        ])
    }
    
    
}

