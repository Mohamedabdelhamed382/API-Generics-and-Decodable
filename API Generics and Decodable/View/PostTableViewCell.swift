//
//  PostTableViewCell..swift
//  API Generics and Decodable
//
//  Created by MOHAMED ABD ELHAMED AHMED on 29/11/2021.
//  Copyright © 2021 MOHAMED ABD ELHAMED AHMED. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
