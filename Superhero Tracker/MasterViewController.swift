//
//  MasterViewController.swift
//  Hall of justice
//
//  Created by Cenny Davidsson on 2014-11-26.
//  Copyright (c) 2014 CocoaHeads. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    let superheroStore = SuperheroStore()
    lazy var heroData: [Superhero] = { self.superheroStore.sortedByName() }()

    var filterResult: [Superhero] {
        get {
            let t = self.searchBar.text!
            return self.superheroStore.fuzzySearch(t)
        }
    }

    // MARK: - Table View

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView == self.tableView) {
            return heroData.count
        }
        else {
            return filterResult.count
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        if(tableView == self.tableView) {
            cell.textLabel.text = heroData[indexPath.row].name
        }
        else {
            cell.textLabel.text = filterResult[indexPath.row].name
        }

        return cell
    }
    
    func CurrentHeroList(tableView: UITableView) -> [Superhero] {
        if(tableView == self.tableView) {
            return heroData
        }
        else {
            return filterResult
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destination = segue.destinationViewController as DetailViewController
        let cell = sender as UITableViewCell
        let index = self.tableView.indexPathForCell(cell)?.row
        let hero = self.heroData[index!]
        
        if var foo = destination.foo {
            foo.text = hero.name
        }
        
        //destination.secretId.text = "super secret..." // hero.secretIdentiy
    }
}

