//
//  CustomCell.swift
//  uitableview_load_data_from_json
//
//  Created by albert on 7/14/15.
//  Copyright (c) 2015 KaleidosStudio. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    
    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var commentTextMan: UITextField!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setCell(leftLabelText : String, rightLabelInt: Int, comment_text: String, imageName: String){
        
        self.username.text = leftLabelText
        
        self.commentTextMan.text = comment_text
        self.myImageView.image = UIImage(named: imageName)
        
    }//end func

}
