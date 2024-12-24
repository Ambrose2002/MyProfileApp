//
//  ProfileVC.swift
//  A2
//
//  Created by Vin Bui on 6/4/23.
//

import UIKit

class ProfileVC: UIViewController, EditProfileDelegate {
    
    // MARK: - Properties (view)
    let pageLabel = UILabel()
    
    let profileImageView = UIImageView()
    
    let nameLabel = UILabel()
    
    let bioLabel = UILabel()
    
    let hometownLabel = UILabel()
    
    let hometownIcon = UIImageView()
    
    let majorLabel = UILabel()
    
    let majorIcon = UIImageView()
    
    let editProfileButton = UIButton()
    
    let navigationBackButton = UIBarButtonItem()
    
    
    // MARK: - Properties (data)
    var name: String = "Ambrose"
    var bio: String = "For the Lin Kuei!"
    var hometown: String = "Kumasi, Ghana"
    var major: String = "Computer Science"
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.a2.white
        
        setPageLabel()
        setProfileImageView()
        setNameLabel()
        setBioLabel()
        setHometownIcon()
        setHometownLabel()
        setMajorIcon()
        setMajorLabel()
        setEditProfileButton()
        setNavigationBackButton()
    }
    
    // MARK: - Set Up Views
    func setProfileImageView() {
        profileImageView.image = UIImage(named: "ambroseImg")
        
        view.addSubview(profileImageView)
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        profileImageView.layer.cornerRadius = 64
        
        profileImageView.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: pageLabel.bottomAnchor, constant: 32),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 128),
            profileImageView.heightAnchor.constraint(equalToConstant: 128)
            
        ])
    }
    
    func setPageLabel() {
        
        view.addSubview(pageLabel)
        
        pageLabel.text = "My Profile"
        pageLabel.textColor = UIColor.a2.black
        pageLabel.font = UIFont.systemFont(ofSize: 16)
        
        pageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setNameLabel() {
        view.addSubview(nameLabel)
        
        nameLabel.text = name
        nameLabel.font = UIFont.systemFont(ofSize: 32)
        nameLabel.textColor = UIColor.a2.black
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func setBioLabel() {
        
        view.addSubview(bioLabel)
        
        bioLabel.text = bio
        bioLabel.font = UIFont.italicSystemFont(ofSize: 16)
        bioLabel.textColor = UIColor.a2.black
        
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bioLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            bioLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setHometownIcon() {
        
        view.addSubview(hometownIcon)
        
        hometownIcon.image = UIImage(named: "homeImg")
        
        hometownIcon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hometownIcon.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: 48),
            hometownIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            hometownIcon.widthAnchor.constraint(equalToConstant: 24),
            hometownIcon.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func setHometownLabel() {
        
        view.addSubview(hometownLabel)
        
        hometownLabel.text = hometown
        hometownLabel.font = UIFont.systemFont(ofSize: 16)
        hometownLabel.textColor = UIColor.a2.black
        
        hometownLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hometownLabel.leftAnchor.constraint(equalTo: hometownIcon.rightAnchor, constant: 16),
            hometownLabel.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: 48)
        ])
    }
    
    func setMajorIcon() {
        
        view.addSubview(majorIcon)
        
        majorIcon.image = UIImage(named: "majorImg")
        
        majorIcon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            majorIcon.topAnchor.constraint(equalTo: hometownIcon.bottomAnchor, constant: 32),
            majorIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            majorIcon.heightAnchor.constraint(equalToConstant: 24),
            majorIcon.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func setMajorLabel() {
        
        view.addSubview(majorLabel)
        
        majorLabel.text = major
        majorLabel.font = UIFont.systemFont(ofSize: 16)
        majorLabel.textColor = UIColor.a2.black
        
        majorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            majorLabel.leftAnchor.constraint(equalTo: majorIcon.rightAnchor, constant: 16),
            majorLabel.topAnchor.constraint(equalTo: hometownIcon.bottomAnchor, constant: 32)
        ])
    }
    
    func setEditProfileButton() {
        
        view.addSubview(editProfileButton)
        
        editProfileButton.backgroundColor = UIColor.a2.ruby
        editProfileButton.setTitle("Edit Profile", for: .normal)
        editProfileButton.setTitleColor(UIColor.a2.white, for: .normal)
        editProfileButton.layer.cornerRadius = 16
        
        editProfileButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            editProfileButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64),
            editProfileButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            editProfileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            editProfileButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        editProfileButton.addTarget(self, action: #selector(editProfileButtonTapped), for: .touchUpInside)
        
    }
    
    @objc private func editProfileButtonTapped() {
        
        let editProfileVC = EditProfileVC(name: name, bio: bio, hometown: hometown, major: major)
        editProfileVC.delegate = self
        navigationController?.pushViewController(editProfileVC, animated: true)
    }
    
    func setNavigationBackButton() {
        navigationBackButton.title = "My Profile"
        
        navigationItem.backBarButtonItem = navigationBackButton
    }
    
    func didUpdateProfile(major: String, hometown: String) {
        self.hometown = hometown
        self.major = major
        
        hometownLabel.text = hometown
        majorLabel.text = major
    }
    
}
