//
//  MapView.swift
//  VacationInVegas
//
//  Created by Victor Vaz de Oliveira on 01/11/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var place: Place
    
    @State var position: MapCameraPosition
    
    var body: some View {
        Map(position: $position) {
            Annotation(place.interested ? "Place of Interest" : "Not Interested", coordinate: place.location) {
                ZStack {
                    RoundedRectangle(cornerRadius: 7)
                        .fill(.ultraThickMaterial)
                        .stroke(.secondary, lineWidth: 5)
                    
                    Image(systemName: place.interested ? "face.smiling" : "hand.thumbsdown")
                        .padding(5)
                }
                .onTapGesture {
                    place.interested.toggle()
                }
            }
        }
        .toolbarBackground(.automatic)
    }
}

#Preview {
    @Previewable @State var place = Place.previewPlaces[0]
    
    MapView(place: place, position: .camera(MapCamera(
        centerCoordinate: place.location,
        distance: 1000,
        heading: 250,
        pitch: 80
    )))
}
