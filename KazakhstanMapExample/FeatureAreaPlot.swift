//
//  Created by Artem Novichkov on 02.02.2025.
//

import Charts

struct FeatureAreaPlot: ChartContent {

    let featureData: FeatureData

    var body: some ChartContent {
        AreaPlot(featureData.coordinates,
                 x: .value("Longitude", \.longitude),
                 y: .value("Latitude", \.latitude),
                 stacking: .unstacked)
        .foregroundStyle(by: .value("Population", featureData.population))
    }
}
