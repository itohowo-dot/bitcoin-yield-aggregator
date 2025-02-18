# Bitcoin Yield Aggregator (BYA)

A secure and efficient yield aggregation protocol built on Stacks Layer 2, enabling users to maximize their Bitcoin returns through diversified yield strategies while maintaining self-custody and security.

## Overview

The Bitcoin Yield Aggregator (BYA) is a next-generation DeFi protocol that aggregates yield opportunities across multiple Stacks and Bitcoin protocols. It features automated yield optimization, risk management, and strict security standards for Bitcoin compatibility.

## Features

- **Multi-Protocol Yield Aggregation**: Aggregate yields from various Stacks and Bitcoin protocols
- **Risk Management**: Built-in allocation limits and protocol validation
- **Transparent Yield Calculation**: Clear and efficient yield computation
- **Security-First Design**: Bitcoin-level security guarantees
- **Emergency Controls**: Protocol-level circuit breakers and emergency shutdown
- **Gas Optimization**: Efficient capital utilization with minimal gas costs

## Protocol Details

### Supported Protocols

The contract currently supports up to 5 yield-generating protocols, with initial support for:

1. Stacks Yield Protocol (5.00% APY, 20% max allocation)
2. Bitcoin Lightning Yield (7.50% APY, 30% max allocation)

### Technical Specifications

- Base Denomination: 6 decimal places (1,000,000)
- Maximum APY: 100.00%
- Maximum Deposit Amount: 1,000,000,000 base units
- Protocol Name Length: Maximum 50 characters

## Smart Contract Functions

### User Operations

#### Deposits

```clarity
(define-public (deposit (protocol-id uint) (amount uint)))
```

- Allows users to deposit funds into supported protocols
- Validates protocol status and allocation limits
- Updates user and protocol deposit records

#### Withdrawals

```clarity
(define-public (withdraw (protocol-id uint) (amount uint)))
```

- Enables withdrawal of deposits and accrued yield
- Calculates and includes earned yield
- Updates protocol total deposits

#### Yield Calculation

```clarity
(define-read-only (calculate-yield (protocol-id uint) (user principal)))
```

- Computes yield based on deposit amount and time
- Uses block height for time calculations
- Returns annualized yield adjusted for deposit duration

### Protocol Management

#### Adding Protocols

```clarity
(define-public (add-protocol
    (protocol-id uint)
    (name (string-ascii 50))
    (base-apy uint)
    (max-allocation-percentage uint)
))
```

- Restricted to contract owner
- Validates protocol parameters
- Enforces protocol limits and naming conventions

#### Protocol Deactivation

```clarity
(define-public (deactivate-protocol (protocol-id uint)))
```

- Emergency function for protocol deactivation
- Restricted to contract owner
- Maintains deposit integrity

## Security Features

### Access Control

- Contract owner authorization
- Function-level access restrictions
- Input validation on all operations

### Risk Management

- Maximum allocation percentages per protocol
- Protocol activation/deactivation controls
- Deposit amount limits
- Input validation and sanitization

### Data Integrity

- Strict type checking
- Error handling with specific error codes
- Transaction atomicity

## Error Codes

| Code | Description            |
| ---- | ---------------------- |
| u1   | Unauthorized access    |
| u2   | Insufficient funds     |
| u3   | Invalid protocol       |
| u4   | Withdrawal failed      |
| u5   | Deposit failed         |
| u6   | Protocol limit reached |
| u7   | Invalid input          |

## Development and Testing

### Prerequisites

- Stacks 2.0 development environment
- Clarity language knowledge
- Understanding of Bitcoin and Stacks protocols

### Deployment

1. Deploy contract to Stacks network
2. Initialize protocols using `initialize-protocols`
3. Verify protocol activation status
4. Test deposit and withdrawal functions

## Best Practices

### For Users

- Verify protocol status before deposits
- Monitor yield calculations regularly
- Understand allocation limits
- Keep track of deposit timestamps

### For Protocol Integration

- Implement proper error handling
- Validate all inputs
- Monitor total deposits
- Track protocol performance

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request
