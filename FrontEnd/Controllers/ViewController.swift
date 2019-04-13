//
//  ViewController.swift
//  FlickrRocket
//
//  Created by Jason Howard Kendall on 4/7/19.
//  Copyright © 2019 Jason Howard Kendall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionMain: UICollectionView!
    
    var picURL: [String] = []
    var picTitle: [String] = []
    
    @IBOutlet weak var activityInd: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // loadDate()
        fetchDate()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func fetchDate() {
        
    // JSON request and supporting connection
        var request = URLRequest(url: URL(string: APIConstants.FETCHPHOTO)!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        activityInd.startAnimating()
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! [String: Any]
                print(json)
                if let dic = json["photos"] as? [String: Any] {
                    print(dic)
                    
                    
     // Questions to server
                    if let photos = dic["photo"] as? NSArray {
                        print(photos)
                        for photo in photos {
                            print(photo)
                            if let dictionary = photo as? [String: Any] {
                                print(dictionary)
                                
                                if let server = dictionary["server"] {
                                    if let id = dictionary["id"] {
                                        if let secrete = dictionary["secret"] {
                                            let url = "https://farm9.static.flickr.com/\(server)/\(id)_\(secrete).jpg"
                                            print(url)
                                            self.picURL.append(url)
                                            if let title = dictionary["title"] {
                                                self.picTitle.append("\(title)")
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    DispatchQueue.main.async {
                        self.collectionMain.reloadData()
                        self.activityInd.stopAnimating()
                    }
                }
               // Handle error
            } catch {
                self.activityInd.stopAnimating()
                let alert = Utility.showAlert(message: error.localizedDescription)
                self.present(alert, animated: true, completion: nil)
                print("error")
            }
        })
        
        task.resume()
        
    }
    
}


// Handling colleciton view cells/images
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return picURL.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let controller = storyboard?.instantiateViewController(withIdentifier: ViewControllerIdentifiers.IMAGECONTROLLER) as! ImageController
        controller.imageTitle = picTitle[indexPath.row]
        controller.imgURL = picURL[indexPath.row]
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.COLLECTIONMAIN, for: indexPath) as! CollectionCell
        
        cell.imgProfile.loadImageUsingCacheWithUrlString(picURL[indexPath.row])
        
        return cell
    }
}

