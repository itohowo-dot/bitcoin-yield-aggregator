;; Title: Bitcoin Yield Aggregator (BYA)

;; Summary:
;; A secure and efficient yield aggregation protocol for Bitcoin, built on Stacks Layer 2.
;; Enables users to maximize their Bitcoin returns through diversified yield strategies
;; while maintaining self-custody and security.

;; Description:
;; The Bitcoin Yield Aggregator (BYA) is a next-generation DeFi protocol that:
;; - Aggregates yield opportunities across multiple Stacks and Bitcoin protocols
;; - Implements risk management through allocation limits and protocol validation
;; - Ensures transparent yield calculation and efficient capital utilization
;; - Maintains strict security standards for Bitcoin compatibility
;; - Provides automated yield optimization with minimal gas costs
;; - Features emergency protocol deactivation for risk mitigation

;; Security Considerations:
;; - All operations maintain Bitcoin-level security guarantees
;; - Implements strict access controls and input validation
;; - Features protocol-level circuit breakers
;; - Enforces allocation limits to prevent concentration risk
;; - Includes emergency shutdown functionality

;; Constants and Error Codes
(define-constant ERR-UNAUTHORIZED (err u1))
(define-constant ERR-INSUFFICIENT-FUNDS (err u2))
(define-constant ERR-INVALID-PROTOCOL (err u3))
(define-constant ERR-WITHDRAWAL-FAILED (err u4))
(define-constant ERR-DEPOSIT-FAILED (err u5))
(define-constant ERR-PROTOCOL-LIMIT-REACHED (err u6))
(define-constant ERR-INVALID-INPUT (err u7))

;; Protocol Configuration
(define-constant CONTRACT-OWNER tx-sender)
(define-constant MAX-PROTOCOLS u5)
(define-constant MAX-ALLOCATION-PERCENTAGE u100)
(define-constant BASE-DENOMINATION u1000000)  ;; 6 decimal places for precision
(define-constant MAX-PROTOCOL-NAME-LENGTH u50)
(define-constant MAX-BASE-APY u10000)         ;; 100.00%
(define-constant MAX-DEPOSIT-AMOUNT u1000000000)

;; Data Maps
(define-map supported-protocols 
    {protocol-id: uint} 
    {
        name: (string-ascii 50),
        base-apy: uint,
        max-allocation-percentage: uint,
        active: bool
    }
)