//
//  Stats.swift
//  Dex3
//
//  Created by Raghavendra Mirajkar on 30/05/24.
//

import SwiftUI
import CoreData
import Charts

struct Stats: View {
    @EnvironmentObject var pokemon : Pokemon
    
    var body: some View {
        Chart(pokemon.stats) { stat in
            BarMark(
                x: .value("Vale", stat.value),
                y: .value("Stat", stat.label)
            )
            .annotation(position: .trailing) {
                Text("\(stat.value)")
                    .font(.caption)
                    .padding(.top, -5)
                    .foregroundColor(.secondary)
            }
        }
        .frame(height: 250)
        .padding([.leading, .bottom, .trailing])
        .foregroundStyle(Color(pokemon.types![0].capitalized))
        .chartXScale(domain: 0...pokemon.highestStat.value + 10)
    }
}

#Preview {
    Stats()
        .environmentObject(SamplePokemon.samplePokemon)
}
