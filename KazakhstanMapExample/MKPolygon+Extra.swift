//
//  Created by Artem Novichkov on 02.02.2025.
//

import MapKit

extension MKPolygon {

    var coordinates: [CLLocationCoordinate2D] {
        var coordinates = [CLLocationCoordinate2D](repeating: kCLLocationCoordinate2DInvalid,
                                                   count: pointCount)
        getCoordinates(&coordinates, range: NSRange(location: 0, length: pointCount))
        return coordinates
    }

    /// The algorithm of center calculation is trivial and may not work for regions with complex shapes
    var center: CLLocationCoordinate2D {
        var minLat = CLLocationDegrees.greatestFiniteMagnitude
        var minLng = CLLocationDegrees.greatestFiniteMagnitude
        var maxLat = -CLLocationDegrees.greatestFiniteMagnitude
        var maxLng = -CLLocationDegrees.greatestFiniteMagnitude

        for coordinate in coordinates {
            minLat = min(minLat, coordinate.latitude)
            minLng = min(minLng, coordinate.longitude)
            maxLat = max(maxLat, coordinate.latitude)
            maxLng = max(maxLng, coordinate.longitude)
        }
        return CLLocationCoordinate2D(latitude: (minLat + maxLat) / 2,
                                      longitude: (minLng + maxLng) / 2)
    }
}
