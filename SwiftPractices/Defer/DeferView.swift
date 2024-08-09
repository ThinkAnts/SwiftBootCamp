//
//  DeferView.swift
//  SwiftPractices
//
//  Created by Ravi Kishore on 09/08/24.
//

import SwiftUI

enum Status: String {
  case operational = "Operational"
  case critical = "Critical"
}

final class DeferViewModel: ObservableObject {
  
  @Published var networkStatus: Status = .operational
  @Published var serverStatus: Status = .operational
  @Published var isLoading = false
  
  func saveData() {
    isLoading = true
    
    defer {
      isLoading = false
    }
    
    let networkStatus = checkNetworkStatus()
    guard networkStatus == .operational else { return }
    
    print("Network Status is Operational")
    
    let serverStatus = checkServerStatus()
    guard serverStatus == .operational else { return }
    
    print("Server Status is Operational")
    
    saveDataToDatBase()
  }
  
  func saveDataToDatBase() {
    print("Save Data To Database")
  }
  
  func checkNetworkStatus() -> Status {
    self.networkStatus = .operational
    return self.networkStatus
  }
  
  func checkServerStatus() -> Status {
    self.serverStatus = .operational
    return self.serverStatus
  }
  
  
  
  
}


struct DeferView: View {
  
  @StateObject var viewModel = DeferViewModel()
    var body: some View {
      VStack {
        if viewModel.isLoading {
             ProgressView()
        } else {
            Text("SaveData to database")
        }
      }.onAppear(perform: {
        viewModel.saveData()
      })

    }
}

#Preview {
    DeferView()
}
