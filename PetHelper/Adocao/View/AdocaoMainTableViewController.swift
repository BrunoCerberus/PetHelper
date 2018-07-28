//
//  AdocaoMainTableViewController.swift
//  PetHelper
//
//  Created by Bruno Lopes de Mello on 28/07/18.
//  Copyright © 2018 Bruno Lopes de Mello. All rights reserved.
//

import UIKit

class AdocaoMainTableViewController: UITableViewController {

    @IBOutlet weak var petShopCollection: UICollectionView!
    @IBOutlet weak var OngCollectionView: UICollectionView!
    @IBOutlet weak var animaisCollectionView: UICollectionView!
    @IBOutlet weak var refreshComponent: UIRefreshControl!
    
    var animais = [[String: String]]()
    var animalSeleciondo: [String: String]!
    var cachorrosImagens = [String]()
    var imagemCachorroSelecionada: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var animal: [String: String] = [:]
        
        animal["nome"] = "Pipoca"
        animal["raca"] = "Labrador"
        animal["porte"] = "Grande"
        animal["cidade"] = "Vitória"
        animal["castracao"] = "Sim"
        animal["hobbies"] = "Assustar os gatos"
        animal["statusvacina"] = "Vacinado"
        animal["brinquedo"] = "Bolinhas"
        animal["distancia"] = "3km de distância"
        animal["descricao"] = """
                                Chambinha é um labrador muito levado, mas é um amor!
                                Quando não está brincando com bolinhas,
                                está assustando os gatinhos que passam no abrigo.
                              """
        animais.append(animal)
        animal = [:]
        
        //---------------------------------------------------------------------------
        animal["nome"] = "Thor"
        animal["porte"] = "Pequeno"
        animal["raca"] = "Viralata-leao"
        animal["cidade"] = "Rio de Janeiro"
        animal["castracao"] = "Sim"
        animal["hobbies"] = "Estourar bolhinhas"
        animal["statusvacina"] = "Vacinado"
        animal["brinquedo"] = "Franguinho de borracha"
        animal["distancia"] = "550km de distância"
        animal["descricao"] = """
        Thor é um viralata bem fofo, bem simpático e adora um carinho.
        Tem medo de escuro e de pipas.
        """
        animais.append(animal)
        animal = [:]
        
        //---------------------------------------------------------------------------
        animal["nome"] = "Aika"
        animal["porte"] = "Médio"
        animal["raca"] = "Buldogue"
        animal["cidade"] = "Vila Velha"
        animal["castracao"] = "Nao"
        animal["hobbies"] = "Banho de sol"
        animal["statusvacina"] = "Vacinada"
        animal["brinquedo"] = "Ossos"
        animal["distancia"] = "32km de distância"
        animal["descricao"] = """
        Aika é bem nervosinha, morde pessoas desconhecidas e pega
        qualquer rato que invada a sua casa.
        """
        animais.append(animal)
        animal = [:]
        
        //---------------------------------------------------------------------------
        animal["nome"] = "Alpha"
        animal["porte"] = "Grande"
        animal["raca"] = "Viralata"
        animal["cidade"] = "Rio Branco"
        animal["castracao"] = "Nao"
        animal["hobbies"] = "Comer moscas"
        animal["statusvacina"] = "Vacinado"
        animal["brinquedo"] = "Fazer buracos"
        animal["distancia"] = "1200km de distância"
        animal["descricao"] = """
        É uma cachorra bem desconfiada, nao gosta muito de carinhos
        ou de se misturar com outros cachorros.
        """
        animais.append(animal)
        animal = [:]
        
        //---------------------------------------------------------------------------
        animal["nome"] = "Beto"
        animal["porte"] = "Pequeno"
        animal["raca"] = "Viralata"
        animal["cidade"] = "Campo Grande"
        animal["castracao"] = "Sim"
        animal["hobbies"] = "Se sujar na lama"
        animal["statusvacina"] = "Vacinado"
        animal["brinquedo"] = "Morder o carteiro"
        animal["distancia"] = "1100km de distância"
        animal["descricao"] = """
        É um cachorro bem eletrico, adora correr e fazer besteira,
        gosta de caminhadas no final da tarde e beber muita agua.
        """
        animais.append(animal)
        animal = [:]
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath
        let items = try! fm.contentsOfDirectory(atPath: path!)
        
        for item in items {
            if item.hasSuffix("jpg") {
                cachorrosImagens.append(item)
            }
        }

        animaisCollectionView.isScrollEnabled = false
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
 

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detalheAnimal" {
            if let vc = segue.destination as? DetalheAnimalViewController {
                vc.imagemSelecionada = self.imagemCachorroSelecionada
                vc.animalSelecionado = self.animalSeleciondo
                vc.delegate = self
            }
        }
    }
 
    
    
    @IBAction func refresh(_ sender: Any) {
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { (timer) in
            self.refreshComponent.endRefreshing()
        }
    }
    
}

extension AdocaoMainTableViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == animaisCollectionView {
            return 10
        }
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == petShopCollection {
            let petShopCell = petShopCollection.dequeueReusableCell(withReuseIdentifier: "petCell", for: indexPath)
            petShopCell.contentView.backgroundColor = UIColor.lightGray
            return petShopCell
        } else if collectionView == OngCollectionView {
            let ongCell = OngCollectionView.dequeueReusableCell(withReuseIdentifier: "ongCell", for: indexPath)
            ongCell.contentView.backgroundColor = UIColor.lightGray
            return ongCell
        } else {
            
            let animalCell = animaisCollectionView.dequeueReusableCell(withReuseIdentifier: "animalCell", for: indexPath)
            animalCell.contentView.backgroundColor = UIColor.lightGray
            return animalCell
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view:UIView, forSection: Int) {
        if let tableViewHeaderFooterView = view as? UITableViewHeaderFooterView {
            tableViewHeaderFooterView.textLabel?.textColor = UIColor.black
            tableViewHeaderFooterView.contentView.backgroundColor = UIColor.white
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == petShopCollection {
           
        } else if collectionView == OngCollectionView {
            
        } else {
            self.imagemCachorroSelecionada = self.cachorrosImagens[indexPath.row]
            self.animalSeleciondo = self.animais[indexPath.row]
            self.performSegue(withIdentifier: "detalheAnimal", sender: nil)
        }
    }
}

extension AdocaoMainTableViewController: AdotarProtocol {
    func adotarAction() {
        self.performSegue(withIdentifier: "goSucesso", sender: nil)
    }
}
