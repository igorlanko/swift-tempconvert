//
//  ContentView.swift
//  ConvertTemp
//
//  Created by stranger on 2023-09-25.
//

import SwiftUI

struct ContentView: View {
	@State private var convertFrom: String = "C"
	@State private var convertTo: String = "K"
	
	@State private var initialValue: Double = 0
	let units = ["C", "F", "K"]
	
	var result: Double {
		var finalNumber: Double = 0
		
		switch(convertFrom, convertTo) {
		case("C", "F"):
			finalNumber = (initialValue * 9/5) + 32
		case("C", "K"):
			finalNumber = initialValue + 273.15
		case("F", "C"):
			finalNumber = (initialValue - 32) * 5/9
		case("F", "K"):
			finalNumber = (initialValue - 32) * 5/9 + 273.15
		case("K", "C"):
			finalNumber = initialValue - 273.15
		case("K", "F"):
			finalNumber = (initialValue - 273.15) * 9/5 + 32
		default:
			return 0
		}
		
		return finalNumber
	}
	
    var body: some View {
		NavigationView {
			Form {
				Section {
					Picker("Initial unit", selection: $convertFrom) {
						ForEach(units, id: \.self) {
							Text("\($0)º")
						}
					}
					TextField("\(convertFrom)", value: $initialValue, format: .number)
				} header: {
					Text("Convert from")
				}
				Section {
					Picker("Final unit", selection: $convertTo) {
						ForEach(units, id: \.self) {
							Text("\($0)º")
						}
					}
					Text(result, format: .number)
				} header: {
					Text("Output")
				}
			}
		}
    }
}

#Preview {
    ContentView()
}
