//
//  SearchController.swift
//  SongRepeat
//
//  Created by Alejandro La Rosa on 6/13/17.
//  Copyright © 2017 Alejandro La Rosa. All rights reserved.
//

import UIKit

class SearchController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 100)
        
        self.view.layer.cornerRadius = 10
        self.view.layer.masksToBounds = true
        
        self.view.layer.shadowColor = UIColor.black.cgColor
        self.view.layer.shadowOffset = CGSize(width: 20, height: 20)
        
        let key = "AIzaSyAvhVc7lbwv9-NPDdenDG9FVCU60voVC3U"
        
        let videoType = "loganpaul"
        
       // let youtubeApi = "https://www.googleapis.com/youtube/v3/videos?part=contentDetails%2C+snippet%2C+statistics&id=AKiiekaEHhI&key=\(key)"
        
        let urlString = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=\(videoType)&type=video&videoSyndicated=true&chart=mostPopular&maxResults=10&safeSearch=strict&order=relevance&order=viewCount&type=video&relevanceLanguage=en&regionCode=GB&key=\(key)"
        
        let url = NSURL(string: urlString)
        
        // Create your request
        let task = URLSession.shared.dataTask(with: url! as URL, completionHandler: { (data, response, error) -> Void in
            do {
                
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? [String : AnyObject] {
                    
                    print("Response from YouTube: \(jsonResult)")
                }
            }
            catch {
                print("json error: \(error)")
            }
            
        })
        
        // Start the request
        task.resume()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
