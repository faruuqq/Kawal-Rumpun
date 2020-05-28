import UIKit
import CoreData

class CheckOutVC: UIViewController {
    
    let scrollViewContainer: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    var checkPoint = [CheckPoint]()
    
    let context = AppDelegate.viewContext
    
    //MARK: - Items for container
    
    //Image Top
    let imageTop: UIImageView = {
        let mainImageTop = UIImageView(image: #imageLiteral(resourceName: "CheckInImageTop"))
        //        mainImageTop.sizeThatFits(CGSize(width: 50, height: 50))
        mainImageTop.contentMode = .scaleAspectFit
        return mainImageTop
    }()
    
    //Text Container
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
    
    //Button Container
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
            //  print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
            
            let alertConfirmation = UIAlertController(title: "Terima Kasih", message: "Anda telah berhasil melaporkan status Anda. Harap tetap menjaga jarak.", preferredStyle: .alert)
            alertConfirmation.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                
                self.navigationController?.navigationBar.isHidden = true
                self.navigationController?.show(CheckInVC(), sender: self)
                //  self.performSegue(withIdentifier: "toCheckInVC", sender: self)
                //  let vc = CheckInVC()
                //  self.navigationController?.pushViewController(vc, animated: true)
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
        layout()
    }
    
    //MARK: - Functions
    func layout() {
        scrollViewContainer.translatesAutoresizingMaskIntoConstraints = false
        imageTop.translatesAutoresizingMaskIntoConstraints = false
        containerText.translatesAutoresizingMaskIntoConstraints = false
        buttonCheckOut.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollViewContainer)
        
        scrollViewContainer.addSubview(imageTop)
        scrollViewContainer.addSubview(containerText)
        scrollViewContainer.addSubview(buttonCheckOut)
        
        NSLayoutConstraint.activate([
            scrollViewContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollViewContainer.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollViewContainer.topAnchor.constraint(equalTo: view.topAnchor),
            scrollViewContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            containerText.topAnchor.constraint(equalTo: imageTop.bottomAnchor, constant: 30),
            containerText.widthAnchor.constraint(equalTo: scrollViewContainer.widthAnchor, multiplier: 0.9),
            containerText.centerXAnchor.constraint(equalTo: scrollViewContainer.centerXAnchor),
            
            imageTop.centerXAnchor.constraint(equalTo: scrollViewContainer.centerXAnchor),
            imageTop.heightAnchor.constraint(equalToConstant: 241),
            imageTop.widthAnchor.constraint(equalToConstant: 181),
            imageTop.topAnchor.constraint(equalTo: scrollViewContainer.topAnchor, constant: 20),
            
            buttonCheckOut.topAnchor.constraint(equalTo: containerText.bottomAnchor, constant: 40),
            buttonCheckOut.heightAnchor.constraint(equalToConstant: 50),
            buttonCheckOut.bottomAnchor.constraint(equalTo: scrollViewContainer.bottomAnchor, constant: -30),
            buttonCheckOut.centerXAnchor.constraint(equalTo: scrollViewContainer.centerXAnchor),
            buttonCheckOut.widthAnchor.constraint(equalTo: scrollViewContainer.widthAnchor, constant: -30)
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
            print("data saved")
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
