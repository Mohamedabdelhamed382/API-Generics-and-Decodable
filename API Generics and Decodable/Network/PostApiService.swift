//
//  PostApiService.swift
//  API Generics and Decodable
//
//  Created by MOHAMED ABD ELHAMED AHMED on 30/11/2021.
//  Copyright © 2021 MOHAMED ABD ELHAMED AHMED. All rights reserved.
//

import Foundation
import Alamofire

class PostApiService{
    //singletone
    static let instance = PostApiService()
    
    //Generics Call API
    func getData<T: Decodable>(url: String, completion: @escaping (T?, Error?)-> Void){
            AF.request(url).responseJSON { (respones) in
                guard let data = respones.data else {return}
                switch respones.result {
                case .success(let value):
                    //in therw case
                    do{
                        //one line parsing
                    let posts = try JSONDecoder().decode(T.self, from: data)
                        completion(posts, nil)
                    }catch(let error){
                        // in case data is failer in parsing
                        completion(nil, error)
                        // error have three part (domain , user info , descripation ) , full error is recommanded
                        print(error)
                    }
    
                case .failure(let error):
                    // case internet connecation error
                    completion(nil , error)
                }
            }
        }

    //single call for one API 
    func getPosts(url: String, completion: @escaping (Posts?, Error?)-> Void){
        AF.request(url).responseJSON { (respones) in
            guard let data = respones.data else {return}
            switch respones.result {
            case .success(let value):
                //in therw case
                do{
                    //one line parsing
                let posts = try JSONDecoder().decode(Posts.self, from: data)
                    completion(posts,nil)
                }catch(let error){
                    // in case data is failer in parsing
                    completion(nil , error)
                    // error have three part (domain , user info , descripation ) , full error is recommanded
                    print(error)
                }

            case .failure(let error):
                // case internet connecation error
                completion(nil, error)
            }
        }
    }
}
