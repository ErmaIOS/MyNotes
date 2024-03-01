//
//  SettingsTableCell.swift
//  MyNotes
//
//  Created by Erma on 24/2/24.
//
import UIKit
import SnapKit

protocol SettingsCellDelegate:AnyObject{
    
    func didChangeTheme(switchMode: Bool)
}

class SettingsCell: UITableViewCell {
  
    static var cellId = "cellId"
    
 
    weak var delegate:SettingsCellDelegate?
    
    lazy var cellView: UIView = {
        let view = UIView()
        
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var iconImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "language")
        view.tintColor = .label
        return view
    }()
    
    private lazy var textIcon: UILabel = {
        let view = UILabel()
        view.text = "Язык"
        view.font = .systemFont(ofSize: 17)
        return view
    }()
    var languageButton: UIButton = {
        let view = UIButton(type: .system)
        view.setImage(UIImage(named: "chevronIcon"), for: .normal)
        view.setTitleColor(.secondaryLabel, for: .normal)
        view.semanticContentAttribute = .forceRightToLeft
        view.tintColor = .label
        return view
    }()
    var languageLabel: UILabel = {
        let view = UILabel()
        view.text = "Русский"
        view.font = .systemFont(ofSize: 14)
        return view
    }()
     lazy var switchMode: UISwitch = {
        let view = UISwitch()

         
        view.addTarget(self, action: #selector(didChangeSwitch), for: .valueChanged)
        return view
    }()
   
    
    override func prepareForReuse() {
            super.prepareForReuse()
        contentView.backgroundColor = .secondarySystemBackground
        }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(cellView)
        cellView.addSubview(iconImage)
        cellView.addSubview(textIcon)
        cellView.addSubview(languageButton)
        cellView.addSubview(languageLabel)
        cellView.addSubview(switchMode)
        
        cellView.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide)
            make.height.equalTo(48)
            make.horizontalEdges.equalToSuperview().inset(10)
            make.bottom.equalTo(contentView.safeAreaLayoutGuide)
            
        }
        iconImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(22)
        }
        textIcon.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(iconImage.snp.trailing).offset(15)
        }
        languageLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(contentView).offset(-49)
        }
        languageButton.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(contentView).offset(-26)
        }
        
        switchMode.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(contentView).offset(-26)
        }
  
        
        }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup(_ title:String,_ imageName:String){
        textIcon.text = title
        iconImage.image = UIImage(systemName: imageName)
    }
    
    
    
    
    @objc func didChangeSwitch(_ sender: UISwitch){
        
        delegate?.didChangeTheme(switchMode: sender.isOn)
    }
    
    
        
    }
        
        
        
    
    
    
   

    
