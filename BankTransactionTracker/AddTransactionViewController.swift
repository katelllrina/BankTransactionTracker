import UIKit

final class AddTransactionViewController: UIViewController {
    
    let nameTextField = UITextField()
    let amountTextField = UITextField()
    let typeSegmentedControl = UISegmentedControl(
        items: ["Expense", "Income"]
    )
    
    var onSave: ((BankTransaction) -> Void)?
    
    let saveButton = UIButton (type: .system)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(
            red: 0.035,
            green: 0.075,
            blue: 0.15,
            alpha: 1
        )
        
        // Navigation title
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]

        // Text fields
        nameTextField.backgroundColor = UIColor(
            red: 0.09, green: 0.16, blue: 0.27, alpha: 1
        )
        nameTextField.textColor = .white
        nameTextField.tintColor = .white

        amountTextField.backgroundColor = UIColor(
            red: 0.09, green: 0.16, blue: 0.27, alpha: 1
        )
        amountTextField.textColor = .white
        amountTextField.tintColor = .white

        // Expense / Income
        typeSegmentedControl.selectedSegmentTintColor = UIColor(
            red: 0.071, green: 0.412, blue: 0.639, alpha: 1
        )
        typeSegmentedControl.setTitleTextAttributes(
            [.foregroundColor: UIColor.white],
            for: .selected
        )
        typeSegmentedControl.setTitleTextAttributes(
            [.foregroundColor: UIColor.white],
            for: .normal
        )

        // Save button
        saveButton.backgroundColor = UIColor(
            red: 0.071, green: 0.412, blue: 0.639, alpha: 1
        )
        saveButton.setTitleColor(.white, for: .normal)
        
        title = "Add Transaction"
        
        //Name 1
        nameTextField.placeholder = "e.g. Starbucks"
        nameTextField.borderStyle = .roundedRect
        nameTextField.font = .systemFont(ofSize: 16)
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameTextField)
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 30
            ),

            nameTextField.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),

            nameTextField.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            ),

            nameTextField.heightAnchor.constraint(
                equalToConstant: 50
            )
        ])
        
        //amount 2
        amountTextField.placeholder = "Amount (£)"
        amountTextField.borderStyle = .roundedRect
        amountTextField.font = .systemFont(ofSize: 16)
        amountTextField.keyboardType = .decimalPad

        amountTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(amountTextField)

        NSLayoutConstraint.activate([
            amountTextField.topAnchor.constraint(
                equalTo: nameTextField.bottomAnchor,
                constant: 20
            ),

            amountTextField.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),

            amountTextField.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            ),

            amountTextField.heightAnchor.constraint(
                equalToConstant: 50
            )
        ])
        
        //3 Segment
        typeSegmentedControl.selectedSegmentIndex = 0

        typeSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(typeSegmentedControl)

        NSLayoutConstraint.activate([
            typeSegmentedControl.topAnchor.constraint(
                equalTo: amountTextField.bottomAnchor,
                constant: 20
            ),

            typeSegmentedControl.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),

            typeSegmentedControl.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            ),

            typeSegmentedControl.heightAnchor.constraint(
                equalToConstant: 40
            )
        ])
        
        //4 button Save
        
        saveButton.setTitle("Save Transaction", for: .normal)
        saveButton.backgroundColor = .systemBlue
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.layer.cornerRadius = 12

        saveButton.addTarget(
            self,
            action: #selector(saveTransaction),
            for: .touchUpInside
        )

        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)

        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(
                equalTo: typeSegmentedControl.bottomAnchor,
                constant: 30
            ),
            saveButton.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),
            saveButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            ),
            saveButton.heightAnchor.constraint(
                equalToConstant: 50
            )
        ])
        
        let placeholderColor = UIColor(
            red: 0.68,
            green: 0.76,
            blue: 0.88,
            alpha: 1
        )

        nameTextField.attributedPlaceholder = NSAttributedString(
            string: "e.g. Starbucks",
            attributes: [.foregroundColor: placeholderColor]
        )

        amountTextField.attributedPlaceholder = NSAttributedString(
            string: "Amount (£)",
            attributes: [.foregroundColor: placeholderColor]
        )
        
    }
    
    @objc private func saveTransaction() {
        guard let name = nameTextField.text?
            .trimmingCharacters(in: .whitespacesAndNewlines),
              !name.isEmpty,
              let amountText = amountTextField.text,
              let amount = Double(amountText.replacingOccurrences(of: ",", with: ".")),
              amount > 0,
              amount.isFinite
        else {
            let alert = UIAlertController(
                title: "Invalid Input",
                message: "Enter a transaction name and a valid amount greater than zero.",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }

        let finalAmount = typeSegmentedControl.selectedSegmentIndex == 0
            ? -amount
            : amount

        let transaction = BankTransaction(
            name: name,
            amount: finalAmount,
            date: Date()
        )

        onSave?(transaction)
        navigationController?.popViewController(animated: true)
    }
}
