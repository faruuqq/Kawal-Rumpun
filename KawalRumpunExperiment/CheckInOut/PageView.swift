import UIKit

class PageView: UIPageViewController {
    
   lazy var orderedVC: [UIViewController] = {
        return [
            self.newVC(viewController: "checkInVCA"),
            self.newVC(viewController: "checkInVCB")
        ]
    }()
    
    let pageControlContainer: UIPageControl = {
        let pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 330, width: UIScreen.main.bounds.width, height: 50))
        return pageControl
    }()
    
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
            let alert = UIAlertController(title: "Terima Kasih.", message: "Anda telah berhasil melaporkan status Anda. Harap tetap menjaga jarak.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                    print("user has successfully checked out")
//                    self.performSegue(withIdentifier: "toCheckInVCPageView", sender: self)
                    self.navigationController?.navigationBar.isHidden = true
                    self.navigationController?.show(CheckOutVC(), sender: self)
    //                let vc = CheckInVC()
    //                self.navigationController?.pushViewController(vc, animated: true)
                }))
                self.present(alert, animated: true)
            }
    
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        if let firstViewController = orderedVC.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        configurePageControl()
        buttonContainerLayout()
    }
        
    required init?(coder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }
    
    //MARK: - Functions
    func newVC(viewController: String) -> UIViewController {
        return UIStoryboard(name: "CheckInOutSB", bundle: nil).instantiateViewController(identifier: viewController)
    }
    
    func configurePageControl() {
        view.addSubview(pageControlContainer)
        pageControlContainer.numberOfPages = orderedVC.count
        pageControlContainer.currentPage = 0
        pageControlContainer.pageIndicatorTintColor = UIColor(white: 255/255, alpha: 0.3)
        pageControlContainer.currentPageIndicatorTintColor = .white
        
    }
    
    func buttonContainerLayout() {
        view.addSubview(buttonContainer)
        buttonContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        buttonContainer.heightAnchor.constraint(equalToConstant: 50),
        buttonContainer.bottomAnchor.constraint(equalTo: pageControlContainer.bottomAnchor, constant: 50),
        buttonContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        buttonContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
    }
}
    

    //MARK: - Extentions
extension PageView: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedVC.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            //uncomment code below to make it unlimited swipe, and comment out the return nil
//            return orderedVC.last
            return nil
        }
        
        guard orderedVC.count > previousIndex else {
            return nil
        }
        
        return orderedVC[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedVC.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard orderedVC.count != nextIndex else {
            //uncomment code below to make it unlimited swipe, and comment out the return nil
//            return orderedVC.first
            return nil
        }
        
        guard orderedVC.count > nextIndex else {
            return nil
        }
        
        return orderedVC[nextIndex]
    }
    
    
}

extension PageView: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControlContainer.currentPage = orderedVC.firstIndex(of: pageContentViewController)!
    }
}

