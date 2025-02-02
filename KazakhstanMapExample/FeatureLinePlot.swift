//
//  Created by Artem Novichkov on 02.02.2025.
//

import Charts

struct FeatureLinePlot: ChartContent {

    let featureData: FeatureData

    var body: some ChartContent {
        LinePlot(featureData.coordinates,
                 x: .value("Longitude", \.longitude),
                 y: .value("Latitude", \.latitude)
        )
        .lineStyle(.init(lineWidth: 1, lineCap: .round, lineJoin: .round))
        .foregroundStyle(by: .value("Feature", featureData.id))
    }
}
