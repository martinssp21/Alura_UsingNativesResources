//
//  MapaViewController.swift
//  Agenda
//
//  Created by Rodrigo Martins on 08/05/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController {
    @IBOutlet weak var mapaView: MKMapView!
    
    var aluno: Aluno?
    lazy var localizacao = Localizacao()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Localizar ALunos"
        LocalizacaoInicial()
        LocalizacaoDoAluno()
        mapaView.delegate = localizacao
    }
    
    func LocalizacaoInicial(){
        Localizacao().converterEnderecoEmCoordenadas(endereco: "Caelum - São Paulo") { (localizacaoEncontrada) in
            let pinCaelum = Localizacao().configuraPinMap(title: "Caelum", localization: localizacaoEncontrada, cor: .black, icone: UIImage(named: "icon_caelum"))
            let regiao = MKCoordinateRegionMakeWithDistance(pinCaelum.coordinate, 5000, 5000)
            self.mapaView.setRegion(regiao, animated: true)
            self.mapaView.addAnnotation(pinCaelum)
        }
    }
    
    func LocalizacaoDoAluno(){
        if let aluno = aluno {
            Localizacao().converterEnderecoEmCoordenadas(endereco: aluno.endereco! ) { (localizacaoEncontrada) in
                let pinAluno = Localizacao().configuraPinMap(title: aluno.nome!, localization: localizacaoEncontrada,cor: nil, icone: nil)
                let regiao = MKCoordinateRegionMakeWithDistance(pinAluno.coordinate, 5000, 5000)
                self.mapaView.setRegion(regiao, animated: true)
                self.mapaView.addAnnotation(pinAluno)
            }
        }
    }
}
