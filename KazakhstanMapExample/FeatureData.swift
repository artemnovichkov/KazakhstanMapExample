//
//  Created by Artem Novichkov on 02.02.2025.
//

import MapKit

struct FeatureData: Identifiable {

    let id: String
    let coordinates: [CLLocationCoordinate2D]
    let center: CLLocationCoordinate2D
    let name: String?
    var population: Int = 0

    init?(feature: MKGeoJSONFeature) {
        guard let properties = feature.properties,
              let polygon = feature.geometry.first as? MKPolygon else {
            return nil
        }
        id = feature.identifier ?? UUID().uuidString
        coordinates = polygon.coordinates
        center = polygon.center
        let propertiesData = try? JSONDecoder().decode([String: String].self, from: properties)
        name = propertiesData?["name:en"]
        if let rawPopulation = propertiesData?["population"], let population = Int(rawPopulation) {
            self.population = population
        }
    }
}
