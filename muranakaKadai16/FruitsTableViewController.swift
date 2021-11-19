//
//  FruitsTableViewController.swift
//  muranakaKadai13
//
//  Created by 村中令 on 2021/11/08.
//

import UIKit

class FruitsTableViewController: UITableViewController {
    private var fruits: [Fruit] =
    [
        Fruit(name: "りんご", isCheck: false),
        Fruit(name: "みかん", isCheck: true),
        Fruit(name: "バナナ", isCheck: false),
        Fruit(name: "パイナップル", isCheck: true)
    ]

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fruits.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "Cell",
            for: indexPath
        ) as! FruitTableViewCell // swiftlint:disable:this force_cast
        cell.configure(fruit: fruits[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        fruits[indexPath.row].isCheck.toggle()
        tableView.reloadRows(at: [indexPath], with: .fade)
    }
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue( withIdentifier: "EditSegue", sender: indexPath)
    }

    // MARK: - Segue
    @IBAction private func addFruit(segue: UIStoryboardSegue) {
        let addVC = segue.source as! AddFruitViewController // swiftlint:disable:this force_cast
        
        guard let result = addVC.result else { return }
        
        switch result {
        case .save(let name):
            guard !name.isEmpty else { return }
            fruits.append(Fruit(name: name, isCheck: false))
            tableView.insertRows(
                at: [IndexPath(row: fruits.count - 1, section: 0)],
                with: .top
            )
        case .cancel:
            fatalError()
        }
    }

    @IBAction private func cancel(segue: UIStoryboardSegue) {
    }
}
