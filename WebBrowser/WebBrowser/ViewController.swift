//
//  ViewController.swift
//  WebBrowser
//
//  Created by Osaretin Uyigue on 9/9/22.
//

import UIKit
import WebKit
class ViewController: UIViewController {
    
    
    //MARK: - View's lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .zircon
        configureNavBar()
        setUpViews()
        load(urlString: "http://www.google.com")
    }
    
    
    
    //MARK: - Properties
    fileprivate lazy var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.placeholder = "Search or enter website"
        sb.delegate = self
        return sb
    }()
    
    
    fileprivate lazy var webView: WKWebView = {
        let webview = WKWebView()
        webview.navigationDelegate = self
        webview.allowsBackForwardNavigationGestures = true
        return webview
    }()
    
    
    //MARK: - Methods
    fileprivate func setUpViews() {
        view.addSubview(webView)
        webView.frame = view.bounds
    }
    
    fileprivate func configureNavBar() {
        navigationItem.titleView = searchBar
        configureNavBarAppearance()
        configureToolBarAppearance()
        setUpBottomToolbar()
    }
    
    fileprivate func setUpBottomToolbar() {
        let forward = UIBarButtonItem(barButtonSystemItem: .fastForward, target: self, action: #selector(didTapGoForward))
        let backward = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(didTapGoBackward))
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(didTapRefresh))
        let close = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(didTapStopLoading))
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolbarItems = [backward, forward, spacer, refresh, close]
        navigationController?.setToolbarHidden(false, animated: false)
    }
    
    fileprivate func configureNavBarAppearance() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "🌎 WebBrowser"
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    fileprivate func configureToolBarAppearance() {
        let toolBarAppearance = UIToolbarAppearance()
        toolBarAppearance.backgroundColor = .white
        navigationController?.toolbar.tintColor = .black
        navigationController?.toolbar.standardAppearance = toolBarAppearance
        navigationController?.toolbar.compactAppearance = toolBarAppearance
        navigationController?.toolbar.scrollEdgeAppearance = toolBarAppearance
    }
    
    fileprivate func load(urlString: String) {
        guard let url = URL(string: urlString) else {return}
        webView.load(URLRequest(url: url))
    }
    
}



//MARK: - Actions
extension ViewController {
    
    @objc fileprivate func didTapGoForward() {
        guard webView.canGoForward else {return}
        webView.goForward()
    }
    
    @objc fileprivate func didTapGoBackward() {
        guard webView.canGoBack else {return}
        webView.goBack()
    }
    
    
    @objc fileprivate func didTapRefresh() {
        webView.reload()
    }
    
    
    @objc fileprivate func didTapStopLoading() {
        webView.stopLoading()
    }
    
}


//MARK: - WKNavigationDelegate
extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        //
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        //
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
    }
}



//MARK: - UISearchBarDelegate
extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        let urlString = "http://\(searchBar.text ?? "")"
        load(urlString: urlString)
    }
}


extension UIColor {
    static let zircon = UIColor(named: "Zircon")!
}


