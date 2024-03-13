//
//  ViewController.swift
//  Discount Calculator
//
//  Created by Nick Alan Lom Ruiz on 12/03/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var discount: UILabel!
    @IBOutlet weak var QuantityTxT: UITextField!
    @IBOutlet weak var PercentageTxT: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(tecladoUP), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(tecladoDown), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func tecladoUP(){
        let sizeScreen = UIScreen.main.nativeBounds.height
        if sizeScreen == 1136 {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y = -50
            }
        }
    }
    @objc func tecladoDown(){
        if self.view.frame.origin.y != 0{
            self.view.frame.origin.y = 0
        }
    }
    //con este codigo hacemos que el teclado se oculte una vez no se este interactuando con algun elemento de la app.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func calcultatebtn(_ sender: Any) {
        guard let cantidad = QuantityTxT.text else { return }
        guard let porcentaje = PercentageTxT.text else { return }
        let cant = (cantidad as NSString).floatValue
        let porc = (porcentaje as NSString).floatValue
        
        let desc = cant * porc/100
        let resultado =  cant - desc
        
        result.text = "$\(resultado)"
        discount.text = "$\(desc)"
        
        self.view.endEditing(true)
    }
    @IBAction func clearbtn(_ sender: Any) {
        QuantityTxT.text = ""
        PercentageTxT.text = ""
        result.text = "$0.00"
        discount.text = "$0.00"
    }
}

