--run from apps
/*
drop user kmule cascade
/
CREATE USER kmule IDENTIFIED BY "wE!come123" DEFAULT TABLESPACE APPS_TS_TX_DATA profile APPIDS
/
GRANT CONNECT,CREATE session, RESOURCE TO kmule
/
GRANT UNLIMITED TABLESPACE TO kmule
/
*/
---Run From kmule
CREATE TABLE kmule.z_customer_batches
  (
    batch_id                 NUMBER,
    RECORDS_QUERIED          NUMBER,
    RECORDS_TRANSFERRED      NUMBER,
    min_trx_creation_date    DATE,
    max_trx_creation_date    DATE,
    min_trx_last_update_date DATE,
    max_trx_last_update_date DATE,
    processing_status        VARCHAR2(2),
    creation_date            DATE,
    last_update_date         DATE
  )
/
--------------------------------------------------------
--  DDL for Table Z_CUSTOMERS
--------------------------------------------------------
CREATE TABLE kmule.Z_customers
  (
    BATCH_ID                NUMBER,
    INTERFACE_ID            NUMBER,
    ORIG_SYSTEM_REFERENCE   VARCHAR2(50 BYTE),
    CRM_ID                  VARCHAR2(100 BYTE),
    CURRENCY_CODE           VARCHAR2(3 BYTE),
    EXTERNAL_ID             VARCHAR2(32 BYTE),
    STUDENT_ID              VARCHAR2(20 BYTE),
    CUSTOMER_NAME           VARCHAR2(255 BYTE),
    BILL_TO_ORIG_SYSTEM_REF VARCHAR2(32 BYTE),
    BILL_TO_FNAME           VARCHAR2(100 BYTE),
    BILL_TO_LNAME           VARCHAR2(100 BYTE),
    BILL_TO_ADDRESS1        VARCHAR2(255 BYTE),
    BILL_TO_ADDRESS2        VARCHAR2(255 BYTE),
    BILL_TO_CITY            VARCHAR2(40 BYTE),
    BILL_TO_STATE           VARCHAR2(40 BYTE),
    BILL_TO_ZIP             VARCHAR2(20 BYTE),
    BILL_TO_COUNTRY         VARCHAR2(40 BYTE),
    SHIP_TO_ORIG_SYSTEM_REF VARCHAR2(32 BYTE),
    SHIP_TO_FNAME           VARCHAR2(100 BYTE),
    SHIP_TO_LNAME           VARCHAR2(100 BYTE),
    SHIP_TO_ADDRESS1        VARCHAR2(255 BYTE),
    SHIP_TO_ADDRESS2        VARCHAR2(255 BYTE),
    SHIP_TO_CITY            VARCHAR2(40 BYTE),
    SHIP_TO_STATE           VARCHAR2(40 BYTE),
    SHIP_TO_ZIP             VARCHAR2(20 BYTE),
    SHIP_TO_COUNTRY         VARCHAR2(40 BYTE),
    PARENT_CUST_OWNER_ID    VARCHAR2(32 BYTE),
    Z_UPDATED_DATE          DATE,
    Z_CREATED_DATE          DATE,
    PARTY_ID                NUMBER,
    BILL_TO_PARTY_SITE_ID   NUMBER,
    SHIP_TO_PARTY_SITE_ID   NUMBER,
    ORIG_SYSTEM_NAME        VARCHAR2(15 BYTE),
    CREATION_DATE           DATE,
    PROCESS_STATUS          VARCHAR2(2 BYTE),
    ERROR_TEXT              VARCHAR2(255 BYTE)
  )
/
CREATE TABLE kmule.z_customer_errors
  (
    batch_id      NUMBER,
    object_id     VARCHAR2(32),
    error_text    VARCHAR2(4000),
    creation_date DATE,
    error_status  VARCHAR2(2)
  )
/
CREATE INDEX kmule.z_customers_acct_idx ON kmule.z_customers
  (
    ORIG_SYSTEM_REFERENCE,
    BILL_TO_ORIG_SYSTEM_REF,
    SHIP_TO_ORIG_SYSTEM_REF
  )
/
CREATE SEQUENCE kmule.Z_CUSTOMER_INTERFACE_S MINVALUE 1 INCREMENT BY 1
START WITH 1 CACHE 5 ORDER NOCYCLE
/
CREATE SEQUENCE kmule.Z_CUSTOMER_batches_S MINVALUE 1 INCREMENT BY 1
START WITH 1 NOCACHE ORDER NOCYCLE
/
grant all on kmule.Z_CUSTOMER_batches to apps
/
grant all on kmule.Z_CUSTOMERS to apps
/
grant all on kmule.z_customer_errors to apps
/
grant all on kmule.Z_CUSTOMER_INTERFACE_S to apps
/
grant all on kmule.Z_CUSTOMER_batches_S to apps
/
CREATE TABLE kmule.Z_subscription_BATCHES
  (
    BATCH_ID                 NUMBER,
    RECORDS_QUERIED          NUMBER,
    RECORDS_TRANSFERRED      NUMBER,
    min_trx_creation_date    DATE,
    max_trx_creation_date    DATE,
    min_trx_last_update_date DATE,
    max_trx_last_update_date DATE,
    PROCESSING_STATUS        VARCHAR2(20 BYTE),
    CREATION_DATE            DATE,
    LAST_UPDATE_DATE         DATE
  )
/
CREATE TABLE kmule.z_subscriptions
  (
    batch_id     NUMBER,
    interface_id NUMBER,
    --Native ZBill Data
    account_id               VARCHAR2(32),
    subscription_id          VARCHAR2(32),
    subscription_number      VARCHAR2(100),
    version                  NUMBER,
    status                   VARCHAR2(17),
    z_updated_date           DATE,
    z_created_date           DATE,
    notes                    VARCHAR2(500),
    ---Revenue Ready Flags----
    installment_billing_c CHAR(1),
    activate_assets_c     CHAR(1),
    payment_override_c    CHAR(1),
    enrollment_status_c   VARCHAR2(15),
    ---Transaction Details
    transaction_id_c   VARCHAR(32),
    transaction_code_c VARCHAR2(10),
    product_code_c     VARCHAR2(15),
    revenue_center_c   VARCHAR2(4),
    start_date_c       VARCHAR2(30),
    end_date_c         VARCHAR2(30),
    promo_code_c       VARCHAR2(15), --Potential TBD segment
    channel_c          VARCHAR2(10), --Delivery Type
    --Standard Audit feilds
    creation_date  DATE,
    process_status VARCHAR2(2),
    error_text     VARCHAR2(255)
  )
/
CREATE TABLE kmule.z_subscription_errors
  (
    batch_id      NUMBER,
    object_id     VARCHAR2(32),
    error_text    VARCHAR2(4000),
    creation_date DATE,
    error_status  VARCHAR2(2)
  )
/
CREATE INDEX kmule.z_subscriptions_idx ON kmule.z_subscriptions
  (
    subscription_id
  )
/
CREATE INDEX kmule.z_subscriptions_acct_idx ON kmule.z_subscriptions
  (
    account_id
  )
/
CREATE SEQUENCE kmule.Z_SUBSCRIPTION_INTERFACE_S MINVALUE 1 INCREMENT BY 1
START WITH 1 CACHE 5 ORDER NOCYCLE
/
CREATE SEQUENCE kmule.Z_subscription_batches_S MINVALUE 1 INCREMENT BY 1
START WITH 1 NOCACHE ORDER NOCYCLE
/
grant all on kmule.z_subscription_batches to apps
/
grant all on kmule.z_subscriptions to apps
/
grant all on z_subscription_errors to apps
/
grant all on kmule.Z_SUBSCRIPTION_INTERFACE_S to apps
/
grant all on kmule.Z_subscription_batches_S to apps
/
CREATE TABLE kmule.z_rate_plan_batches
  (
    batch_id                 NUMBER,
    RECORDS_QUERIED          NUMBER,
    RECORDS_TRANSFERRED      NUMBER,
    min_trx_creation_date    DATE,
    max_trx_creation_date    DATE,
    min_trx_last_update_date DATE,
    max_trx_last_update_date DATE,
    processing_status        VARCHAR2(2),
    creation_date            DATE,
    last_update_date         DATE
  )
/
CREATE TABLE kmule.Z_RATE_PLAN
  (
    BATCH_ID             NUMBER,
    INTERFACE_ID         NUMBER,
    RATE_PLAN_ID         VARCHAR2(32),
    RATE_PLAN_NAME       VARCHAR2(50),
    z_updated_date       DATE,
    z_created_date       DATE,
    PRODUCT_RATE_PLAN_ID VARCHAR2(32),
    SUBSCRIPTION_ID      VARCHAR2(32),
    process_status       VARCHAR2(2),
    creation_date        DATE,
    error_text           VARCHAR2(255)
  )
/
CREATE TABLE kmule.z_rate_plan_errors
  (
    batch_id      NUMBER,
    object_id     VARCHAR2(32),
    error_text    VARCHAR2(4000),
    creation_date DATE,
    error_status  VARCHAR2(2)
  )
/
CREATE INDEX kmule.z_rate_plan_idx ON kmule.z_rate_plan
  (
    rate_plan_id
  )
/
CREATE SEQUENCE kmule.Z_rate_plan_INTERFACE_S MINVALUE 1 INCREMENT BY 1
START WITH 1 CACHE 5 ORDER NOCYCLE
/
CREATE SEQUENCE kmule.Z_rate_plan_batches_S MINVALUE 1 INCREMENT BY 1
START WITH 1 NOCACHE ORDER NOCYCLE
/
grant all on kmule.z_rate_plan_batches to apps
/
grant all on kmule.z_rate_plan to apps
/
grant all on z_rate_plan_errors to apps
/
grant all on kmule.Z_rate_plan_INTERFACE_S to apps
/
grant all on kmule.Z_rate_plan_batches_S to apps

/
CREATE TABLE kmule.z_rate_plan_charge_batches
  (
    batch_id                 NUMBER,
    RECORDS_QUERIED          NUMBER,
    RECORDS_TRANSFERRED      NUMBER,
    min_trx_creation_date    DATE,
    max_trx_creation_date    DATE,
    min_trx_last_update_date DATE,
    max_trx_last_update_date DATE,
    processing_status        VARCHAR2(2),
    creation_date            DATE,
    last_update_date         DATE
  )
/
CREATE TABLE kmule.z_rate_plan_charge
  (
    batch_id                    NUMBER,
    interface_id                NUMBER,
    rate_plan_charge_id         VARCHAR2(32),
    rate_plan_id                VARCHAR2(32),
    charge_model                VARCHAR2(29),
    charge_number               VARCHAR2(50),
    name                        VARCHAR2(50),
    description                 VARCHAR2(500),
    Discount_Percentage         NUMBER,
    discount_amount             NUMBER,
    Quantity                    NUMBER,
    charge_type                 VARCHAR2(9),
    uom                         VARCHAR2(50),
    segment                     VARCHAR2(2),
    product_rate_plan_charge_id VARCHAR2(32),
    revrec_code                 VARCHAR2(70),
    revrec_trigger_condition    VARCHAR2(22),
    TriggerDate                 DATE,
    z_updated_date              DATE,
    z_created_date              DATE,
    price                       NUMBER(11,2),
    process_status              VARCHAR2(2),
    creation_date               DATE,
    error_text                  VARCHAR2(255)
  )
/
CREATE TABLE kmule.z_rate_plan_charge_errors
  (
    batch_id      NUMBER,
    object_id     VARCHAR2(32),
    error_text    VARCHAR2(4000),
    creation_date DATE,
    error_status  VARCHAR2(2)
  )
/
CREATE INDEX kmule.z_rate_plan_charge_idx ON kmule.z_rate_plan_charge
  (
    rate_plan_charge_id,
    rate_plan_id
  )
/
CREATE SEQUENCE kmule.Z_rate_plan_charge_INTERFACE_S MINVALUE 1 INCREMENT BY 1
START WITH 1 CACHE 5 ORDER NOCYCLE
/
CREATE SEQUENCE kmule.Z_rate_plan_charge_batches_S MINVALUE 1 INCREMENT BY 1
START WITH 1 NOCACHE ORDER NOCYCLE
/
grant all on kmule.z_rate_plan_charge_batches to apps
/
grant all on kmule.z_rate_plan_charge to apps
/
grant all on kmule.z_rate_plan_charge_errors to apps
/
grant all on kmule.Z_rate_plan_charge_INTERFACE_S to apps
/
grant all on kmule.Z_rate_plan_charge_batches_S to apps
/
CREATE TABLE kmule.Z_INVOICE_BATCHES
  (
    BATCH_ID                 NUMBER,
    RECORDS_QUERIED          NUMBER,
    RECORDS_TRANSFERRED      NUMBER,
    CONTROL_AMOUNT           NUMBER,
    min_trx_creation_date    DATE,
    max_trx_creation_date    DATE,
    min_trx_last_update_date DATE,
    max_trx_last_update_date DATE,
    PROCESSING_STATUS        VARCHAR2(20 BYTE),
    CREATION_DATE            DATE,
    LAST_UPDATE_DATE         DATE
  )
/
CREATE TABLE kmule.z_invoices
  (
    batch_id              NUMBER,
    interface_id          NUMBER,
    invoice_id            VARCHAR2(32),
    account_id            VARCHAR2(32),
    Amount                NUMBER(11,2),
    Adjustment_amount     NUMBER (11,2),
    balance_amount        NUMBER (11,2),
    credit_bal_adj_amount NUMBER(11,2),
    due_date              DATE,
    invoice_date          DATE,
    invoice_number        VARCHAR2(32),
    Payment_amount        NUMBER(11,2),
    posted_date           DATE,
    refund_amount         NUMBER(11,2),
    Status                VARCHAR2(8),
    z_updated_date        DATE,
    z_created_date        DATE,
    purchase_id_c         VARCHAR2(25),
    Transaction_Id_c      VARCHAR2(10),
    Receipt_Num_c         VARCHAR2(10),
    Journal_Number_c      VARCHAR2(25),
    process_status        VARCHAR2(2),
    creation_date         DATE,
    error_text            VARCHAR2(255)
  )
/
CREATE TABLE kmule.z_invoice_errors
  (
    batch_id      NUMBER,
    object_id     VARCHAR2(32),
    error_text    VARCHAR2(4000),
    creation_date DATE,
    error_status  VARCHAR2(2)
  )
/
CREATE INDEX kmule.z_invoices_z_idx ON kmule.z_invoices
  (
    invoice_id,
    account_id
  )
/
CREATE INDEX kmule.z_invoices_k_idx ON kmule.z_invoices
  (
    purchase_id_c,
    transaction_id_c,
    receipt_num_c
  )
/
CREATE SEQUENCE kmule.Z_invoice_INTERFACE_S MINVALUE 1 INCREMENT BY 1
START WITH 1 CACHE 5 ORDER NOCYCLE
/
CREATE SEQUENCE kmule.Z_invoice_batches_S MINVALUE 1 INCREMENT BY 1
START WITH 1 NOCACHE ORDER NOCYCLE
/
grant all on kmule.z_invoice_batches to apps
/
grant all on kmule.z_invoices to apps
/
grant all on kmule.z_invoice_errors to apps
/
grant all on kmule.Z_invoice_INTERFACE_S to apps
/
grant all on kmule.Z_invoice_batches_S to apps
/
CREATE TABLE kmule.Z_INVOICE_ITEM_BATCHES
  (
    BATCH_ID                 NUMBER,
    RECORDS_QUERIED          NUMBER,
    RECORDS_TRANSFERRED      NUMBER,
    CONTROL_AMOUNT           NUMBER,
    min_trx_creation_date    DATE,
    max_trx_creation_date    DATE,
    min_trx_last_update_date DATE,
    max_trx_last_update_date DATE,
    PROCESSING_STATUS        VARCHAR2(20 BYTE),
    CREATION_DATE            DATE,
    LAST_UPDATE_DATE         DATE
  )
/
CREATE TABLE kmule.z_invoice_items
  (
    batch_id            NUMBER,
    interface_id        NUMBER,
    invoice_id          VARCHAR2(32),
    invoice_item_id     VARCHAR2(32),
    subscription_id     VARCHAR2(32),
    product_id          VARCHAR2(32),
    charge_id           VARCHAR2(32),
    rate_plan_charge_id VARCHAR2(32),
    sku                 VARCHAR2(32),
    quantity            NUMBER (11,2),
    unit_price          NUMBER(11,2),
    charge_amount       NUMBER (11,2),
    charge_date         DATE,
    charge_number       VARCHAR2(50),
    processing_type     NUMBER,
    uom                 VARCHAR2(30),
    z_updated_date      DATE,
    z_created_date      DATE,
    process_status      VARCHAR2(2),
    creation_date       DATE,
    error_text          VARCHAR2(255)
  )
/
CREATE TABLE kmule.z_invoice_item_errors
  (
    batch_id      NUMBER,
    object_id     VARCHAR2(32),
    error_text    VARCHAR2(4000),
    creation_date DATE,
    error_status  VARCHAR2(2)
  )
/
CREATE INDEX kmule.z_invoice_items_z_idx ON kmule.z_invoice_items
  (
    invoice_id,
    invoice_item_id,
    subscription_id,
    product_id
  )
/
CREATE SEQUENCE kmule.Z_invoice_items_INTERFACE_S MINVALUE 1 INCREMENT BY 1
START WITH 1 CACHE 5 ORDER NOCYCLE
/
CREATE SEQUENCE kmule.Z_invoice_item_batches_S MINVALUE 1 INCREMENT BY 1
START WITH 1 NOCACHE ORDER NOCYCLE
/
grant all on kmule.z_invoice_item_BATCHES to apps
/
grant all on kmule.z_invoice_items to apps
/
grant all on kmule.z_invoice_item_errors to apps
/
grant all on kmule.Z_invoice_items_INTERFACE_S to apps
/
grant all on kmule.Z_invoice_item_batches_S to apps
/
CREATE TABLE kmule.Z_refund_BATCHES
  (
    BATCH_ID                 NUMBER,
    RECORDS_QUERIED          NUMBER,
    RECORDS_TRANSFERRED      NUMBER,
    CONTROL_AMOUNT           NUMBER,
    min_trx_creation_date    DATE,
    max_trx_creation_date    DATE,
    min_trx_last_update_date DATE,
    max_trx_last_update_date DATE,
    PROCESSING_STATUS        VARCHAR2(20 BYTE),
    CREATION_DATE            DATE,
    LAST_UPDATE_DATE         DATE
  )
/
CREATE TABLE kmule.z_refunds
  (
    batch_id           NUMBER,
    interface_id       NUMBER,
    refund_id          VARCHAR2(32),
    account_id         VARCHAR2(32),
    amount             NUMBER(11,2),
    method_type        VARCHAR2(30),
    payment_id         VARCHAR2(32),
    reason_code        VARCHAR2(32),
    refund_date        DATE,
    refund_number      VARCHAR2(50),
    status             VARCHAR2(10), --Filter for Processed only
    z_updated_date     DATE,
    z_created_date     DATE,
    Purchase_Id_c      VARCHAR2(25),
    Transaction_Code_c VARCHAR2(4),
    Receipt_Num_c      VARCHAR2(10),
    address1_c         VARCHAR2(100),
    Address2_c         VARCHAR2(100),
    City_c             VARCHAR2(60),
    State_Province_c   VARCHAR2(31),
    Zip_c              VARCHAR2(10),
    Country_c          VARCHAR2(45),
    process_status     VARCHAR2(2),
    creation_date      DATE,
    error_text         VARCHAR2(255)
  )
/
CREATE TABLE kmule.z_refund_errors
  (
    batch_id      NUMBER,
    object_id     VARCHAR2(32),
    error_text    VARCHAR2(4000),
    creation_date DATE,
    error_status  VARCHAR2(2)
  )
/
CREATE INDEX kmule.z_refunds_idx ON kmule.z_refunds
  (
    refund_id,
    account_id
  )
/
CREATE SEQUENCE kmule.Z_refunds_INTERFACE_S MINVALUE 1 INCREMENT BY 1
START WITH 1 CACHE 5 ORDER NOCYCLE
/
CREATE SEQUENCE kmule.Z_refund_batches_S MINVALUE 1 INCREMENT BY 1
START WITH 1 NOCACHE ORDER NOCYCLE
/
grant all on kmule.z_refund_batches to apps
/
grant all on kmule.z_refunds to apps
/
grant all on kmule.z_refund_errors to apps
/
grant all on kmule.Z_refunds_INTERFACE_S to apps
/
grant all on kmule.Z_refund_batches_S to apps
/
CREATE TABLE kmule.Z_payment_BATCHES
  (
    BATCH_ID                 NUMBER,
    RECORDS_QUERIED          NUMBER,
    RECORDS_TRANSFERRED      NUMBER,
    CONTROL_AMOUNT           NUMBER,
    min_trx_creation_date    DATE,
    max_trx_creation_date    DATE,
    min_trx_last_update_date DATE,
    max_trx_last_update_date DATE,
    PROCESSING_STATUS        VARCHAR2(20 BYTE),
    CREATION_DATE            DATE,
    LAST_UPDATE_DATE         DATE
  )
/
CREATE TABLE kmule.z_payments
  (
    batch_id            NUMBER,
    interface_id        NUMBER,
    payment_id          VARCHAR2(32),
    account_id          VARCHAR2(32),
    payment_method_id   VARCHAR2(32),
    amount              NUMBER(11,2),
    cancelled_on        DATE,
    EffectiveDate       DATE,
    payment_number      VARCHAR2(32),
    Status              VARCHAR2(11),
    Type                VARCHAR2(10),
    z_updated_date      DATE,
    z_created_date      DATE,
    Check_Number_c      VARCHAR2(25),
    Journal_Number_c    VARCHAR2(25),
    Transaction_Code_c  VARCHAR2(5),
    Receipt_Num_c       VARCHAR2(10),
    Cybersource_Token_c VARCHAR2(23),
    Purchase_Id_c       VARCHAR2(25),
    Cc_Type_c           VARCHAR2(2),
    Transaction_Id_c    VARCHAR2(25),
    process_status      VARCHAR2(2),
    creation_date       DATE,
    error_text          VARCHAR2(255)
  )
/
CREATE TABLE kmule.z_payment_errors
  (
    batch_id      NUMBER,
    object_id     VARCHAR2(32),
    error_text    VARCHAR2(4000),
    creation_date DATE,
    error_status  VARCHAR2(2)
  )
/
CREATE INDEX kmule.z_payments_z_idx ON kmule.z_payments
  (
    payment_id,
    account_id
  )
/
CREATE INDEX kmule.z_payments_k_idx ON kmule.z_payments
  (
    journal_number_c,
    receipt_num_c,
    purchase_id_c,
    transaction_id_c
  )
/
CREATE SEQUENCE kmule.Z_payments_INTERFACE_S MINVALUE 1 INCREMENT BY 1
START WITH 1 CACHE 5 ORDER NOCYCLE
/
CREATE SEQUENCE kmule.Z_payment_batches_S MINVALUE 1 INCREMENT BY 1
START WITH 1 NOCACHE ORDER NOCYCLE
/
GRANT ALL ON kmule.z_payment_batches TO apps
/
GRANT ALL ON kmule.z_payments TO apps
/
grant all on kmule.z_payment_errors to apps
/
grant all on kmule.Z_payments_INTERFACE_S to apps
/
grant all on kmule.Z_payment_batches_S to apps
/
CREATE TABLE kmule.Z_AMENDMENT_BATCHES
  (
    BATCH_ID                 NUMBER ,
    min_trx_creation_date    DATE,
    max_trx_creation_date    DATE,
    min_trx_last_update_date DATE,
    max_trx_last_update_date DATE,
    RECORDS_QUERIED          NUMERIC ,
    RECORDS_TRANSFERRED      NUMBER ,
    PROCESSING_STATUS        VARCHAR2(20) ,
    CREATION_DATE            DATE ,
    LAST_UPDATE_DATE         DATE
  )
/
CREATE TABLE kmule.z_amendments
  (
    batch_id             NUMBER,
    interface_id         NUMBER,
    amendment_id         VARCHAR2(32),
    subscription_id      VARCHAR2(32),
    code                 VARCHAR2(50),
    customer_accept_date DATE,
    description          VARCHAR2(500),
    name                 VARCHAR2(100),
    effective_date       DATE,
    term_type            VARCHAR2(9),
    type                 VARCHAR2(18),
    status               VARCHAR2(17),
    z_updated_date       DATE,
    z_created_date       DATE,
    process_status       VARCHAR2(2),
    creation_date        DATE,
    error_text           VARCHAR2(255)
  )
/
CREATE TABLE kmule.z_amendment_errors
  (
    batch_id      NUMBER,
    object_id     VARCHAR2(32),
    error_text    VARCHAR2(4000),
    creation_date DATE,
    error_status  VARCHAR2(2)
  )
/
CREATE INDEX kmule.z_amendments_idx ON kmule.z_amendments
  (
    amendment_id,
    subscription_id
  )
/
CREATE SEQUENCE kmule.Z_amendments_INTERFACE_S MINVALUE 1 INCREMENT BY 1
START WITH 1 CACHE 5 ORDER NOCYCLE
/
CREATE SEQUENCE kmule.Z_amendment_batches_S MINVALUE 1 INCREMENT BY 1
START WITH 1 NOCACHE ORDER NOCYCLE
/
grant all on kmule.z_amendment_batches to apps
/
grant all on kmule.z_amendments to apps
/
grant all on kmule.z_amendment_errors to apps
/
grant all on kmule.Z_amendments_INTERFACE_S to apps
/
grant all on kmule.Z_amendment_batches_S to apps
/