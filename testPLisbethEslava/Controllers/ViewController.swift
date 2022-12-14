//
//  ViewController.swift
//  testPLisbethEslava
//
//  Created by Lisbeth Eslava on 16/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    private var fisheshViewModel: FishesViewModel!
    @IBOutlet weak var fishListCollectionView: UICollectionView!
    @IBOutlet weak var loaderView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        displayFishesInformation()
    }
    
    func setupView() {
        fishListCollectionView.delegate = self
        fishListCollectionView.dataSource = self
        fishListCollectionView.backgroundColor = .clear
        fishListCollectionView.register(UINib(nibName: DetailFishCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DetailFishCollectionViewCell.identifier)
        loaderView.color = #colorLiteral(red: 0.2549019608, green: 0.8078431373, blue: 0.7921568627, alpha: 1)
        loaderView.startAnimating()
    }
    
    func displayFishesInformation() {
        fisheshViewModel = FishesViewModel()
        fisheshViewModel.bindFishesViewModelToController = {
            self.updateDataStore()
        }
    }
    
    func updateDataStore() {
        DispatchQueue.main.sync {
            self.loaderView.stopAnimating()
        }
        DispatchQueue.main.async {
            self.fishListCollectionView.reloadData()
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fisheshViewModel.fishehInfo != nil ? fisheshViewModel.fishehInfo.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currentFish = fisheshViewModel.fishehInfo[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailFishCollectionViewCell.identifier, for: indexPath) as! DetailFishCollectionViewCell
        cell.titleLabel.text = currentFish.speciesName
        cell.subtitleLabel.text = currentFish.region
        cell.profileImageView.loadRemoteImageFrom(urlString: currentFish.speciesImage.src)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destinationVc = BiographyFishViewController()
        destinationVc.specieName = fisheshViewModel.fishehInfo[indexPath.row].speciesName
        self.show(destinationVc, sender: nil)
    }
}
