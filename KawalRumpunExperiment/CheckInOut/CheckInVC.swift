import UIKit
import CoreData

class CheckInVC: UIViewController {
    
    var checkPoint = [CheckPoint]()
    let context = AppDelegate.viewContext
    
    //MARK: - CollectionView Container
    let collectionViewContainer: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .none
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.register(PageCellCheckIn.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    //MARK: - Page Control Container
    let pageControlContainer: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor(white: 255/255, alpha: 0.3)
        pageControl.currentPageIndicatorTintColor = .white
        return pageControl
    }()
    
    //MARK: - Button Container
    let buttonContainer: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Masuk Rumah", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.init(red: 85/255, green: 138/255, blue: 232/255, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonTapped(sender: UIButton) {
        newEntry()
        print("user has successfully checked in")
        let alert = UIAlertController(title: "Terima Kasih.", message: "Anda telah berhasil melaporkan status Anda. Harap tetap menjaga jarak.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            //                    self.performSegue(withIdentifier: "toCheckInVCPageView", sender: self)
            self.navigationController?.navigationBar.isHidden = true
            self.navigationController?.show(CheckOutVC(), sender: self)
            //                let vc = CheckInVC()
            //                self.navigationController?.pushViewController(vc, animated: true)
        }))
        self.present(alert, animated: true)
    }
    
    //MARK: - Arrays
    let pages = [
        PageCheckIn(imageName: "washingMachine", headerText: "Cuci Baju", bodyText: "Baju yang Anda kenakan memiliki tingkat kontaminasi tinggi tercemar virus, kami menyarankan Anda untuk segera mencucinya."),
        PageCheckIn(imageName: "shower", headerText: "Mandi", bodyText: "Virus dapat dengan segera dihilangkan dengan sabun, kami sarankan Anda untuk segera mandi agar tetap bersih dari virus.")
    ]
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 35/255, green: 79/255, blue: 114/255, alpha: 1)
        navigationController?.navigationBar.isHidden = true
        
        collectionViewContainer.delegate = self
        collectionViewContainer.dataSource = self
        
        viewLayout()
    }
    
    //MARK: - Functions
    func viewLayout() {
        let containerView = UIView()
        view.addSubview(containerView)
        
        containerView.addSubview(collectionViewContainer)
        
        containerView.addSubview(pageControlContainer)
        pageControlContainer.numberOfPages = pages.count
        
        view.addSubview(buttonContainer)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        collectionViewContainer.translatesAutoresizingMaskIntoConstraints = false
        buttonContainer.translatesAutoresizingMaskIntoConstraints = false
        pageControlContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            
            collectionViewContainer.topAnchor.constraint(equalTo: containerView.topAnchor),
            collectionViewContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            collectionViewContainer.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            collectionViewContainer.heightAnchor.constraint(equalTo: containerView.heightAnchor),
            
            buttonContainer.heightAnchor.constraint(equalToConstant: 50),
            buttonContainer.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 80),
            buttonContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            buttonContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            pageControlContainer.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            pageControlContainer.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 10)
        ])
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControlContainer.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
    }
    
    func newEntry() {
        let newEntry = CheckPoint(context: context)
        newEntry.id_warga = "Warga A"
        newEntry.isCheckOut = false
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
    
}

//MARK: - Extensions
extension CheckInVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PageCellCheckIn
        
        let page = pages[indexPath.item]
        cell.page = page
        return cell
    }
    
}

extension CheckInVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionViewContainer.frame.width, height: collectionViewContainer.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
