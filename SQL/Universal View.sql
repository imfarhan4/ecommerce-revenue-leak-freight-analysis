CREATE VIEW ecommerce_data AS
SELECT

    -- Primary Identifiers
    o.order_id,
    o.customer_id,
    ooi.product_id,
    ooi.seller_id,

    -- Order Information
    o.order_status,

    -- Purchase Date Details
    o.Purchase_Date,


    -- Estimated Delivery Details
    o.Del_Estimate_Date,
    o.Del_Estimate_Day_Month,
    o.Del_Estimate_month_year,

    -- Actual Delivery Details
    o.Delivered_Date,
    o.Delivered_Day_Month,
    o.Delivered_month_year,

    -- Revenue & Profitability
    ooi.price,
    ooi.freight_value,
    op.payment_value,

    -- Payment Details
    op.payment_type,
    op.payment_installments,

    -- Customer Experience
    orr.review_score,
    orr.review_creation_date,

    -- Product Details
    opd.product_category_name,
    opd.product_weight_g,

    -- Customer Location
    oc.customer_city,
    oc.customer_state

FROM olist_order_items_dataset AS ooi

JOIN olist_order_payments_dataset AS op
    ON ooi.order_id = op.order_id

JOIN olist_orders_dataset AS o
    ON ooi.order_id = o.order_id

JOIN olist_order_reviews_dataset AS orr
    ON ooi.order_id = orr.order_id

JOIN olist_products_dataset AS opd
    ON ooi.product_id = opd.product_id

JOIN olist_customers_dataset AS oc
    ON o.customer_id = oc.customer_id;
    
select * from ecommerce_data;