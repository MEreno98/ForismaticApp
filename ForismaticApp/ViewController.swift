//
//  ViewController.swift
//  ForismaticApp
//
//  Created by Mikel Ereño on 20/12/16.
//  Copyright © 2016 Mikel Ereño. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var l_autor: UILabel!
    @IBOutlet weak var l_frase: UILabel!
    @IBOutlet weak var t_autor: UILabel!
    @IBOutlet weak var t_frase: UITextView!
    @IBOutlet weak var b_lang: UISegmentedControl!
    @IBOutlet weak var b_refresh: UIButton!
  

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        forismaticRequest(language: "en")
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sc_idioma(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            //Ruso
            l_autor.text = "Автор:"
            l_frase.text = "Выражение:"
            b_refresh.setTitle("Oсвежать", for: .normal)
            sender.setTitle("Aнглийский", forSegmentAt: 0)
            sender.setTitle("Pусский", forSegmentAt: 1)
            forismaticRequest(language: "ru")
        }else{
            //Ingles
            l_autor.text = "Author:"
            l_frase.text = "Expression:"
            b_refresh.setTitle("Refresh", for: .normal)
            sender.setTitle("English", forSegmentAt: 0)
            sender.setTitle("Russian", forSegmentAt: 1)
            forismaticRequest(language: "en")
        }
    }
    
    @IBAction func sender(_ sender: UIButton) {
        if b_lang.selectedSegmentIndex == 1 {
            forismaticRequest(language: "ru")
        }else{
            forismaticRequest(language: "en")
        }
    }
    
    func forismaticRequest(language lang:String) {
        let params: Parameters = ["method":"getQuote","format":"json","lang":lang]
        
        
        Alamofire.request("http://api.forismatic.com/api/1.0/", method: .post, parameters: params).validate().responseJSON { response in
            switch response.result {
                
            case .success(let value):
                let json = JSON(value)
                self.t_autor.text = json["quoteAuthor"].stringValue
                self.t_frase.text = json["quoteText"].stringValue
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
}

