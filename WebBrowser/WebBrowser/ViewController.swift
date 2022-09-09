//
//  ViewController.swift
//  WebBrowser
//
//  Created by Osaretin Uyigue on 9/9/22.
//

import UIKit

class ViewController: UIViewController {

    
    //MARK: - View's lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .zircon
        configureNavBar()
    }
    
    
    
    //MARK: - Properties
    fileprivate lazy var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.placeholder = "Search or enter website"
        return sb
    }()
    
    
    
    //MARK: - Handlers
    fileprivate func setUpViews() {
        
    }
    
    
    fileprivate func configureNavBar() {
        navigationItem.titleView = searchBar
        changeNavBarBackgroundColor()
        setUpBottomToolbar()

    }
    
    
    fileprivate func setUpBottomToolbar() {
        let forward = UIBarButtonItem(barButtonSystemItem: .fastForward, target: self, action: nil)
        let backward = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: nil)
        let close = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: nil)

        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolbarItems = [backward, forward, spacer, refresh, close]
        navigationController?.setToolbarHidden(false, animated: false)
    }
    
    
    fileprivate func changeNavBarBackgroundColor() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "WebBrowser"

        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        
        let toolBarAppearance = UIToolbarAppearance()
        toolBarAppearance.backgroundColor = .white
        navigationController?.toolbar.tintColor = .black
        navigationController?.toolbar.standardAppearance = toolBarAppearance
        navigationController?.toolbar.compactAppearance = toolBarAppearance
        navigationController?.toolbar.scrollEdgeAppearance = toolBarAppearance

        
    }

}



extension UIColor {
  static let zircon = UIColor(named: "Zircon")!
}


