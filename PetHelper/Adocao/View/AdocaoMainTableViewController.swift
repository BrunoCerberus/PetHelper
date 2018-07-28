//
//  AdocaoMainTableViewController.swift
//  PetHelper
//
//  Created by Bruno Lopes de Mello on 28/07/18.
//  Copyright © 2018 Bruno Lopes de Mello. All rights reserved.
//

import UIKit

class AdocaoMainTableViewController: UITableViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var petShopCollection: UICollectionView!
    @IBOutlet weak var OngCollectionView: UICollectionView!
    @IBOutlet weak var animaisCollectionView: UICollectionView!
    @IBOutlet weak var refreshComponent: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
 

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == animaisCollectionView {
            return 30
        }
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == petShopCollection {
            let petShopCell = petShopCollection.dequeueReusableCell(withReuseIdentifier: "petCell", for: indexPath)
            petShopCell.contentView.backgroundColor = UIColor.lightGray
            return petShopCell
        } else if collectionView == OngCollectionView {
            let ongCell = OngCollectionView.dequeueReusableCell(withReuseIdentifier: "ongCell", for: indexPath)
            ongCell.contentView.backgroundColor = UIColor.lightGray
            return ongCell
        } else {
            
            let animalCell = animaisCollectionView.dequeueReusableCell(withReuseIdentifier: "animalCell", for: indexPath)
            animalCell.contentView.backgroundColor = UIColor.lightGray
            return animalCell
        }
        
        
    }
    
    @IBAction func refresh(_ sender: Any) {
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { (timer) in
            self.refreshComponent.endRefreshing()
        }
    }
    
}
