import UIKit
import CoreData

class CheckOutVC: UIViewController {
    
    var checkPoint = [CheckPoint]()
    
    let context = AppDelegate.viewContext
        
    //MARK: - Item for top container
    let imageTop: UIImageView = {
        let mainImageTop = UIImageView(image: #imageLiteral(resourceName: "CheckInImageTop"))
        mainImageTop.sizeThatFits(CGSize(width: 50, height: 50))
        mainImageTop.contentMode = .scaleAspectFit
        return mainImageTop
    }()
    
    //MARK: - Item for bottom container
    let containerText: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Harap pastikan Anda mengenakan masker, selalu mencuci tangan, dan tetap menjaga jarak.", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 32)])
        
        attributedText.append(NSAttributedString(string: "\n\n\nKami sangat menyarankan Anda agar tetap berada di rumah untuk membantu pencegahan penyebaran virus Covid-19.", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .regular)]))
        
        textView.attributedText = attributedText
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .none
        return textView
    }()
    
    let buttonCheckOut: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Keluar Rumah", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.init(red: 85/255, green: 138/255, blue: 232/255, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonTapped(sender: UIButton) {
        let alert = UIAlertController(title: "Perhatian", message: "Kami menyarankan Anda untuk tetap berada di rumah untuk mencegah penyebaran virus, yakin tetap ingin keluar rumah?", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Iya", style: .default, handler: { action in
            
            self.newEntry()
            print("user has successfully checked out")
//            print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
            
            let alertConfirmation = UIAlertController(title: "Terima Kasih", message: "Anda telah berhasil melaporkan status Anda. Harap tetap menjaga jarak.", preferredStyle: .alert)
            alertConfirmation.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
//                self.performSegue(withIdentifier: "toCheckInVC", sender: self)
                self.navigationController?.navigationBar.isHidden = true
                self.navigationController?.show(CheckInVC(), sender: self)
//                let vc = CheckInVC()
//                self.navigationController?.pushViewController(vc, animated: true)
            }))
            self.present(alertConfirmation, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Tidak", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }

    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        topContainerLayout()
        bottomContainerLayout()
    }
    
    //MARK: - Functions
    
    //Top Container
    func topContainerLayout() {
        let containerView = UIView()
//        containerView.backgroundColor = .gray
        view.addSubview(containerView)
        containerView.addSubview(imageTop)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageTop.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5),

            imageTop.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageTop.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 20),
            imageTop.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.7)
        ])
    }
    
    //Bottom Container
    func bottomContainerLayout() {
        let containerView = UIView()
//        containerView.backgroundColor = .yellow
        view.addSubview(containerView)
        containerView.addSubview(containerText)
        containerView.addSubview(buttonCheckOut)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerText.translatesAutoresizingMaskIntoConstraints = false
        buttonCheckOut.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            containerText.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            containerText.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            containerText.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            containerText.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
            buttonCheckOut.heightAnchor.constraint(equalToConstant: 50),
            buttonCheckOut.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            buttonCheckOut.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            buttonCheckOut.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
        ])
    }
    
    func newEntry() {
        let newEntry = CheckPoint(context: context)
        newEntry.id_warga = "Warga A"
        newEntry.isCheckOut = true
        saveEntry()
    }
    
    func saveEntry() {
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
    }
    
    func fetch() {
        let request: NSFetchRequest<CheckPoint> = CheckPoint.fetchRequest()
        do {
        checkPoint = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }
    }
    
    func isCheckOut() {
        fetch()
        let statusWarga = CheckPoint(context: AppDelegate.viewContext)
        if statusWarga.isCheckOut == true {
            self.navigationController?.show(CheckInVC(), sender: self)
        }
    }
    
    func deleteData(viewContext: NSManagedObjectContext = AppDelegate.viewContext) {
        fetch()
        
    }
}
