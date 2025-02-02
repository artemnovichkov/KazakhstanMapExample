//
//  Created by Artem Novichkov on 02.02.2025.
//

import SwiftUI
import Charts

struct FeaturePointMark: ChartContent {

    let featureData: FeatureData

    var body: some ChartContent {
        PointMark(x: .value("x", featureData.center.longitude),
                  y: .value("y", featureData.center.latitude))
        .symbol {
            Circle()
                .stroke(.white, lineWidth: 8)
                .fill(.blue)
                .frame(width: 20, height: 20)

        }
        .annotation(position: .top, alignment: .center, spacing: 4) {
            if let name = featureData.name {
                Text(name)
                    .font(.caption2)
            }
        }
        .annotation(position: .bottom, alignment: .center, spacing: 4) {
            Text(featureData.population, format: .number)
                .font(.caption2)
        }
    }
}
