import UIKit

class PageCellCheckIn: UICollectionViewCell {
    
    //MARK: - Unwrapped Page
    var page: PageCheckIn? {
        didSet {
            
            guard let unwrappedPage = page else { return }
            
            imageContainer.image = UIImage(named: unwrappedPage.imageName)
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 36, weight: .heavy), NSAttributedString.Key.foregroundColor: UIColor.white])
            
            attributedText.append(NSAttributedString(string: "\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .regular), NSAttributedString.Key.foregroundColor: UIColor.white]))
            
            textContainer.attributedText = attributedText
            textContainer.textAlignment = .center
        }
    }
    
    //MARK: - Item Containers
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
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        containerLayout()
    }
    
    //MARK: - Functions
    func containerLayout() {
        let containerView = UIView()
//        containerView.backgroundColor = .green
        addSubview(containerView)
        containerView.addSubview(imageContainer)
        containerView.addSubview(textContainer)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        textContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            containerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            containerView.heightAnchor.constraint(equalTo: heightAnchor),
            
            imageContainer.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 60),
            imageContainer.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageContainer.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.35),
            
            textContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            textContainer.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            textContainer.topAnchor.constraint(equalTo: imageContainer.bottomAnchor, constant: 50)
        
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
