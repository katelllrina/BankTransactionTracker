import UIKit

final class TransactionCell:UITableViewCell {
    
    let nameLabel = UILabel()
    
    let dateLabel = UILabel()
    
    let amountLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        contentView.backgroundColor = UIColor(
            red: 0.09,
            green: 0.16,
            blue: 0.27,
            alpha: 1
        )
        
        contentView.layer.cornerRadius = 14
        contentView.layer.masksToBounds = true
        
        contentView.layer.borderWidth = 3
        contentView.layer.borderColor = UIColor(
            red: 0.035,
            green: 0.075,
            blue: 0.15,
            alpha: 1
        ).cgColor

        selectionStyle = .none
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = .systemFont(ofSize: 12)
        dateLabel.textColor = UIColor(
            red: 0.64,
            green: 0.73,
            blue: 0.86,
            alpha: 1
        )
        
        contentView.addSubview(dateLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 16, weight: .medium)
        nameLabel.textColor = .white
        
        contentView.addSubview(nameLabel)
        
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        amountLabel.textAlignment = .right
        
        contentView.addSubview(amountLabel)
        
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 16
            ),
            nameLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 10
            ),
            dateLabel.leadingAnchor.constraint(
                equalTo: nameLabel.leadingAnchor
            ),
            dateLabel.topAnchor.constraint(
                equalTo: nameLabel.bottomAnchor,
                constant: 4
            ),
            dateLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -10
            ),
            
            amountLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -16
            ),
            
            amountLabel.centerYAnchor.constraint(
                equalTo: contentView.centerYAnchor
            ),
            
            amountLabel.leadingAnchor.constraint(
                greaterThanOrEqualTo: nameLabel.trailingAnchor,
                constant: 12
            ),
            amountLabel.leadingAnchor.constraint(
                greaterThanOrEqualTo: dateLabel.trailingAnchor,
                constant: 12
            )


        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
}
