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

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Localizar ALunos"
        LocalizacaoInicial()
        LocalizacaoDoAluno()
    }
    
    func LocalizacaoInicial(){
        Localizacao().converterEnderecoEmCoordenadas(endereco: "Caelum - São Paulo") { (localizacaoEncontrada) in
            let pinCaelum = self.configuraPinMap(title: "Caelum", localization: localizacaoEncontrada)
            let regiao = MKCoordinateRegionMakeWithDistance(pinCaelum.coordinate, 5000, 5000)
            self.mapaView.setRegion(regiao, animated: true)
            self.mapaView.addAnnotation(pinCaelum)
        }
    }
    
    func LocalizacaoDoAluno(){
        if let aluno = aluno {
            Localizacao().converterEnderecoEmCoordenadas(endereco: aluno.endereco! ) { (localizacaoEncontrada) in
                let pinAluno = self.configuraPinMap(title: aluno.nome!, localization: localizacaoEncontrada)
                let regiao = MKCoordinateRegionMakeWithDistance(pinAluno.coordinate, 5000, 5000)
                self.mapaView.setRegion(regiao, animated: true)
                self.mapaView.addAnnotation(pinAluno)
            }
        }
    }
    
    func configuraPinMap(title: String, localization: CLPlacemark) -> MKPointAnnotation{
        let pin = MKPointAnnotation()
        pin.title = title
        pin.coordinate = localization.location!.coordinate
        return pin
    }

}
