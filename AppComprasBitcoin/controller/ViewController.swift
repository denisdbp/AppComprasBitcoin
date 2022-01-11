//
//  ViewController.swift
//  AppComprasBitcoin
//
//  Created by Admin on 01/01/22.
//

import UIKit
import EmailValidator
import Money

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var bannerImageView: UIImageView?
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet weak var cpfTextField: UITextField?
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var precoBitcoinLabel: UILabel!
    @IBOutlet weak var enderecoTextField: UITextField!
    @IBOutlet weak var bairroTextField: UITextField!
    @IBOutlet weak var qtdBitcoinCompradoLabel: UILabel!
    
    //MARK: - Atributos
    
    var precoBitcoin:BRL = 0.00
    var valorParaComprar: Double = 0.00
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bannerImageView?.layer.cornerRadius = 10
        self.bannerImageView?.layer.masksToBounds = true
        
        BitcoinAPI().bitcoinAPI(preco: {preco in
            let precoBitcoin:BRL = BRL(floatLiteral: preco.high)
            self.precoBitcoinLabel?.text = precoBitcoin.formatted(withStyle: .currency, forLocaleId: "pt_br")
            self.precoBitcoin = precoBitcoin
        })
    }
    
    // MARK: - Metodos
    
    @IBAction func recalcularBitcoinButton(_ sender: UIButton) {
        BitcoinAPI().bitcoinAPI(preco: {preco in
            let precoBitcoin:BRL = BRL(floatLiteral: preco.high)
            self.precoBitcoinLabel?.text = precoBitcoin.formatted(withStyle: .currency, forLocaleId: "pt_br")
            self.precoBitcoin = precoBitcoin
        })
    }
    
    @IBAction func valorParaComprar(_ sender: UITextField) {
        guard let valor = Double((sender.text)!) else { return }
        BitcoinAPI().bitcoinAPI(preco: {preco in
            let precoBitcoin = preco.high
            let qtdBitcoin = valor / precoBitcoin
            self.qtdBitcoinCompradoLabel.text = String(format: "%.8f", qtdBitcoin)
            self.valorParaComprar = valor
        })
    }
    
    @IBAction func cepChangedTextField(_ sender: UITextField) {
        guard let cep = sender.text else { return }
        LocalizacaoAPI().localizacaoAPI(cep, resultado: {(localizacao) in
            self.enderecoTextField.text = localizacao.logradouro
            self.bairroTextField.text = localizacao.bairro
        })
    }
    
    @IBAction func avancarParaPagamento(){
        if ValidaCamposTextFields().validaCamposTextFieldsTelaDadosPessoais(textFields) {
            guard let cpf = cpfTextField?.text, let email = emailTextField?.text else { return }
            if ValidaDados().validaDados(cpf, email){
                performSegue(withIdentifier: "pagamento", sender: self)
            }else{
                Alertas().exibeAlerta(titulo: "Atencao", mensagem: "CPF ou Email invalidos", controller: self)
            }
        }else{
            Alertas().exibeAlerta(titulo: "Atencao", mensagem: "Preencha todos os campos", controller: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pagamento"{
            if let pagamentoViewController = segue.destination as? PagamentoViewController{
                pagamentoViewController.valorParaComprar = valorParaComprar
            }
        }
    }
}
