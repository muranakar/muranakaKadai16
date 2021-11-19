//
//  AddFruitViewController.swift
//  muranakaKadai14
//
//  Created by 村中令 on 2021/11/10.
//

import UIKit

class AddFruitViewController: UIViewController {
    enum Mode {
        case add
        case edit(String)
    }
    
    enum Result {
        case save(String)
        case cancel
    }

    @IBOutlet weak private var fruitTextField: UITextField!

    var onSave: (Result) -> Void = { _ in }
    
    var mode: Mode?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let mode = mode else { return }
        
        switch mode {
        case .add:
            break
        case .edit(let name):
            fruitTextField.text = name
        }
    }

    @IBAction private func saveFruit(_ sender: Any) {
        onSave(.save(fruitTextField.text ?? ""))
        performSegue(withIdentifier: "SaveSegue", sender: nil)
    }

    @IBAction private func cancel(_ sender: Any) {
        onSave(.cancel)
        performSegue(withIdentifier: "CancelSegue", sender: nil)
    }
}
