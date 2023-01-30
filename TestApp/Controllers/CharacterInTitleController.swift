//
//  CharacterInTitleController.swift
//  TestApp
//
//   Created by Ihor Zaliskyj on 21.11.2022.
//

import UIKit

class CharacterInTitleController: UIViewController {
    
    var viewModel : CharacterInTitleDelegate!
    
    var textView : UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    init(titles: [String]){
        super.init(nibName: nil, bundle: nil)
        viewModel = CharacterInTitleViewModel(movieTitles: titles)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = viewModel.title
        setupInfoTextView()
    }
    
    func setupInfoTextView(){
        view.addSubview(textView)
        textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        textView.text = viewModel.infoText
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        textView.setContentOffset(.zero, animated: false)
    }
}
