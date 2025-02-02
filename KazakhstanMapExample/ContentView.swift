//
//  Created by Artem Novichkov on 02.02.2025.
//

import SwiftUI
import Charts
import MapKit

struct ContentView: View {

    @State private var features: [FeatureData] = []

    var body: some View {
        Chart {
            ForEach(features) { featureData in
                FeatureAreaPlot(featureData: featureData)
            }
            ForEach(features) { featureData in
                FeatureLinePlot(featureData: featureData)
            }
            ForEach(features) { featureData in
                FeaturePointMark(featureData: featureData)
            }
        }
        .chartYScale(domain: 40...56)
        .chartXScale(domain: 40...95)
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
        .chartLegend(.hidden)
        .chartPlotStyle {
            $0.aspectRatio(2, contentMode: .fit)
        }
        .onAppear {
            do {
                let features = try loadFeatureData()
                self.features = features
            } catch {
                print("Error parsing GeoJSON: \(error)")
            }
        }
    }

    // MARK: - Private

    private func loadFeatureData() throws -> [FeatureData] {
        let url = Bundle.main.url(forResource: "kazakhstan",
                                  withExtension: "geojson")!
        let kazakhstanData = try Data(contentsOf: url)
        let features = try MKGeoJSONDecoder()
            .decode(kazakhstanData)
            .compactMap { geoJSONObject in
                if let feature = geoJSONObject as? MKGeoJSONFeature {
                    return FeatureData(feature: feature)
                }
                return nil
            }
        return features
    }
}

#Preview {
    ContentView()
}
