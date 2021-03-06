//
//  AddFruitViewController.swift
//  muranakaKadai14
//
//  Created by 村中令 on 2021/11/10.
//

import UIKit

class AddFruitViewController: UIViewController {
    enum Result {
        case save(String)
        case cancel
    }

    @IBOutlet weak private var fruitTextField: UITextField!

    var selectedFruit: Fruit?

    private var result: Result?

    var onViewDidDisappear: (Result) -> Void = { _ in }

    override func viewDidLoad() {
        super.viewDidLoad()
        fruitTextField.text = selectedFruit?.name
    }

    @IBAction private func saveFruit(_ sender: Any) {
        result = .save(fruitTextField.text ?? "")
        guard let result = result else { return }
        onViewDidDisappear(result)
        performSegue(withIdentifier: "SaveSegue", sender: nil)
    }

    @IBAction private func cancel(_ sender: Any) {
        result = .cancel
        guard let result = result else { return }
        onViewDidDisappear(result)
        performSegue(withIdentifier: "CancelSegue", sender: nil)
    }
}
