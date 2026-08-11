CREATE TABLE IF NOT EXISTS transactions (
    transaction_id      VARCHAR(50) PRIMARY KEY,
    customer_id         VARCHAR(50),
    card_id             VARCHAR(50),
    merchant_id         VARCHAR(50),

    transaction_date    DATE,
    transaction_time    TIME,
    transaction_amount  NUMERIC(15,2),

    payment_method      VARCHAR(50),
    transaction_channel VARCHAR(50),
    device_type         VARCHAR(50),
    transaction_status  VARCHAR(50),

    is_international    NUMERIC,
    fraud_flag          NUMERIC,
    fraud_reason        VARCHAR(255),

    merchant_risk_level VARCHAR(50),
    merchant_category   VARCHAR(100),

    customer_state      VARCHAR(100),
    customer_city       VARCHAR(100),

    merchant_state      VARCHAR(100),
    merchant_city       VARCHAR(100),

    CONSTRAINT fk_txn_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    CONSTRAINT fk_txn_card
        FOREIGN KEY (card_id)
        REFERENCES cards(card_id),

    CONSTRAINT fk_txn_merchant
        FOREIGN KEY (merchant_id)
        REFERENCES merchants(merchant_id)
);