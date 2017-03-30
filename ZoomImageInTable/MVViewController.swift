//
//  ViewController.swift
//  ZoomImageInTable
//
//  Created by Max Vasilevsky on 3/30/17.
//  Copyright © 2017 Max Vasilevsky. All rights reserved.
//

import UIKit

class MVViewController: UIViewController,UITableViewDataSource {
    
    let imageDataArray = ["https://upload.wikimedia.org/wikipedia/commons/3/3f/Fronalpstock_big.jpg",
                          "https://www.datapipe.com/blog/wp-content/uploads/2015/12/big-data-will-drive-the-next-phase-of-innovation-in-mobile-computing.jpg",
                           "https://s-media-cache-ak0.pinimg.com/originals/b4/77/23/b4772340ae9c206149a0a7338767c530.jpg",
                           "https://upload.wikimedia.org/wikipedia/commons/5/5e/Big_Wood%2C_N2.JPG",
                           "https://upload.wikimedia.org/wikipedia/commons/d/d9/Big_Bear_Valley,_California.jpg"]
    
    let imageCache = NSCache<AnyObject, UIImage>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.imageDataArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ZoomImageCell") as! MVZoomImageCell
        let urlString = self.imageDataArray[indexPath.row]
        if let image = self.imageCache.object(forKey:indexPath as AnyObject) {
            cell.bigImage?.image = image
        }else{
            cell.bigImage?.image = nil
            URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
                
                if error != nil {
                    print(error!)
                    return
                }
                DispatchQueue.main.async(execute: { () -> Void in
                    if let image = UIImage(data: data!) {
                        self.imageCache.setObject(image, forKey: indexPath as AnyObject)
                        if let cellForDownloadImage = tableView.cellForRow(at: indexPath)  as? MVZoomImageCell {
                            cellForDownloadImage.bigImage.image = image
                        }
                    }
                })
            }).resume()
        }
        return cell
    }
    
    
    


}

