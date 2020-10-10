//
//  CustomTableViewCell.swift
//  TestTableViewCellHeightResizing
//
//  Created by Sakurako Shimbori on 2020/10/09.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    var aspect:CGFloat!
    
    override func systemLayoutSizeFitting(
      _ targetSize: CGSize,
      withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority,
        verticalFittingPriority: UILayoutPriority
    ) -> CGSize {
      var size = super.systemLayoutSizeFitting(
          targetSize,
          withHorizontalFittingPriority: horizontalFittingPriority,
          verticalFittingPriority: verticalFittingPriority
      )
        size.height = size.width/aspect
        print("systemLayoutSizeFitting")
        print(aspect!)
      return size
    }
    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var cellAspect: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.autoresizingMask = .flexibleHeight
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)    }
    func setImage(image: UIImage){
        print("setImage")
        aspect = (image.size.width)/(image.size.height)
        print(aspect!)
        postImageView.image = image
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        postImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/aspect).isActive = true
        postImageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        postImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        postImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        postImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        postImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
        
        postImageView.layer.borderColor = UIColor.red.cgColor
        postImageView.layer.borderWidth = 5
        contentView.layer.borderColor = UIColor.blue.cgColor
        contentView.layer.borderWidth = 5

//        print(contentView.autoresizingMask)
    }
}
