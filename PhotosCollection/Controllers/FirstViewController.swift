//
//  ViewController.swift
//  PhotosCollection
//
//  Created by Nodirbek on 27/04/22.
//

import UIKit

class FirstViewController: UIViewController {

    let sectionTitles: [String] = ["Photo of New York","Photo of Programmers" ,"Photo of basketball players",  "Swimming"]
    
    private var photos: [Results] = [Results]()
    
    private let homeTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        view.addSubview(homeTableView)
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        homeTableView.frame = view.bounds
    }
    

}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else { return UITableViewCell() }
        
        switch indexPath.section {
        case 0:
            APICaller.shared.getPhotos(query: "New York"){[weak self] result in
                switch result{
                case .success(let photos):
                        self?.photos = photos
                        cell.configure(with: photos)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            
            }
        case 1:
            APICaller.shared.getPhotos(query: "programmers"){[weak self] result in
                switch result{
                case .success(let photos):
                        self?.photos = photos
                        cell.configure(with: photos)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case 2:
            APICaller.shared.getPhotos(query: "basketball"){[weak self] result in
                switch result{
                case .success(let photos):
                        self?.photos = photos
                        cell.configure(with: photos)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case 3:
            APICaller.shared.getPhotos(query: "swim"){[weak self] result in
                switch result{
                case .success(let photos):
                        self?.photos = photos
                        cell.configure(with: photos)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case 4:
            APICaller.shared.getPhotos(query: "god"){[weak self] result in
                switch result{
                case .success(let photos):
                        self?.photos = photos
                        cell.configure(with: photos)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        default:
            return UITableViewCell()
        }

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
}

