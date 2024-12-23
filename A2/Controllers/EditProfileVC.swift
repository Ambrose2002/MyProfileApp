//
//  EditProfileVC.swift
//  A2
//
//  Created by Vin Bui on 6/4/23.
//

import UIKit

class EditProfileVC: UIViewController {
    
    // MARK: - Properties (view)
    let profileImageView = UIImageView()
    let nameLabel = UILabel()
    let bioLabel = UILabel()
    let hometownLabel = UILabel()
    let majorLabel = UILabel()
    let pageLabel = UILabel()
    
    
    // MARK: - Properties (data)
    
    private let name: String
    private let bio: String
    private let hometown: String
    private let major: String
    // MARK: - viewDidLoad and init
    
    init(name: String, bio: String, hometown: String, major: String) {
        self.name = name
        self.bio = bio
        self.hometown = hometown
        self.major = major
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.a2.white
        
        setPageLabel()
        setProfileImageView()
        setNameLabel()
        setBioLabel()
//        setHometownLabel()
//        setMajorLabel()
    }
    
    // MARK: - Set Up Views
    
    func setPageLabel() {
        view.addSubview(pageLabel)
        pageLabel.text = "Edit Profile"
        pageLabel.textColor = UIColor.a2.black
        pageLabel.font = UIFont.systemFont(ofSize: 16)
        pageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setProfileImageView() {
        
        profileImageView.image = UIImage(named: "ambroseImg")
        view.addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.layer.cornerRadius = 48
        profileImageView.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: pageLabel.bottomAnchor, constant: 32),
            profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            profileImageView.widthAnchor.constraint(equalToConstant: 96),
            profileImageView.heightAnchor.constraint(equalToConstant: 96)
        ])
    }
    
    func setNameLabel() {
        view.addSubview(nameLabel)
        
        nameLabel.text = name
        nameLabel.font = UIFont.systemFont(ofSize: 24)
        nameLabel.textColor = UIColor.a2.black
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 23),
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
        ])
    }
    
    func setBioLabel() {
        
        view.addSubview(bioLabel)
        
        bioLabel.text = bio
        bioLabel.font = UIFont.italicSystemFont(ofSize: 14)
        bioLabel.textColor = UIColor.a2.black
        
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bioLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            bioLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16)
        ])
    }
    
}
