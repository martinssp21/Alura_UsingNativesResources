//
//  Localizacao.swift
//  Agenda
//
//  Created by Rodrigo Martins on 08/05/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit
import MapKit

class Localizacao: NSObject, MKMapViewDelegate {
    func converterEnderecoEmCoordenadas(endereco: String, local:@escaping(_ local: CLPlacemark)-> Void){
        let conversor = CLGeocoder()
        conversor.geocodeAddressString(endereco) {(listaDeLocalizacoes, error) in
            if let localizacao = listaDeLocalizacoes?.first{
               local(localizacao)
            }
        }
    }

    func configuraPinMap(title: String, localization: CLPlacemark, cor: UIColor?, icone: UIImage?) -> Pino{
        let pin = Pino(coordenada: localization.location!.coordinate)
        pin.title = title
        pin.color = cor
        pin.icon = icone
        return pin
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is Pino {
            let annotationView = annotation as! Pino
            var pinoView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationView.title!) as? MKMarkerAnnotationView
            pinoView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: annotationView.title!)
            
            pinoView?.annotation = annotationView
            pinoView?.glyphImage = annotationView.icon
            pinoView?.markerTintColor = annotationView.color
            return pinoView
        }
        return nil
    }
}
