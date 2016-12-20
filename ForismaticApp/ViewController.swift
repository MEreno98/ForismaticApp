//
//  ViewController.swift
//  ForismaticApp
//
//  Created by Mikel Ereño on 20/12/16.
//  Copyright © 2016 Mikel Ereño. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var l_autor: UILabel!
    @IBOutlet weak var l_frase: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sc_idioma(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            //Ruso
            l_autor.text = "Автор:"
            l_frase.text = "Выражение:"
            sender.setTitle("Aнглийский", forSegmentAt: 0)
            sender.setTitle("Pусский", forSegmentAt: 1)
        default:
            //Ingles
            l_autor.text = "Author:"
            l_frase.text = "Expression:"
            sender.setTitle("English", forSegmentAt: 0)
            sender.setTitle("Russian", forSegmentAt: 1)
        }
    }

}

