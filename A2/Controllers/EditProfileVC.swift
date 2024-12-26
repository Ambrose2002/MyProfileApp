//
//  EditProfileVC.swift
//  A2
//
//  Created by Vin Bui on 6/4/23.
//

import UIKit
import PhotosUI

class EditProfileVC: UIViewController, PHPickerViewControllerDelegate {
    
    // MARK: - Properties (view)
    let profileImageView = UIImageView()
    let nameLabel = UILabel()
    let bioLabel = UILabel()
    let hometownLabel = UILabel()
    let majorLabel = UILabel()
    let pageLabel = UILabel()
    let hometownTextField = UITextField()
    let majorTextField = UITextField()
    let saveButton = UIButton()
    let editProfilePictureButton = UIButton()
    
    // MARK: - Properties (data)
    
    private let name: String
    private let bio: String
    private let hometown: String
    private let major: String
    private let profileImage: UIImage
    weak var delegate: EditProfileDelegate?
    // MARK: - viewDidLoad and init
    
    init(name: String, bio: String, hometown: String, major: String, profileImage: UIImage, delegate: EditProfileDelegate? = nil) {
        self.name = name
        self.bio = bio
        self.hometown = hometown
        self.major = major
        self.profileImage = profileImage
        self.delegate = delegate
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
        setHometownLabel()
        setHometownTextField()
        setMajorLabel()
        setMajorTextField()
        setSaveButton()
        setEditProfilePictureButton()
        
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
        
        profileImageView.image = self.profileImage
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
        nameLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
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
    
    func setHometownLabel() {
        view.addSubview(hometownLabel)
        hometownLabel.text = "Hometown"
        hometownLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        hometownLabel.textColor = UIColor.a2.black
        hometownLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hometownLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 40),
            hometownLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32)
        ])
    }
    
    func setHometownTextField() {
        view.addSubview(hometownTextField)
        hometownTextField.text = hometown
        hometownTextField.layer.borderWidth = 1
        hometownTextField.layer.borderColor = UIColor.a2.silver.cgColor
        hometownTextField.layer.cornerRadius = 8
        hometownTextField.textColor = UIColor.a2.black
        hometownTextField.layer.masksToBounds = true
        hometownTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 40))
        hometownTextField.leftView = paddingView
        hometownTextField.leftViewMode = .always
        
        NSLayoutConstraint.activate([
            hometownTextField.topAnchor.constraint(equalTo: hometownLabel.bottomAnchor, constant: 4),
            hometownTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            hometownTextField.widthAnchor.constraint(equalToConstant: 329),
            hometownTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setMajorLabel() {
        view.addSubview(majorLabel)
        majorLabel.text = "Major"
        majorLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        majorLabel.textColor = UIColor.a2.black
        majorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            majorLabel.topAnchor.constraint(equalTo: hometownTextField.bottomAnchor, constant: 32),
            majorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32)
        ])
    }
    
    func setMajorTextField() {
        view.addSubview(majorTextField)
        majorTextField.text = major
        majorTextField.layer.borderWidth = 1
        majorTextField.layer.borderColor = UIColor.a2.silver.cgColor
        majorTextField.textColor = UIColor.a2.black
        majorTextField.layer.cornerRadius = 8
        majorTextField.layer.masksToBounds = true
        majorTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 40))
        majorTextField.leftView = paddingView
        majorTextField.leftViewMode = .always
        
        NSLayoutConstraint.activate([
            majorTextField.topAnchor.constraint(equalTo: majorLabel.bottomAnchor, constant: 4),
            majorTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            majorTextField.widthAnchor.constraint(equalToConstant: 329),
            majorTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setSaveButton() {
        
        view.addSubview(saveButton)
        
        saveButton.backgroundColor = UIColor.a2.ruby
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(UIColor.a2.white, for: .normal)
        saveButton.layer.cornerRadius = 16
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            saveButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        
    }
    
    func setEditProfilePictureButton() {
        view.addSubview(editProfilePictureButton)
        let icon = UIImage(systemName: "pencil")
        editProfilePictureButton.setImage(icon, for: .normal)
        editProfilePictureButton.tintColor = UIColor.a2.white
        editProfilePictureButton.backgroundColor = UIColor.a2.ruby
        editProfilePictureButton.layer.cornerRadius = 14.5
        editProfilePictureButton.clipsToBounds = true
        editProfilePictureButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            editProfilePictureButton.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor, constant: 71),
            editProfilePictureButton.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: -2),
            editProfilePictureButton.widthAnchor.constraint(equalToConstant: 29),
            editProfilePictureButton.heightAnchor.constraint(equalToConstant: 29)
        ])
        
        editProfilePictureButton.addTarget(self, action: #selector(editProfilePictureButtonTapped), for: .touchUpInside)
    }
    
    @objc private func editProfilePictureButtonTapped() {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 1
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        
        guard let provider = results.first?.itemProvider, provider.canLoadObject(ofClass: UIImage.self)
        else {
            return
        }
        
        provider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
            guard let self = self else {return}
            if let image = image as? UIImage {
                DispatchQueue.main.async {
                    self.profileImageView.image = image
                }
            }
        }
    }
    
    @objc private func saveButtonTapped() {
        
        let updatedMajor = majorTextField.text == "" ? self.major : majorTextField.text!
        let updatedHometown = hometownTextField.text == "" ? self.hometown : hometownTextField.text!
        let updatedProfileImage = profileImageView.image!
        
        delegate?.didUpdateProfile(major: updatedMajor, hometown: updatedHometown, profileImage: updatedProfileImage)
        navigationController?.popViewController(animated: true)
    }
    
    private func setTextFields() {
        majorTextField.text = major
        hometownTextField.text = hometown
    }
    
}


