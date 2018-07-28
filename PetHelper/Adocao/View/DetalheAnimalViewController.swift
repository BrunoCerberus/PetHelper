//
//  DetalheAnimalViewController.swift
//  PetHelper
//
//  Created by Bruno Lopes de Mello on 28/07/18.
//  Copyright © 2018 Bruno Lopes de Mello. All rights reserved.
//

import UIKit

protocol AdotarProtocol {
    func adotarAction()
}

class DetalheAnimalViewController: UIViewController {

    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var racaLabel: UILabel!
    @IBOutlet weak var cidadeLabel: UILabel!
    @IBOutlet weak var distanciaLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    @IBOutlet weak var porteLabel: UILabel!
    @IBOutlet weak var castradoLabel: UILabel!
    @IBOutlet weak var hobbiesLabel: UILabel!
    @IBOutlet weak var statusVacinaLabel: UILabel!
    @IBOutlet weak var brinquedoLabel: UILabel!
    
    var delegate: AdotarProtocol?
    var animalSelecionado = [String: String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialConfig()
        // Do any additional setup after loading the view.
    }
    
    func initialConfig() {
        nomeLabel.text = animalSelecionado["nome"]
        racaLabel.text = animalSelecionado["raca"]
        cidadeLabel.text = animalSelecionado["cidade"]
        distanciaLabel.text = animalSelecionado["distancia"]
        descricaoLabel.text = animalSelecionado["descricao"]
        porteLabel.text = animalSelecionado["porte"]
        castradoLabel.text = animalSelecionado["castracao"]
        hobbiesLabel.text = animalSelecionado["hobbies"]
        statusVacinaLabel.text = animalSelecionado["statusvacina"]
        brinquedoLabel.text = animalSelecionado["brinquedo"]
        
    }
    
    @IBAction func adotarAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        delegate?.adotarAction()
    }
}
