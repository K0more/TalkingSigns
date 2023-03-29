//
//  TranslateViewController.swift
//  TalkingSigns
//
//  Created by Archit Khanna on 26/02/23.
//

import UIKit

class TranslateViewController: UIViewController {
    
    var inputText:Translate = Translate(userTextInput:"", inputDate: Date(), itemIdentifier: UUID())
    
    @IBOutlet weak var inputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    }
    
        
    @IBAction func translateButtonTapped(_ sender: Any) {
        
        inputText = Translate(userTextInput: inputTextField.text!, inputDate: Date(), itemIdentifier: UUID())
        
        inputText.saveInput()
        
        let loadMainItems = dataManager.loadAll(Translate.self)
                
                //print(loadMainItems)
                for oneItem in loadMainItems {
                    print(oneItem.toString())
                }
                
            }
        
//        let vc = storyboard?.instantiateViewController(withIdentifier: "signsViewController") as? signsViewController
        
        
        
        
//        self.navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
    }
    
    


