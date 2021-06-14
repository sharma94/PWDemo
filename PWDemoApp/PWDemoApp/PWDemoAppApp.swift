//
//  PWDemoAppApp.swift
//  PWDemoApp
//
//  Created by R M Sharma on 13/06/21.
//

import SwiftUI

@available(iOS 14.0, *)
struct PWDemoAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

@main
  struct PWDemoAppAppWrapper {
      static func main() {
          if #available(iOS 14.0, *) {
            PWDemoAppApp.main()
          }
          else {
              UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(SceneDelegate.self))
          }
      }
  }

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let contentView = ContentView()

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
