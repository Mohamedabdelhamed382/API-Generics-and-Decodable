//
//  PostsViewController.swift
//  API Generics and Decodable
//
//  Created by MOHAMED ABD ELHAMED AHMED on 01/12/2021.
//  Copyright © 2021 MOHAMED ABD ELHAMED AHMED. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var posts = Posts()
    var todo = Todos()
    let postsUrl = URL.url + Postsurl.posts
    let todoUrl = URL.url + Todosurl.todoUrl
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //happend once in memory
        declareTableView()
        bindMultiableDataType()
    }
    override func viewWillAppear(_ animated: Bool) {
        //refreash in every motion
        //bindData()
        bindMultiableDataType()
    }
    override func viewDidAppear(_ animated: Bool) {
        //refreash in every motion
        
    }
    
}
extension PostsViewController{
    // for Declear Table view in contllor
    func declareTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    //get data from API (postApiServiceFile)
    func bindData(){
        // to make UI not frezze you should headel queue of dipatch and call API in background
        // main queue for UI
        //background queue
        DispatchQueue.global(qos: .background).sync {
            PostApiService.instance.getPosts(url: postsUrl) { (posts, error) in
                if let error = error {
                    //aleart in main queue
                    print(error)
                }else {
                    guard let posts = posts else{return}
                    // self bec we are in closure
                    self.posts = posts
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    // Generics Func
    func bindMultiableDataType(){
        DispatchQueue.global(qos: .background).sync {
            PostApiService.instance.getData(url: todoUrl){ (todo: Todos?, error) in
                if let error = error {
                    print(error)
                        
                }else{
                    guard let data = todo else {return}
                        self.todo = data
                        self.tableView.reloadData()
                }
            }
        }
    }
}
extension PostsViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.lableCell, for: indexPath)as! PostTableViewCell
        cell.postLabel.text = todo[indexPath.row].title
        return cell
    }
}

