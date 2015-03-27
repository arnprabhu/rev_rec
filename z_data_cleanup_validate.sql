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
TRUNCATE TABLE KMULE.z_AMENDMENTS
/
TRUNCATE TABLE KMULE.z_AMENDMENT_batches
/
truncate table kmule.z_invoice_batches
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
truncate table kmule.z_rate_plans
/
truncate table kmule.z_rate_plan_batches
/
truncate table kmule.z_rate_plan_errors
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
select * from z_customers 
/
select * from z_customer_batches --where batch_id in (5,6)
/
select * from z_customer_errors
/
select * from z_subscriptions
/
select * from z_subscription_batches order by 1
/
select * from z_AMENDMENTS
/
SELECT * FROM Z_AMENDMENT_BATCHES
/
select * from z_amendment_errors
/
select * from z_invoice_batches
/
select count(1) from z_invoices
/
select * from z_invoice_item_batches order by batch_id
/
select count(1) from z_invoice_items
/
select * from z_payments where batch_id = 22
/
select * from z_payment_batches order by batch_id
/
select * from z_payment_errors
/
select count(1) from z_rate_plan
/
select * from z_rate_plan_batches
/
select * from z_rate_plan_errors
/
select * from z_rate_plan_charge_batches
/
select * from z_rate_plan_charge
/
select * from z_refunds
/
select * from z_refund_batches
/
select * from z_refund_errors
/
select * from z_invoice_payments
/
select * from z_invoice_payment_batches
/
select * from z_invoice_payment_errors
/
select * from z_invoice_adjustments
/
select * from z_invoice_adjustment_batches
/
select * from z_invoice_adjustment_errors
/