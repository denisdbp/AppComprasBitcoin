//
//  PagamentoViewController.swift
//  AppComprasBitcoin
//
//  Created by Admin on 02/01/22.
//

import UIKit
import Money

class PagamentoViewController: UIViewController, PickerViewMesSelecionado, PickerViewAnoSelecionado, PickerViewParcelaSelecionada {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var imagemPagamentos: UIImageView!
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet weak var numeroCartaoTextField: UITextField!
    @IBOutlet weak var numeroParcelasTextField: UITextField!
    @IBOutlet weak var mesTextField: UITextField!
    @IBOutlet weak var anoTextField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    
    //MARK: - Atributos
    
    var pickerViewMes = PickerViewMes()
    var pickerViewAno = PickerViewAno()
    var pickerViewParcelas = PickerViewParcelas()
    
    var precoBitcoin = 0.00
    var valorParaComprar: Double = 0.00
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        imagemPagamentos.layer.cornerRadius = 10
        imagemPagamentos.layer.masksToBounds = true
        pickerViewMes.delegate = self
        pickerViewAno.delegate = self
        pickerViewParcelas.delegate = self
        
        BitcoinAPI().bitcoinAPI(preco: {preco in
            self.precoBitcoin = preco.high
        })
    }
    
    //MARK: - Metodos
    
    func anoSelecionado(ano: String) {
        anoTextField.text = ano
    }
    
    func parcelaSelecionada(parcela: String) {
        numeroParcelasTextField.text = "\(parcela)x"
        let parcelas:BRL = BRL(floatLiteral: valorParaComprar / Double(parcela)!)
        totalLabel.text = "\(String(format: "%@x", parcela)) de \(parcelas.formatted(withStyle: .currency, forLocaleId: "pt_br"))"
    }
    
    @IBAction func selecionaParcela(_ sender: UITextField) {
        let pickerView = UIPickerView()
        pickerView.delegate = pickerViewParcelas
        pickerView.dataSource = pickerViewParcelas
        sender.inputView = pickerView
    }
    
    @IBAction func selecionaAno(_ sender: UITextField) {
        let pickerView = UIPickerView()
        pickerView.dataSource = pickerViewAno
        pickerView.delegate = pickerViewAno
        sender.inputView = pickerView
        
    }
    func mesSelecionado(mes: String) {
        mesTextField.text = mes
    }
  
    @IBAction func escolhaMes(_ sender: UITextField) {
        let pickerView = UIPickerView()
        pickerView.delegate = pickerViewMes
        pickerView.dataSource = pickerViewMes
        sender.inputView = pickerView
    }
    
    @IBAction func pagamento(_ sender: UIButton) {
        if ValidaCamposTextFields().validaCamposTelaPagamento(textFields){
            guard let numeroCartao = numeroCartaoTextField.text else { return }
            if ValidaDados().validaCartao(numeroCartao){
                Alertas().exibeAlerta(titulo: "Parabens", mensagem: "Compra realizada com sucesso", controller: self)
            }else{
                Alertas().exibeAlerta(titulo: "Atencao", mensagem: "Numero de cartao invalido", controller: self)
            }
        }else{
            Alertas().exibeAlerta(titulo: "Atencao", mensagem: "Preencha todos os campos", controller: self)
        }
    }
}
