//
//  OBSService.swift
//  OBSMagic
//
//  Created by Marc Steele on 14/11/2025.
//

import Combine
import Foundation

enum OBSServiceState {
    case Idle
    case Starting
    case Authenticating
    case Running
    case Error
}

@MainActor
class OBSService: ObservableObject {
    static let shared = OBSService()
    private let urlSession = URLSession(configuration: .default)
    private var webSocketTask: URLSessionWebSocketTask?
    
    @Published
    var state: OBSServiceState = .Idle
    
    private var domain: String {
        UserDefaults.standard.string(forKey: Constants.settingsObsDomain) ?? "localhost"
    }
    
    func start() {
        if (state == .Authenticating || state == .Running || state == .Starting) {
            print("Can't start the OBS service as it's in the \(state) state")
            return
        }
        
        let url = "ws://\(domain):4455/"
        print("Starting OBS service at \(url)")
        DispatchQueue.main.async { self.state = .Authenticating }
        
        webSocketTask = urlSession.webSocketTask(with: URL(string: url)!)
        webSocketTask?.resume()
        readMessage()
    }
    
    private func readMessage() {
        webSocketTask?.receive { result in
            DispatchQueue.main.async {
                do {
                    switch result {
                    case .failure(let error):
                        print("Ran into an error on the websocket: \(error)")
                        self.state = .Error
                        self.webSocketTask?.cancel(with: .goingAway, reason: nil)
                    case .success(let message):
                        switch message {
                        case .data(let data):
                            let decoded = try JSONDecoder().decode(Message.self, from: data)
                            print("Decoded data message: \(decoded)")
                        case .string(let text):
                            let data = Data(text.utf8)
                            let decoded = try JSONDecoder().decode(Message.self, from: data)
                            print("Decoded text message: \(decoded)")
                        @unknown default:
                            print("Fook")
                        }
                        self.readMessage()
                    }
                } catch {
                    print("Something went wrong reading from the websocket. Error: \(error.localizedDescription)")
                }
                self.readMessage()
            }
        }
    }
    
    func stop() {
        if (state == .Idle || state == .Error) {
            print("Can't stop the OBS service as it's in the \(state) state")
            return
        }
        
        print("Stopping OBS service")
        DispatchQueue.main.async { self.state = .Idle }
    }
}

