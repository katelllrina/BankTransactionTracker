# Bank Transaction Tracker

A simple iOS banking application built with **Swift and UIKit**, featuring a transaction list, income and expense tracking, and automatic balance updates.

This project was developed as a hands-on introduction to iOS application development using programmatic UIKit.

## Features

- Display a list of recent banking transactions.
- View the total account balance.
- Add new income and expense transactions.
- Automatically recalculate the balance when a transaction is added.
- Update the transaction list immediately.
- Navigate between screens using `UINavigationController`.
- Display transaction amounts in GBP (£).

## Tech Stack

- **Language:** Swift
- **Framework:** UIKit
- **Development Environment:** Xcode
- **UI:** Programmatic UIKit (without Storyboards)
- **Navigation:** UINavigationController
- **Transaction List:** UITableView

## Screenshots

<table>
  <tr>
    <td align="center" width="33%">
      <img src="https://github.com/user-attachments/assets/39684513-d4f0-4f8c-ba04-91d4bc06100b" width="100%" alt="Transactions Screen">
    </td>
    <td align="center" width="33%">
      <img src="https://github.com/user-attachments/assets/acb62a93-245f-4d35-9241-68d7f39239d7" width="100%" alt="Add Transaction Screen">
    </td>
    <td align="center" width="33%">
      <img src="https://github.com/user-attachments/assets/55d6dfc3-f7fc-4a0c-890d-4950e6ffc239" width="100%" alt="Updated Transactions Screen">
    </td>
  </tr>
  <tr>
    <td align="center">
      <strong>Transactions Overview</strong><br>
      View recent transactions and the total account balance.
    </td>
    <td align="center">
      <strong>Add Transaction</strong><br>
      Enter a transaction and select income or expense.
    </td>
    <td align="center">
      <strong>Live Balance Update</strong><br>
      See the new transaction and automatically recalculated balance.
    </td>
  </tr>
</table>

## Demo

A short demonstration of adding a transaction and updating the account balance will be added here.

## Current Limitations

Transaction data is currently stored in memory and resets when the application restarts.

## Future Improvements

- Persistent transaction storage
- MVVM architecture
- Transaction categories
- Transaction editing and deletion
- Improved input validation

## Project Status

**Version 1.0 — MVP**

A functional prototype demonstrating fundamental UIKit concepts, navigation, user input handling and dynamic UI updates.
