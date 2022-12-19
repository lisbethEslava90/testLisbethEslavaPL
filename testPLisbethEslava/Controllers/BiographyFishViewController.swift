//
//  BiographyFishViewController.swift
//  testPLisbethEslava
//
//  Created by Lisbeth Eslava on 16/12/22.
//

import UIKit

class BiographyFishViewController: UIViewController {
    
    private var biographyFishViewModel: BiographyFishViewModel!
    var specieName: String = ""
    
    @IBOutlet weak var priofileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scientificNameLabel: UILabel!
    @IBOutlet weak var scientificNamelValueLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var caloriesValueLabel: UILabel!
    @IBOutlet weak var galleryTitleLabel: UILabel!
    @IBOutlet weak var galleryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        displayBiographyInformation()
    }

    func setupView() {
        self.view.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.8078431373, blue: 0.7921568627, alpha: 1)
        galleryCollectionView.delegate = self
        galleryCollectionView.dataSource = self
        galleryCollectionView.backgroundColor = .clear
        scientificNameLabel.text = "Scientific Name:"
        caloriesLabel.text = "Calories:"
        galleryTitleLabel.text = "Gallery:"
        titleLabel.text = specieName
        scientificNamelValueLabel.text = ""
        caloriesValueLabel.text = ""
        priofileImageView.image = UIImage(named: "placeholder")
        galleryCollectionView.register(UINib(nibName: GalleryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: GalleryCollectionViewCell.identifier)
    }
    
    func displayBiographyInformation() {
        self.biographyFishViewModel = BiographyFishViewModel(specieName: specieName)
        self.biographyFishViewModel.bindBiographyFishViewModelToController = {
            self.updateDataStore()
        }
    }
    
    func updateDataStore() {
        DispatchQueue.main.async {
            guard let info = self.biographyFishViewModel.biographyFishInfo else { return }
            self.scientificNamelValueLabel.text = info.scientificName
            self.caloriesValueLabel.text = info.calories
            self.priofileImageView.loadRemoteImageFrom(urlString: info.profileImage.src)
            self.galleryCollectionView.reloadData()
        }
    }
}

extension BiographyFishViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let _ = biographyFishViewModel.biographyFishInfo, let gallery = biographyFishViewModel.biographyFishInfo.gallery else { return 0 }
        return gallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let gallery = biographyFishViewModel.biographyFishInfo.gallery?[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.identifier, for: indexPath) as! GalleryCollectionViewCell
        cell.itemGalleyImageView.loadRemoteImageFrom(urlString: gallery?.src ?? "")
        return cell
    }
}
