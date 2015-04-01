truncate table kmule.z_customers
/
truncate table kmule.z_customer_batches
/
truncate table kmule.z_customer_errors
/
TRUNCATE TABLE KMULE.z_subscriptions
/
TRUNCATE TABLE KMULE.z_subscription_batches
/
TRUNCATE TABLE KMULE.Z_SUBSCRIPTION_ERRORS
/
TRUNCATE TABLE KMULE.z_AMENDMENTS
/
TRUNCATE TABLE KMULE.z_AMENDMENT_batches
/
truncate table kmule.z_invoice_batches
/
truncate table kmule.z_amendment_errors
/
truncate table kmule.z_invoices
/
truncate table kmule.z_invoice_item_batches
/
truncate table kmule.z_invoice_items
/
truncate table kmule.z_invoice_item_errors
/
truncate table kmule.z_payment_batches
/
truncate table kmule.z_payments
/
truncate table kmule.z_payment_errors
/
truncate table kmule.z_rate_plan
/
truncate table kmule.z_rate_plan_batches
/
truncate table kmule.z_rate_plan_errors
/
truncate table kmule.z_rate_plan_charge
/
truncate table kmule.z_rate_plan_charge_batches
/
truncate table kmule.z_rate_plan_charge_errors
/
truncate table kmule.z_refunds
/
truncate table kmule.z_refund_batches
/
truncate table kmule.z_refund_errors
/
truncate table kmule.z_invoice_payments
/
truncate table kmule.z_invoice_payment_batches
/
truncate table kmule.z_invoice_payment_errors
/
truncate table kmule.z_invoice_adjustments
/
truncate table kmule.z_invoice_adjustment_batches
/
truncate table kmule.z_invoice_adjustment_errors
/
select count(1) from z_customers 
/
select sum(records_transferred) from z_customer_batches --where batch_id in (5,6)
/
select * from z_customer_errors
/
select count(1) from z_subscriptions
/
select count(1) from z_subscriptions where batch_id not in (select batch_id from z_subscription_batches)
/
select sum(records_transferred) from z_subscription_batches order by 1
/
select count(1) from z_AMENDMENTS
/
select count(1) from z_AMENDMENTS where batch_id not in (SELECT batch_id FROM Z_AMENDMENT_BATCHES)
/
SELECT * FROM Z_AMENDMENT_BATCHES
/
select * from z_amendment_errors
/
select sum(records_transferred) from z_invoice_batches
/
select count(1) from z_invoices
/
select count(1) from z_invoices where batch_id not in (select batch_id from z_invoice_batches)
/
select sum(records_transferred) from z_invoice_item_batches order by batch_id  --No Invoice Batch data yet
/
select count(1) from z_invoice_items
/
select count(1) from z_invoice_items where batch_id not in (select batch_id from z_invoice_item_batches)
/
--delete from z_invoice_items where batch_id not in (select batch_id from z_invoice_item_batches)
/
select * from z_invoice_item_errors
/
select count(1) from z_payments
/
select count(1) from z_payments where batch_id not in (select batch_id from z_payment_batches)
/
select sum(records_transferred) from z_payment_batches
/
select * from z_payment_errors
/
select count(1) from z_rate_plan
/
select sum(records_transferred) from z_rate_plan_batches
/
select count(1) from z_rate_plan where batch_id not in (select batch_id from z_rate_plan_batches)
/
--delete from z_rate_plan where batch_id not in (select batch_id from z_rate_plan_batches)
/
select * from z_rate_plan_errors
/
select sum(records_transferred) from z_rate_plan_charge_batches
/
select count(1) from z_rate_plan_charge
/
select count(1) from z_rate_plan_charge where batch_id not in (select batch_id from z_rate_plan_charge_batches)
/
--delete from z_rate_plan_charge where batch_id not in (select batch_id from z_rate_plan_charge_batches)
/
select * from z_rate_plan_charge_errors
/
select count(1) from z_refunds
/
select sum(records_transferred) from z_refund_batches
/
select * from z_refund_errors
/
select count(1) from z_invoice_payments
/
select count(1) from z_invoice_payments where batch_id not in (select batch_id from z_invoice_payment_batches)
/
select sum(records_transferred) from z_invoice_payment_batches
/
select * from z_invoice_payment_errors
/
select count(1) from z_invoice_adjustments
/
select count(1) from z_invoice_adjustments where batch_id not in (select batch_id from z_invoice_adjustment_batches)
/
select sum(records_transferred) from z_invoice_adjustment_batches
/
select * from z_invoice_adjustment_errors
/