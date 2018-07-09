//
//  ViewController.swift
//  CodableDemo
//
//  Created by Bari Abdul on 7/9/18.
//  Copyright © 2018 Bari Abdul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    struct CodableDemo: Decodable {
        let login: String
        let followers: Int
        let avatar_url: String
        let public_repos: Int
    }
    
//    private enum CodingKeys: String, CodingKey {
//        case name = "login"
//        case followers
//        case repos = "public_repos"
//        case avatarUrl = "avatar_url"
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        guard let gitUrl = URL(string: "https://api.github.com/users/bariabdul") else { return }
        
        URLSession.shared.dataTask(with: gitUrl) { (data, response, error) in
            guard let data = data else { return }

            //print the data using utf8 standard
            //let dataString = String(data: data, encoding: .utf8)
           //print(dataString)
            
            
            do {
                //this was in swift 2 and 3
//                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else { return }
//                //print(json)
//                let result = CodableDemo(json: json)
//                print(result.name)
                
                //Swift 4
                let code = try JSONDecoder().decode(CodableDemo.self, from: data)
                print(code.login)
                print(code.followers)
                print(code.avatar_url)
                print(code.public_repos)
            } catch let err {
                print("Error ", err)
            }
            
            
//            do {
//                let decoder = JSONDecoder()
//
//                let gitData = try decoder.decode(CodableDemo.self, from: data)
//                print(gitData.name)
//            } catch let err {
//                print("Error - ", err)
//            }
        }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

