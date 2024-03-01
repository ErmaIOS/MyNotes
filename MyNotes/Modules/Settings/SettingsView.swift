import UIKit
import SnapKit




class SettingsView: UIViewController, UITableViewDataSource {
    
    
    
    
    
    private let tableView = UITableView()
    
    
    private let settings: [Setting] = [
        Setting(text: "Язык", image: "globe"),
        Setting(text: "Темная тема", image: "moon"),
        Setting(text: "Очистить данные", image: "trash")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        setupUI()
        setupNavigationItem()
       
    }
    
    private func setupNavigationItem() {
        navigationItem.title = "Settings"
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "settingsIcon"), style: .plain, target: self, action: #selector(settingsButtonTapped))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        rightBarButtonItem.tintColor = .label
    }
    
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        tableView.backgroundColor = UIColor.secondarySystemBackground
        tableView.layer.cornerRadius = 10
        tableView.dataSource = self
        tableView.register(SettingsCell.self, forCellReuseIdentifier: SettingsCell.cellId)
       
        
        
        
        view.addSubview(tableView)
      
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(144)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.cellId, for: indexPath) as! SettingsCell
        
        cell.setup(settings[indexPath.row].text,settings[indexPath.row].image)
        cell.delegate = self
        
        if indexPath.row == 0 {
            
            
            cell.contentView.addSubview(cell.languageButton)
            cell.contentView.addSubview(cell.languageLabel)
           

        }else{
            cell.languageButton.removeFromSuperview()
            cell.languageLabel.removeFromSuperview()
        }
        
        if indexPath.row == 1 {
            cell.contentView.addSubview(cell.switchMode)
            
        }else{
            cell.switchMode.removeFromSuperview()
        }
        return cell
    }
    
    
    
    
    
    
    
    
    
    @objc func settingsButtonTapped(_ sender: UIButton){
        
    }
    
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let hexString: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}

extension SettingsView:SettingsCellDelegate{
    
    func didChangeTheme(switchMode: Bool) {
        if switchMode
        {
            
            overrideUserInterfaceStyle = .dark
            
            
            
        }else{
            overrideUserInterfaceStyle = .light
            
        }
        
        
    }
    
}
    
    

