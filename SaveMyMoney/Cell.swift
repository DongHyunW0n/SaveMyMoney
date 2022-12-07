//
//  Cell.swift
//  SaveMyMoney
//
//  Created by WonDongHyun on 2022/12/07.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var cellTypeLabel: UILabel!
    
    @IBOutlet weak var cellAmountLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
