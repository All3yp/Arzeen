//
//  SceneDelegate.swift
//  Coffee
//
//  Created by Alley Pereira on 15/09/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

// swiftlint:disable vertical_whitespace
// swiftlint:disable line_length

import UIKit
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = TabBarViewController()
        window?.makeKeyAndVisible()
        window?.windowScene = windowScene
        
        // tenta ler variavel no UserDefaults (firstLaunchFlag)
        let firstLaunchFlag = UserDefaults.standard.bool(forKey: "firstLaunchFlag")
        
        // se firstLaunchFlag existir e for true, usuário já entrou pelo menos ma vez no App
            //faz nada
        // se nao,
        if !firstLaunchFlag {
            // mostra Onboarding
            let onBoarding = CollectionOnboardViewController()
            onBoarding.modalPresentationStyle = .fullScreen
            self.window?.rootViewController?.present(onBoarding, animated: true, completion: nil)
            
            // seta variavel firstLaunchFlag no UserDefults com valor true
            UserDefaults.standard.set(true, forKey: "firstLaunchFlag")
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see
        // `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}
