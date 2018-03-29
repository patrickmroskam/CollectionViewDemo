//
//  CollectionViewController.swift
//  CollectionViewDemo
//
//  Created by Patrick Roskam on 3/25/18.
//  Copyright © 2018 PatrickMRoskam. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    
    var plantDataItems = [DataItem]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let width = collectionView!.frame.width / 3
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        
        for i in 1...12 {
            if i > 9 {
                plantDataItems.append(DataItem(title: "Title #\(i)", kind: Kind.Plant, imageName: "img\(i).jpg"))
            } else {
                plantDataItems.append(DataItem(title: "Title #0\(i)", kind: Kind.Plant, imageName: "img0\(i).jpg"))
            }
        }
        
        for i in 1...12 {
            if i > 9 {
                animalDataItems.append(DataItem(title: "Another Title #\(i)", kind: Kind.Animal, imageName: "anim\(i).jpg"))
            } else {
                animalDataItems.append(DataItem(title: "Another Title #0\(i)", kind: Kind.Animal, imageName: "anim0\(i).jpg"))
            }
        }
        
        allItems.append(plantDataItems)
        allItems.append(animalDataItems)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return allItems.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allItems[section].count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! DataItemCell
        let dataItem = allItems[indexPath.section][indexPath.item]
        cell.dataItem = dataItem
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as! DataItemHeader
        var title = ""
        if let kind = Kind(rawValue: indexPath.section) {
            title = kind.description()
        }
        sectionHeader.title = title
        
        return sectionHeader
    }
    
    var animalDataItems = [DataItem]()
    var allItems = [[DataItem]]()
    
    @IBAction func addButtonTapped(_ sender: AnyObject) {
        let item = DataItem(title: "New Item", kind: .Animal, imageName: "default.jpeg")
        let index = allItems[0].count
        allItems[0].append(item)
        let indexPath = IndexPath(item: index, section: 0)
        collectionView?.insertItems(at: [indexPath])
    }
    
    
    //moving cells
    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath){
        
        let itemToMove = allItems[sourceIndexPath.section][sourceIndexPath.row]
        
        allItems[sourceIndexPath.section].remove(at: sourceIndexPath.row)
        
        if sourceIndexPath.section == destinationIndexPath.row {
            
            allItems[destinationIndexPath.section].insert(itemToMove, at: destinationIndexPath.row)
            
        }
        else {
            
            allItems[destinationIndexPath.section].insert(itemToMove, at: destinationIndexPath.row)
            
            if destinationIndexPath.section == 0 {
                itemToMove.kind = Kind.Animal
            } else {
                itemToMove.kind = Kind.Plant
            }
            
            
        }
        
        collectionView.reloadData()
    }
    
    //delete items:
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        func showAlert(title: String) {
            let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "yes", style: .destructive, handler: { action in collectionView.performBatchUpdates({
                self.allItems[indexPath.section].remove(at: indexPath.row)
                self.collectionView?.deleteItems(at: [indexPath])
                
            }, completion: nil) }))
            
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        
        showAlert(title: "Delete Item?")
    }


}
