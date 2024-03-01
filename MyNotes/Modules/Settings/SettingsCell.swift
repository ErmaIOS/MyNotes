//
//  SettingsTableCell.swift
//  MyNotes
//
//  Created by Erma on 24/2/24.
//
import UIKit
import SnapKit

class SettingsTableViewCell: UITableViewCell {
    static var cellId = "cellId"
    
    
    private lazy var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var iconImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "language")
        view.backgroundColor = UIColor.init(hex: "#EEEEEF")
        return view
    }()
    
    private lazy var textIcon: UILabel = {
        let view = UILabel()
        view.text = "Язык"
        view.textColor = .black
        view.font = .systemFont(ofSize: 17)
        return view
    }()
    
   
    
   
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cellView)
        cellView.addSubview(iconImage)
        cellView.addSubview(textIcon)
       
        
        cellView.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide)
            make.height.equalTo(48)
            make.horizontalEdges.equalToSuperview().inset(10)
            make.bottom.equalTo(contentView.safeAreaLayoutGuide)
        }
        iconImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(22)
        }
        textIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalTo(iconImage.snp.trailing).offset(13)
        }
        
       
        
        
                
               
        
        
        
        }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ title:String,_ imageName:String){
        textIcon.text = title
        iconImage.image = UIImage(named: imageName)
    }
    
    
    
        
    }
        
        
        
    
    
    
   

    
