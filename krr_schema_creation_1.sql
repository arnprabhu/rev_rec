--Execute from KRR Schema
drop table krr.krr_system_parameters
/
create table krr.krr_system_parameters
(
parameter_id number,
source_system varchar2(10),
ar_org_id number,
rev_rec_org_id number,
item_master_org number,
DISC_SKU VARCHAR2(20),
SHIPPING_SKU VARCHAR2(20),
HSG_SKU VARCHAR2(20),
books_sku VARCHAR2(20),
HSG_OFFSET NUMBER,
attribute1 varchar2(15),
attribute2 varchar2(15),
attribute3 varchar2(15),
attribute4 varchar2(15),
attribute5 varchar2(15),
attribute6 varchar2(15),
attribute7 varchar2(15),
attribute8 varchar2(15),
attribute9 varchar2(15),
attribute10 varchar2(15),
attribute11 varchar2(15),
attribute12 varchar2(15),
attribute13 varchar2(15),
attribute14 varchar2(15),
attribute15 varchar2(15),
created_date date,
created_by number,
last_update_date date,
last_updated_by number
)
/
grant all on krr.krr_system_parameters to apps
/
drop table krr.krr_zbill_trx_map
/
CREATE TABLE krr.krr_zbill_trx_map
  (
    map_id             NUMBER,
    SOURCE_SYSTEM      VARCHAR2(10),
    trx_code           VARCHAR2(4),
    trx_description    VARCHAR2(30),
    transaction        CHAR(1),
    payment            CHAR(1),
    refund             CHAR(1),
    ar_trx_type_name   VARCHAR2(15),
    rate_plan_name     VARCHAR2(50),
    hsg_rule           VARCHAR2(10),
    trx_number_suffix  VARCHAR2(10),
    initial_enrollment CHAR(1),
    subsequent_trx     CHAR(1),
    cust_service_event CHAR(1),
    revenue_impact     CHAR(1),
    monetary_trx       CHAR(1),
    tuition_trx        CHAR(1),
    institutional      CHAR(1),
    international      CHAR(1),
    enabled_flag       CHAR(1),
    created_by         NUMBER,
    creation_date      DATE,
    last_updated_by    NUMBER,
    last_update_date   DATE
  )
/
grant all on krr_zbill_trx_map to apps
/
drop table krr.krr_zbill_trx_line_map
/
create table krr.krr_zbill_trx_line_map
(
line_map_id number,
map_id number,
rate_plan varchar2(50),
line_group varchar2(50),
sku_override varchar2(35),
rev_rec_rule_override varchar2(35),
hsg_applies char(1),
sort_order number,
created_by number,
creation_date date,
last_updated_by number,
last_update_date date
)
/
grant all on krr.krr_zbill_trx_line_map to apps
/
drop table krr.krr_sku_hsg
/
create table krr.krr_sku_hsg
(sku varchar2(100),
 hsg_percent number(5,2),
 created_by number,
 creation_date date,
 last_updated_by number,
 last_update_date date
 )
/
grant all on krr.krr_sku_hsg to apps
/
drop table krr.krr_customers
/
CREATE TABLE krr.krr_customers
  (
    krr_customer_id             NUMBER,
    source_system               VARCHAR2(10), --ZBILL/etc
    source_id                   NUMBER,       --z_customers.interface_id
    customer_type               VARCHAR2(30), --Institute/Group (Individual of an institutional deal)/Retail
    record_status               VARCHAR2(1),  --Insert/Update  I/U
    CURRENCY_CODE               VARCHAR2(3 BYTE),
    EXTERNAL_ID                 VARCHAR2(32 BYTE),
    STUDENT_ID                  VARCHAR2(20 BYTE),
    CUSTOMER_NAME               VARCHAR2(255 BYTE),
    ORIG_SYSTEM_REFERENCE	VARCHAR2 (80 Byte),
    BILL_TO_ORIG_SYSTEM_REF     VARCHAR2(32 BYTE),
    BILL_TO_FNAME               VARCHAR2(100 BYTE),
    BILL_TO_LNAME               VARCHAR2(100 BYTE),
    BILL_TO_ADDRESS1            VARCHAR2(255 BYTE),
    BILL_TO_ADDRESS2            VARCHAR2(255 BYTE),
    BILL_TO_CITY                VARCHAR2(40 BYTE),
    BILL_TO_STATE               VARCHAR2(40 BYTE),
    BILL_TO_ZIP                 VARCHAR2(20 BYTE),
    BILL_TO_COUNTRY             VARCHAR2(32 BYTE),
    SHIP_TO_ORIG_SYSTEM_REF     VARCHAR2(32 BYTE),
    SHIP_TO_FNAME               VARCHAR2(100 BYTE),
    SHIP_TO_LNAME               VARCHAR2(100 BYTE),
    SHIP_TO_ADDRESS1            VARCHAR2(255 BYTE),
    SHIP_TO_ADDRESS2            VARCHAR2(255 BYTE),
    SHIP_TO_CITY                VARCHAR2(40 BYTE),
    SHIP_TO_STATE               VARCHAR2(40 BYTE),
    SHIP_TO_ZIP                 VARCHAR2(20 BYTE),
    SHIP_TO_COUNTRY             VARCHAR2(32 BYTE),
    PARENT_CUST_ID              VARCHAR2(32 BYTE), --Null for an Institue or Retail.  Not null for Group.
    RECORD_TYPE                 VARCHAR2(10),      --New /Update
    hz_cust_account_id          NUMBER,   --hz_cust_accounts.cust_account_id
    mon_bill_to_site_use_id     NUMBER,   --HZ_CUST_SITE_USES_ALL.site_use_id
    non_mon_bill_to_site_use_id NUMBER, ----HZ_CUST_SITE_USES_ALL.site_use_id
    status                      VARCHAR2(10),
    error_text                  VARCHAR2(255),
    org_id                      NUMBER,
    creation_date               DATE,
    created_by                  NUMBER,
    last_update_date            DATE,
    last_updated_by             NUMBER
  )
/
grant all on krr.krr_customers to apps
/
drop table krr.krr_purchases
/
CREATE TABLE krr.krr_purchases
  (
    krr_purchase_id         NUMBER,
    krr_customer_id         NUMBER,
    orig_system_purchase_id VARCHAR2(32), --z_invoice.purchase_id_c (from the first transaction only)
    purchase_date           DATE,
    service_start_date      DATE,
    service_end_date        DATE,
    assets_enabled          VARCHAR2(1), --Y/N
    payment_override        VARCHAR2(1), -- Y/N
    revenue_ready           VARCHAR2(1), --Y/N
    revenue_hold            VARCHAR2(1), --Y/N  Current Revenue Status  different from Revenue_ready
    product_code            VARCHAR2(15),
    cost_center             VARCHAR2(15),
    group_deal_number       VARCHAR2(15),
    area_code               VARCHAR2(30),
    promo_code              VARCHAR2(30),
    source_system           VARCHAR2(10), --ZBILL/etc
    org_id                  NUMBER,
    creation_date           DATE,
    created_by              NUMBER,
    last_update_date        DATE,
    last_updated_by         NUMBER
  )
/
grant all on krr.krr_purchases to apps
/
drop table krr.krr_all_events
/
CREATE TABLE krr.krr_all_events
  (
    krr_event_id    NUMBER,
    event_date      DATE, --This is the creation date of the transactions in the zbilling system
    krr_customer_id NUMBER,
    krr_purchase_id NUMBER,
    trx_category    VARCHAR2(10), --Initial/STP
    event_class     VARCHAR2(15), --Transaction/Payment/Customer Service Event, etc
    event_description VARCHAR2(255),
    trx_code                  VARCHAR2(10), --400, 403, etc
    sequence_num              NUMBER,
    oracle_party_id           NUMBER,
    krr_transaction_id        NUMBER,
    krr_payment_id            NUMBER,
    krr_refund_id             NUMBER,
    krr_cust_service_event_id NUMBER,
    status                    VARCHAR2(10),
    error_text                VARCHAR2(255),
    org_id                    NUMBER,
    creation_date             DATE,
    created_by                NUMBER,
    last_update_date          DATE,
    last_updated_by           NUMBER
  )
/  
grant all on krr.krr_all_events to apps
/

--Multi-Org Table
--Will contain transactions 
drop table krr.krr_transactions
/
CREATE TABLE krr.krr_transactions
  (
    krr_trx_id           NUMBER,
    krr_purchase_id      NUMBER,
    krr_customer_id      NUMBER,
    krr_z_map_id         NUMBER,
    source_system        VARCHAR2(10),
    source_id            NUMBER, --z_invoices.interface_id
    trx_number           VARCHAR2(15),
    TRX_DATE             DATE,
    CUST_TRX_TYPE_NAME   VARCHAR2(20 BYTE),
    TERM_NAME            VARCHAR2(15 BYTE),
    ACCOUNTING_RULE_NAME VARCHAR2(30 BYTE),
    INVOICING_RULE_NAME  VARCHAR2(30 BYTE),
    CURRENCY_CODE        VARCHAR2(15 BYTE),
    COST_CENTER          VARCHAR2(30 BYTE), --map to primary_sales rep number
    HSG_APPLIES          VARCHAR2(1),       --This takes Precedence over line level HSG flags
    REVENUE_READY        VARCHAR2(1),
    MONETARY_IMPACT      VARCHAR2(1),
    REVENUE_IMPACT       VARCHAR2(1),
    mon_cust_trx_id      NUMBER,
    non_mon_cust_trx_id  NUMBER,
    status               VARCHAR2(10),
    error_code           VARCHAR2(255),
    org_id               NUMBER,
    creation_date        DATE,
    created_by           NUMBER,
    last_update_date     DATE,
    last_updated_by      NUMBER
  )
/
grant all on krr.krr_transactions to apps
/
drop table krr.krr_transaction_lines
/
CREATE TABLE krr.krr_transaction_lines
  (
    krr_trx_line_id            NUMBER,
    krr_trx_id                 NUMBER,
    krr_z_line_map_id          NUMBER,
    source_system              VARCHAR2(10),
    source_id                  NUMBER, --z_invoice_items.interface_id
    LINE_NUM                   NUMBER,
    LINE_AMOUNT                NUMBER,
    SKU                        VARCHAR2(15),
    SKU_OVERRIDE               VARCHAR2(15),
    INVENTORY_ITEM_ID          NUMBER,
    OVERRIDE_INVENTORY_ITEM_ID NUMBER,
    REV_REC_RULE_NAME          VARCHAR2(30 BYTE),
    REV_REC_RULE_OVERRIDE      VARCHAR2(30 BYTE), --Override Rev Rec Rule Name
    RULE_START_DATE            DATE,
    RULE_END_DATE              DATE,
    hsg_applies                VARCHAR2(1),
    HSG_carve_PERCENT          NUMBER, --  e.g. 10.5 means 10.5%
    HSG_OFFSET                 NUMBER, --Days Offset
    HSG_REV_REC_RULE_NAME      VARCHAR2(30 BYTE),
    HSG_RULE_START_DATE        DATE,
    HSG_RULE_END_DATE          DATE,
    mon_cust_trx_line_id       NUMBER,
    non_mon_cust_trx_line_id   NUMBER,
    non_mon_hsg_trx_line_id    NUMBER,
    org_id                     NUMBER,
    CREATED_BY                 NUMBER,
    CREATION_DATE              DATE,
    LAST_UPDATED_BY            NUMBER,
    LAST_UPDATE_DATE           DATE
  )
/
grant all on krr.krr_transaction_lines to apps
/

--Multi Org Tables--Will contain data only for the single org
drop table krr.krr_payments
/

CREATE TABLE krr.krr_payments
  (
    krr_payment_id    NUMBER,
    krr_purchase_id   NUMBER,
    krr_trx_id        NUMBER, --Transaction to apply this cash to.  --This can be NULL.
    source_system     VARCHAR2(10),
    source_id         NUMBER, --z_payments.interface_id
    amount            NUMBER,
    payment_method    VARCHAR2(15), --AE,VS,MC,DS,CK,MO
    receipt_number    VARCHAR2(15),
    receipt_date      DATE,
    check_number      NUMBER,
    check_status      VARCHAR2(15),
    cybersource_token VARCHAR2(30),
    cash_receipt_id   NUMBER,
    status            VARCHAR2(10),
    error_code        VARCHAR2(255),
    org_id            NUMBER,
    CREATED_BY        NUMBER,
    CREATION_DATE     DATE,
    LAST_UPDATED_BY   NUMBER,
    LAST_UPDATE_DATE  DATE
  )
/
grant all on krr.krr_payments to apps
/
drop table krr.krr_refunds
/
CREATE TABLE krr.krr_refunds
  (
    krr_refund_id           NUMBER,
    krr_purchase_id         NUMBER,
    source_system           VARCHAR2(10),
    source_id               NUMBER, --z_refunds.interface_id
    amount                  NUMBER,
    refund_number           VARCHAR2(15),
    refund_date             DATE,
    payment_method          VARCHAR2(15), --AE,VS,MC,DS,CK,MO
    record_only             VARCHAR2(1),  --Y/N  To decide if a Refund check should be created or if this is to record the refund only
    refund_address_override VARCHAR2(1),  --Y/N  if N use Bill to Site ID for address
    REF_TO_FNAME            VARCHAR2(100 BYTE),
    REF_TO_LNAME            VARCHAR2(100 BYTE),
    REF_TO_ADDRESS1         VARCHAR2(255 BYTE),
    REF_TO_ADDRESS2         VARCHAR2(255 BYTE),
    REF_TO_CITY             VARCHAR2(40 BYTE),
    REF_TO_STATE            VARCHAR2(40 BYTE),
    REF_TO_ZIP              VARCHAR2(20 BYTE),
    REF_TO_COUNTRY          VARCHAR2(32 BYTE),
    ap_supplier_id          NUMBER,
    ap_supplier_site_id     NUMBER,
    ap_invoice_id           NUMBER,
    ap_check_id             NUMBER,
    ap_check_date           DATE,
    ap_check_status         VARCHAR2(15),
    status                  VARCHAR2(10),
    error_code              VARCHAR2(255),
    org_id                  NUMBER,
    CREATED_BY              NUMBER,
    CREATION_DATE           DATE,
    LAST_UPDATED_BY         NUMBER,
    LAST_UPDATE_DATE        DATE
  )
/
grant all on krr.krr_refunds to apps
/
drop table krr.krr_cust_serv_events
/
CREATE TABLE krr.krr_cust_serv_events
  (
    krr_cust_service_event_id NUMBER,
    krr_purchase_id           NUMBER,
    source_system             VARCHAR2(10),
    source_object             varchar2(32), --subscription/amendment
    source_id                 NUMBER,       --z_subscriptions.interface_id/z_amendment.interface_id
    event_type                VARCHAR2(32), --Freeze/Unfreeze/ActivateAssets/Switch Class/Enrollment Date/Shipment/Extend
    event_date                DATE,
    freeze_date               DATE, --Date to freeze the revenue
    unfreeze_date             DATE, --Date to restart the revenue from
    new_start_date            DATE, --Date if this is a Enrollment Date movement
    new_expiration_date       DATE, --New expiration date of the transaction for all cases
    shipment_date             DATE,
    status                    VARCHAR2(10),
    error_code                VARCHAR2(255),
    org_id                    NUMBER,
    CREATED_BY                NUMBER,
    CREATION_DATE             DATE,
    LAST_UPDATED_BY           NUMBER,
    LAST_UPDATE_DATE          DATE
  )
/
grant all on krr.krr_cust_serv_events to apps
/
-- creating all KRR sequences
create sequence krr.krr_amendment_s minvalue 1 increment by 1
start with 1 cache 5 order nocycle
/
create sequence krr.krr_customer_s minvalue 1 increment by 1
start with 1 cache 5 order nocycle
/
create sequence krr.krr_event_s minvalue 1 increment by 1
start with 1 cache 5 order nocycle
/
create sequence krr.krr_payment_s minvalue 1 increment by 1
start with 1 cache 5 order nocycle
/
create sequence krr.krr_purchases_s minvalue 1 increment by 1
start with 1 cache 5 order nocycle
/
create sequence krr.krr_refund_s minvalue 1 increment by 1
start with 1 cache 5 order nocycle
/
create sequence krr.krr_transactions_s minvalue 1 increment by 1
start with 1 cache 5 order nocycle
/
create sequence krr.krr_trx_headers_int_s minvalue 1 increment by 1
start with 1 cache 5 order nocycle
/
create sequence krr.krr_trx_lines_int_s minvalue 1 increment by 1
start with 1 cache 5 order nocycle
/
--Grants to all KRR sequences
grant all on krr.krr_amendment_s to apps
/
grant all on krr.krr_customer_s to apps
/
grant all on krr.krr_event_s to apps
/
grant all on krr.krr_payment_s to apps
/
grant all on krr.krr_purchases_s to apps
/
grant all on krr.krr_refund_s to apps
/
grant all on krr.krr_transactions_s to apps
/
grant all on krr.krr_trx_headers_int_s to apps
/
grant all on krr.krr_trx_lines_int_s to apps
/


