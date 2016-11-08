//
//  PostCell.swift
//  DevChat
//
//  Created by Dustin Hullett on 11/4/16.
//  Copyright © 2016 Dustin Hullett. All rights reserved.
//

import UIKit
import Firebase
class PostCell: UITableViewCell {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var caption: UITextView!
    @IBOutlet weak var likesLbl: UILabel!
    
    var post: Post!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(post: Post, img: UIImage? = nil) {
        self.post = post
        self.caption.text = post.caption
        self.likesLbl.text = "\(post.likes)"
        
        if img != nil {
            self.postImage.image = img
        } else {
            
            let ref = FIRStorage.storage().reference(forURL: post.imageUrl)
            ref.data(withMaxSize: 2 * 2024 * 2024, completion: { (data, error) in
                
                if error != nil {
                    print("DUSTIN: Unable to get image from Firebase storage")
                } else {
                    print("DUSTIN: Got image from Firebase Storage")
                    if let imageData = data {
                        if let img = UIImage(data: imageData) {
                            self.postImage.image = img
                            FeedVCViewController.imageCache.setObject(img, forKey: post.imageUrl as NSString)
                        }
                    }
                }
                
            })
        }
        
    }
    
}


