/*
drop user krr cascade
/
create user krr
identified by "wE!come123"
default tablespace APPS_TS_TX_DATA profile APPIDS
/
grant connect, create session, resource to krr
/
GRANT UNLIMITED TABLESPACE TO krr
/
drop user kmule cascade
/
create user kmule
identified by "wE!come123"
default tablespace APPS_TS_TX_DATA profile APPIDS
/
grant connect, create session, resource to kmule
/
GRANT UNLIMITED TABLESPACE TO kmule
/
--Run Kmule Script
--Run KRR Script
--Come back and create synonyms
*/

--Login as APPS to create synonyms
create synonym Z_CUSTOMER_batches for kmule.Z_CUSTOMER_batches
/
create synonym Z_CUSTOMERS for kmule.Z_CUSTOMERS
/
create synonym z_subscription_batches for kmule.z_subscription_batches
/
create synonym z_subscriptions for kmule.z_subscriptions
/
create synonym z_rate_plan for kmule.z_rate_plan
/
create synonym z_rate_plan_charge_batches for kmule.z_rate_plan_charge_batches
/
create synonym z_rate_plan_charge for kmule.z_rate_plan_charge
/
create synonym z_invoice_batches for kmule.z_invoice_batches
/
create synonym z_invoices for kmule.z_invoices
/
create synonym z_invoice_item_BATCHES for kmule.z_invoice_item_BATCHES
/
create synonym z_invoice_items for kmule.z_invoice_items
/
create synonym z_refund_batches for kmule.z_refund_batches
/
create synonym z_refunds for kmule.z_refunds
/
create synonym z_payment_batches for kmule.z_payment_batches
/
create synonym z_payments for kmule.z_payments
/
create synonym z_amendment_batches for kmule.z_amendment_batches
/
create synonym z_amendments for kmule.z_amendments
/
create synonym krr_customers for krr.krr_customers
/
create synonym krr_purchases for krr.krr_purchases
/
create synonym krr_all_events for krr.krr_all_events
/
create synonym krr_transactions for krr.krr_transactions
/
create synonym krr_transaction_lines for krr.krr_transaction_lines
/
create synonym krr_payments for krr.krr_payments
/
create synonym krr_refunds for krr.krr_refunds
/
create synonym krr_system_parameters for krr.krr_system_parameters
/
create synonym krr_zbill_trx_map for krr.krr_zbill_trx_map
/
create synonym krr_zbill_trx_line_map for krr.krr_zbill_trx_line_map
/
create synonym krr_sku_hsg for krr.krr_sku_hsg
/
-- ADD kmule sequences synonyms
create synonym z_subscription_interface_s for kmule.z_subscription_interface_s
/
create synonym Z_subscription_batches_S for kmule.Z_subscription_batches_S
/
create synonym Z_rate_plan_INTERFACE_S for kmule.Z_rate_plan_INTERFACE_S
/
create synonym Z_rate_plan_batches_S for kmule.Z_rate_plan_batches_S
/
create synonym Z_rate_plan_charge_INTERFACE_S for kmule.Z_rate_plan_charge_INTERFACE_S
/
create synonym Z_rate_plan_charge_batches_S for kmule.Z_rate_plan_charge_batches_S
/
create synonym Z_invoice_INTERFACE_S for kmule.Z_invoice_INTERFACE_S
/
create synonym Z_invoice_batches_S for kmule.Z_invoice_batches_S
/
create synonym Z_invoice_items_INTERFACE_S for kmule.Z_invoice_items_INTERFACE_S
/
create synonym Z_invoice_item_batches_S for kmule.Z_invoice_item_batches_S
/
create synonym Z_refunds_INTERFACE_S for kmule.Z_refunds_INTERFACE_S
/
create synonym Z_refund_batches_S for kmule.Z_refund_batches_S
/
create synonym Z_payments_INTERFACE_S for kmule.Z_payments_INTERFACE_S
/
create synonym Z_payment_batches_S for kmule.Z_payment_batches_S
/
create synonym Z_amendments_INTERFACE_S for kmule.Z_amendments_INTERFACE_S
/
create synonym Z_amendment_batches_S for kmule.Z_amendment_batches_S
/
create synonym Z_CUSTOMER_INTERFACE_S for kmule.Z_CUSTOMER_INTERFACE_S
/
create synonym Z_CUSTOMER_batches_S for kmule.Z_CUSTOMER_batches_S
/
-- Add krr seq synonyms
create synonym krr_amendment_s for krr.krr_amendment_s
/
create synonym krr_customer_s for krr.krr_customer_s
/
create synonym krr_event_s for krr.krr_event_s
/
create synonym krr_payment_s for krr.krr_payment_s
/
create synonym krr_purchases_s for krr.krr_purchases_s
/
create synonym krr_refund_s for krr.krr_refund_s
/
create synonym krr_transactions_s for krr.krr_transactions_s
/
create synonym krr_trx_headers_int_s for krr.krr_trx_headers_int_s
/
create synonym krr_trx_lines_int_s for krr.krr_trx_lines_int_s
/




---Inserts from APPS into various tables
insert into krr_system_parameters 
(parameter_id,source_system,ar_org_id,rev_rec_org_id,item_master_org,disc_sku, shipping_sku,hsg_sku,books_sku,hsg_offset, created_date, created_by, last_update_date, last_updated_by)
values
(1,'ZBILL',386,387,103,'DISC','SHIPPING FEE','HSG','HSK',1,sysdate, 4659, sysdate, 4659)
/
truncate table krr.krr_zbill_trx_map
/
insert into krr_zbill_trx_map values (1,'ZBILL','400','Full Tuition','Y','N','N','400IN','Full Tuition','Product','','Y','N','N','Y','Y','Y','N','N','Y',4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_map values (2,'ZBILL','401','Free Group Deal','Y','N','N','401IN','','No','','Y','N','N','N','Y','Y','Y','N','Y',4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_map values (3,'ZBILL','402','Scholarship','Y','N','N','402IN','','Product','','Y','N','N','Y','Y','Y','N','N','Y',4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_map values (4,'ZBILL','403','Discount','Y','N','N','403IN','Full Tuition','Product','','Y','N','N','Y','Y','Y','N','N','Y',4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_map values (5,'ZBILL','403','Discount','Y','N','N','403CM','Discount Amt','No','-DISC','Y','N','N','Y','Y','Y','','','Y',4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_map values (6,'ZBILL','404','Repeat','Y','N','N','404IN','Full Tuition','No','','Y','N','N','Y','Y','Y','N','N','Y',4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_map values (7,'ZBILL','404','Repeat','Y','N','N','404CM','Discount Amt','No','-DISC','Y','N','N','Y','Y','Y','N','N','Y',4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_map values (8,'ZBILL','405','HSG Repeat','Y','N','N','405IN','Full Tuition','No','','Y','N','N','N','Y','Y','N','N','Y',4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_map values (9,'ZBILL','405','HSG Repeat','Y','N','N','405CM','Discount Amt','No','-DISC','Y','N','N','N','Y','Y','N','N','Y',4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_map values (10,'ZBILL','406','Free Repeat','Y','N','N','406IN','Full Tuition','No','','Y','N','N','N','Y','Y','N','N','Y',4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_map values (11,'ZBILL','406','Free Repeat','Y','N','N','406CM','Discount Amt','No','-DISC','Y','N','N','N','Y','Y','N','N','Y',4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_map values (12,'ZBILL','407','Item Purchase','Y','N','N','407IN','Full Tuition','Product','','Y','N','N','Y','Y','Y','N','N','Y',4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_map values (15,'ZBILL','430','Paid Group Deal','Y','N','N','430IN','Full Tuition','No','','Y','N','N','Y','Y','Y','Y','N','Y',4659,sysdate,4659,sysdate);
commit
/
truncate table krr.krr_zbill_trx_line_map
/
insert into krr_zbill_trx_line_map values (1,1,'Full Tuition','Full Tuition','','','Y',1,4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_line_map values (2,1,'Shipping Fee','Shipping Fee','SHIP FEE','Immediate','N',2,4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_line_map values (3,2,'Full Tuition','Full Tuition','','','N',1,4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_line_map values (4,2,'Discount Amt','Full Tuition','','','N',1,4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_line_map values (5,2,'Shipping Fee','Full Tuition','','','N',2,4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_line_map values (6,3,'Full Tuition','Full Tuition','','','Y',1,4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_line_map values (7,3,'Shipping Fee','Shipping Fee','SHIP FEE','Immediate','N',2,4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_line_map values (8,4,'Full Tuition','Full Tuition','','','Y',1,4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_line_map values (9,4,'Shipping Fee','Shipping Fee','SHIP FEE','Immediate','N',2,4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_line_map values (10,5,'Discount Amt','Full Tuition','','','N',1,4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_line_map values (11,6,'Full Tuition','Full Tuition','','','Y',1,4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_line_map values (12,6,'Shipping Fee','Shipping Fee','SHIP FEE','Immediate','N',2,4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_line_map values (13,7,'Discount Amt','Full Tuition','','','N',1,4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_line_map values (14,8,'Full Tuition','Full Tuition','','','Y',1,4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_line_map values (15,8,'Shipping Fee','Shipping Fee','SHIP FEE','Immediate','N',2,4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_line_map values (16,9,'Discount Amt','Full Tuition','','','N',1,4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_line_map values (17,10,'Full Tuition','Full Tuition','','','Y',1,4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_line_map values (18,11,'Discount Amt','Full Tuition','','','N',1,4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_line_map values (19,15,'Full Tuition','Full Tuition','','','N',1,4659,sysdate,4659,sysdate);
insert into krr_zbill_trx_line_map values (19,15,'Adjustment Amt','Full Tuition','','','N',1,4659,sysdate,4659,sysdate);
commit
/
truncate table krr.krr_sku_hsg
/
insert into krr_sku_hsg values('ACT',20,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('ACTCLVO',20,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('ACTDEMO',20,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('ACTMK',20,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('ACTOLB',20,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('ACTOPR14',20,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('ADJ',0,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('APPSATM',15,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('APSATB2',15,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('APSSAT',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('BRDIAG',10,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('BRMPREO',10,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('BRMPREO13',10,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('BRQBP',10,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('CBRLAL',10,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('CBRLLAL',10,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('CBRLLNYNJ',10,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('CBRLLPANJ',10,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('CBRLLVA',10,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('CBRLNY',10,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('CBRLNYMA',10,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('CBRLNYNJ',10,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('CBRLWA',10,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('CBRONV',10,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('CBRONY',10,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('CBRONYMA',10,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('CBRONYNJ',10,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('CBROSC',10,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('CBROTX',10,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('COMLXHY03',10,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('CSANMS',10,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('CSASIM',10,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('CSDLVO',10,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('DAT',12.5,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('DATMK',12.5,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('DATPI',12.5,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('DATPT',12.5,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('DATTU',12.5,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('DATTU25',12.5,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('DATVL',12.5,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('DATVLT15',12.5,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('DFCAPHG',12.5,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('DFCAPUSH',12.5,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('DFCAPWH',12.5,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('DISC',0,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('EDGE1LO',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('EDGOOL',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('EXMPRRN24',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GEDNOD',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GEDOD',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GMAT',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GMATA',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GMATAP',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GMATAPCA',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GMATAPOD',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GMATC',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GMATCPRE',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GMATDSOD',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GMATLVO',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GMATMK',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GMATOSPR',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GMATPI',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GMATPREOL',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GMATPRO',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GMATPT',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GMATQDA',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GMATQDAC',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GMATTEST',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GMATTU',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GMATTU35',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GMATVLT15',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GMATVLT25',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GRADX14',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GRDAD1',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GRDAD15',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GREADVOD',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GREMK',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GREN',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GRENAP',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GRENAPCA',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GRENAPOD',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GRENOD',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GRENQB',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GRENVHT',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GRENVLO',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GREPI',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GREPT',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GRETU',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GRETUC',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('GREVLT15',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('IBFEEB',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('IBFEEC',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('IBFEEG',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('IBFEEM',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('IBFEEN',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('IBFEEP',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('KACTOLB',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('KOLPTACT',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('KSATPOP',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('KSSATKTE',14,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('LSAT',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('LSATADVCA',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('LSATADVOS',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('LSATADVPA',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('LSATAVPOS',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('LSATC',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('LSATLG',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('LSATLR',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('LSATMK',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('LSATOPT',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('LSATP',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('LSATPI',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('LSATPN',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('LSATSI',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('LSATTU',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('LSATVL',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('MBE2LA13',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('MBECDL',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('MBEIP',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('MCAT',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('MCAT14KNO',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('MCATEX',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('MCATEXVL',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('MCATMINIT',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('MCATMK',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('MCATOL',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('MCATOLX',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('MCATPI',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('MCATPT',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('MCATRT',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('MCATSTAT',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('MCATTU',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('MCATVL',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('MCATVLA',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('MCATVLT15',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('MCPHYKAT2',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('MEDINSTS',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('MINTGREOD',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('MINTPROL',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('MISFEEP',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('MLQB3B3X',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('NAPLEX',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('NAPLXQB12',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('NBDEIQ12',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('NCLEXVL',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('NCLXINTVL',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('NCLXIQBO',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('NCLXMK',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('NCLXPNRC',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('NCLXPNVL',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('NCLXQB',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('NCLXQBO',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('NCPNIT11D',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('NCPNIT8D',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('NCPNITD',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('NCQB3',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('NMS1',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('NMS2',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('NMS3LVO',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('NYSHMK',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('O1HY112I',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('OAT',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('OATMK',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('OATSPR15',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('OATTU',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('OATVL',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('OATVLT15',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('OLCOMQ12',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('OLDAT',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('OLNCLG12D',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('OLNCLSYR',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('OLOAT',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('OLPT1SAT',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('OLPT6ACT',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('ONMS1OQ7',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('PCAT',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('PCATDEMO',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('PCATMK',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('PCATOL',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('PCATTU15',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('PCATVHT',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('PCATVL',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('PCATVLT15',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('PMBR3D',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('PMBR3DO',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('PMBRCDO',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('PSATLVO',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('PSATMK',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('PSATOL',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('PSATOS',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('SAT',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('SATBOOT',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('SATCLVO',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('SATFRCD',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('SATMK',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('SATPOP',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('SATSGT',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('SCPALVO',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('SHIPPING FEE',0,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('TOEFLOD',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('TOEFLOS',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('TOEFLOSA',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('US1CSLVO',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('US1QB12I',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('USMD1HYT20',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('USMED1',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('USML1QB12',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('USMLA12HY',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('USMLE109',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('USMLEHY03',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('USMLQB312',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('USMLQB3A',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('USNM1410',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('USNM167',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('USNM2',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('USNM3',12,4659,sysdate,4659,sysdate);
insert into krr_sku_hsg values('USNMB1D8',12,4659,sysdate,4659,sysdate);
commit
/
/*
--Ensure that Descrptive Flexfeild is created on the Item Master, before running this script.
DECLARE
  l_item_table ego_item_pub.item_tbl_type;
  x_item_table ego_item_pub.item_tbl_type;
  x_return_status VARCHAR2 (1);
  x_msg_count     NUMBER (10);
  i_index         NUMBER;
  CURSOR krr_hsg_list_cur
  IS
    SELECT sku, hsg_percent, 103 org_id FROM krr.krr_sku_hsg;
BEGIN
  i_index := 1;
  FOR sel_krr_hsg_list IN krr_hsg_list_cur
  LOOP
    l_item_table (i_index).transaction_type   := 'UPDATE';
    l_item_table (i_index).segment1           := sel_krr_hsg_list.sku;
    l_item_table (i_index).item_number        := sel_krr_hsg_list.sku;
    l_item_table (i_index).organization_id    := sel_krr_hsg_list.org_id;
    l_item_table (i_index).Attribute_Category := TO_CHAR(sel_krr_hsg_list.org_id);
    l_item_table (i_index).Attribute1         := TO_CHAR(sel_krr_hsg_list.hsg_percent);
    i_index                                   := i_index + 1;
  END LOOP;
  ego_item_pub.process_items (p_api_version => 1.0, p_init_msg_list => fnd_api.g_true, p_commit => fnd_api.g_true, p_item_tbl => l_item_table, x_item_tbl => x_item_table, x_return_status => x_return_status, x_msg_count => x_msg_count );
  COMMIT;
  IF (x_return_status = fnd_api.g_ret_sts_success) THEN
    DBMS_OUTPUT.put_line( 'SUCCESS');
  ELSE
    DBMS_OUTPUT.put_line( 'Failure');
    
  END IF;
END;
/
*/
