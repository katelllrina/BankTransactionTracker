//
//  TransactionsViewController.swift
//  BankTransactionTracker
//
import UIKit

final class TransactionsViewController: UIViewController, UITableViewDataSource{
    
    private let balanceLabel = UILabel()
    
    private let totalBalanceLabel = UILabel()
    
    private let demoAccountLabel = UILabel()
    
    private let transactionCountLabel = UILabel()
    
    let transactionsTableView = UITableView()
    
    private let balanceCardView = UIView()
    
    var transactions = [
        BankTransaction(name: "Tesco", amount: -32.50,
                    date: Calendar.current.date(from: DateComponents(year: 2026, month: 10, day: 30))!),

        BankTransaction(name: "Netflix", amount: -12.99,
                    date: Calendar.current.date(from: DateComponents(year: 2026, month: 10, day: 29))!),

        BankTransaction(name: "Coffee", amount: -4.50,
                    date: Calendar.current.date(from: DateComponents(year: 2026, month: 10, day: 28))!),

        BankTransaction(name: "Salary", amount: 2500.00,
                    date: Calendar.current.date(from: DateComponents(year: 2026, month: 10, day: 25))!),

        BankTransaction(name: "Amazon", amount: -45.99,
                    date: Calendar.current.date(from: DateComponents(year: 2026, month: 10, day: 23))!)
    ]
    
    
    
    //viewDidLoad
    
    override func viewDidLoad() {
        transactionsTableView.dataSource = self
        super.viewDidLoad()
        
        let appNameLabel = UILabel()
        appNameLabel.text = "BANK TRANSACTION TRACKER"
        appNameLabel.font = .systemFont(ofSize: 11, weight: .semibold)
        appNameLabel.textColor = UIColor(
            red: 0.57,
            green: 0.69,
            blue: 0.88,
            alpha: 1
        )
        appNameLabel.translatesAutoresizingMaskIntoConstraints = false

        let titleLabel = UILabel()
        titleLabel.text = "Transactions"
        titleLabel.font = .systemFont(ofSize: 38, weight: .bold)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(appNameLabel)
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            appNameLabel.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 12
            ),
            appNameLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),

            titleLabel.topAnchor.constraint(
                equalTo: appNameLabel.bottomAnchor,
                constant: 6
            ),
            titleLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            )
        ])
        
        navigationItem.title = "Bank Transaction Tracker"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem (
            barButtonSystemItem: .add,
            target: self,
            action: #selector(openAddBankTransaction)
        )
        
       
     
        balanceLabel.textAlignment = .center
        balanceLabel.textColor = .white
        
        let balanceCardView = UIView()
        
        let balanceGradient = CAGradientLayer()

        balanceGradient.colors = [
            UIColor(red: 0.071, green: 0.412, blue: 0.639, alpha: 1).cgColor,
            UIColor(red: 0.063, green: 0.173, blue: 0.349, alpha: 1).cgColor
        ]

        balanceGradient.startPoint = CGPoint(x: 0, y: 0)
        balanceGradient.endPoint = CGPoint(x: 1, y: 1)

        balanceGradient.cornerRadius = 16

        balanceCardView.layer.insertSublayer(
            balanceGradient,
            at: 0
        )
        
        balanceCardView.backgroundColor = UIColor(
            red: 0.03,
            green: 0.26,
            blue: 0.61,
            alpha: 1
        )
        balanceCardView.layer.cornerRadius = 16
    

        totalBalanceLabel.text = "Total Balance"
        totalBalanceLabel.textColor = .white
        totalBalanceLabel.font = .systemFont(ofSize: 16, weight: .medium)

        demoAccountLabel.text = "Demo Account"
        demoAccountLabel.textColor = .white.withAlphaComponent(0.7)
        demoAccountLabel.font = .systemFont(ofSize: 13)

        balanceLabel.textColor = .white
        balanceLabel.textAlignment = .left
        balanceLabel.font = .systemFont(ofSize: 32, weight: .bold)
        
        balanceCardView.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(balanceCardView)
        balanceCardView.addSubview(balanceLabel)
        totalBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        demoAccountLabel.translatesAutoresizingMaskIntoConstraints = false

        balanceCardView.addSubview(totalBalanceLabel)
        balanceCardView.addSubview(demoAccountLabel)
        
        NSLayoutConstraint.activate([
            balanceCardView.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: 20
            ),
            balanceCardView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),
            balanceCardView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            ),
            
            balanceCardView.heightAnchor.constraint(
                equalToConstant: 130
            ),
            
            totalBalanceLabel.topAnchor.constraint(
                equalTo: balanceCardView.topAnchor,
                constant: 20
            ),
            totalBalanceLabel.leadingAnchor.constraint(
                equalTo: balanceCardView.leadingAnchor,
                constant: 20
            ),

            balanceLabel.topAnchor.constraint(
                equalTo: totalBalanceLabel.bottomAnchor,
                constant: 8
            ),
            balanceLabel.leadingAnchor.constraint(
                equalTo: balanceCardView.leadingAnchor,
                constant: 20
            ),
            balanceLabel.trailingAnchor.constraint(
                lessThanOrEqualTo: balanceCardView.trailingAnchor,
                constant: -20
            ),

            demoAccountLabel.topAnchor.constraint(
                equalTo: balanceLabel.bottomAnchor,
                constant: 8
            ),
            demoAccountLabel.leadingAnchor.constraint(
                equalTo: balanceCardView.leadingAnchor,
                constant: 20
            )
        ])
       

        view.backgroundColor = UIColor(
            red: 0.035,
            green: 0.075,
            blue: 0.15,
            alpha: 1
        )
        
        
        navigationItem.title = ""
        navigationItem.largeTitleDisplayMode = .never
        
        let sectionLabel = UILabel()
        sectionLabel.text = "Recent Transactions"
        sectionLabel.textColor = .white
        sectionLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        sectionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sectionLabel)
        
        NSLayoutConstraint.activate([
            sectionLabel.topAnchor.constraint(
                equalTo: balanceCardView.bottomAnchor,
                constant: 24
            ),
            
            sectionLabel.leadingAnchor.constraint(
                equalTo: balanceCardView.leadingAnchor
            ),
        ])
        
        
        transactionsTableView.translatesAutoresizingMaskIntoConstraints = false
        transactionsTableView.backgroundColor = .clear
        transactionsTableView.separatorStyle = .none
        transactionsTableView.backgroundView = nil
        
        view.addSubview(transactionsTableView)
       
        
        NSLayoutConstraint.activate([
            transactionsTableView.topAnchor.constraint(
                equalTo: sectionLabel.bottomAnchor,
                constant: 12
            ),
            
            transactionsTableView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),
            
            transactionsTableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            ),
            transactionsTableView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            )
            
        ])
        
        
        //
        transactionCountLabel.textColor = UIColor(
            red: 0.65,
            green: 0.75,
            blue: 0.90,
            alpha: 1
        )
        transactionCountLabel.font = .systemFont(ofSize: 13)
        transactionCountLabel.textAlignment = .right
        transactionCountLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(transactionCountLabel)
        NSLayoutConstraint.activate([
            transactionCountLabel.centerYAnchor.constraint(
                equalTo: sectionLabel.centerYAnchor
            ),
            transactionCountLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            )
        ])
        
        
        
        
        
        updateBalance()
        updateTransactionCount()
        
        
       

    } //end viewDidLoad()
    
    
    //gradient
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        for layer in balanceCardView.layer.sublayers ?? [] {
            if let gradient = layer as? CAGradientLayer {
                gradient.frame = balanceCardView.bounds
            }
        }
    }
    
    
 //first method
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int)
    -> Int {
        
        print("Number of transactions:", transactions.count)
        
        return transactions.count
    }
    
    //second method
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        let cell = TransactionCell(
            style: .default ,
            reuseIdentifier: "TransactionCell"
        )
        
        let transaction = transactions[indexPath.row]
        
        cell.nameLabel.text = transaction.name
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        cell.dateLabel.text = dateFormatter.string(from: transaction.date)
        
        let formattedAmount = abs(transaction.amount).formatted(
            .number
                .precision(.fractionLength(2))
                .locale(Locale(identifier: "en_GB"))
        )
            
            if transaction.amount < 0 {
                cell.amountLabel.text = "-£\(formattedAmount)"
                cell.amountLabel.textColor = .systemRed
            } else {
                cell.amountLabel.text = "+£\(formattedAmount)"
                cell.amountLabel.textColor = .systemGreen
            }
        
    
        return cell
    }
    
    @objc private func openAddBankTransaction() {
        let addVC = AddTransactionViewController()

        addVC.onSave = { [weak self] transaction in
            guard let self = self else { return }

            self.transactions.insert(transaction, at: 0)
            self.transactionsTableView.reloadData()
            self.updateBalance()
            self.updateTransactionCount()
        }

        navigationController?.pushViewController(
            addVC,
            animated: true
        )
    }
    
    //adds together the amounts of all transactions
    
    private func updateBalance() {
        let balance = transactions.reduce(0.0) { total, transaction in
            total + transaction.amount
        }

        balanceLabel.text = balance.formatted(
            .currency(code: "GBP")
        )
    }
    
    
    // Update the transaction count
    private func updateTransactionCount() {
        let count = transactions.count
        transactionCountLabel.text = "\(count) transactions"
    }
    
    
    
    
    
}

