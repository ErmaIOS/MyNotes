//
//  ViewController.swift
//  MyNotes
//
//  Created by Erma on 21/2/24.
//

import UIKit
import SnapKit
//ARC - automatic reference counting - автоматический подсчет ссылок

// + 1

// - 1

protocol HomeViewProtocol {
    func successNotes(notes: [String])
}
class HomeView: UIViewController, UICollectionViewDelegate {
    
    private var controller: HomeControllerProtocol?
    private var notes:[String] = []
    
    
    private lazy var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.placeholder = "Search"
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Notes"
        view.font = .systemFont(ofSize: 16)
        
        return view
    }()
    
    private lazy var notesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.dataSource = self
        view.register(NoteCell.self, forCellWithReuseIdentifier: NoteCell.reuseId)
        view.delegate = self
        return view
    }()
    
    private lazy var addBtn: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("+", for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 24)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .red
        view.layer.cornerRadius = 21
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigationItem()
        
    }
    
    private func setupUI(){
        view.backgroundColor = .systemBackground
        controller = HomeController(view: self)
        controller?.onGetNotes()
        
        view.addSubview(searchBar)
        view.addSubview(titleLabel)
        view.addSubview(notesCollectionView)
        view.addSubview(addBtn)
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(36)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(22)
            make.leading.equalToSuperview().offset(39)
        }
        
        notesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.bottom.equalToSuperview()
        }
        
        addBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-133)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(42)
        }
        
        
    }
    private func setupNavigationItem() {
        navigationItem.title = "Home"
        let rightBarButtonItem = UIBarButtonItem(image:  UIImage(named: "settingsIcon"), style: .plain, target: self, action: #selector(settingsButtonTapped))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        rightBarButtonItem.tintColor = .black
    }
    
    @objc func settingsButtonTapped(_ sender: UINavigationBar){
        let vc = SettingsView()
        navigationController?.pushViewController(vc, animated: true)
    }

}


extension HomeView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NoteCell.reuseId, for: indexPath) as! NoteCell
        cell.setup(title: notes[indexPath.row])
        print(indexPath)
        return cell
    }
}

extension HomeView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 12) / 2, height: 100)
    }
}

extension HomeView: HomeViewProtocol {
    func successNotes(notes: [String]) {
        self.notes = notes
        notesCollectionView.reloadData()
    }
}

