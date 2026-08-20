# E-Commerce Funnel & Traffic Source Analysis

## 📊 Project Overview

An SQL-based e-commerce analytics project focused on understanding the customer purchase funnel, evaluating traffic-source performance, analyzing revenue, and identifying product-level conversion opportunities.

The analysis covers **5,000 users and 9,381 user events** across the available data period.

---

## 🎯 Business Objectives

The project aims to answer key business questions such as:

- Where are customers dropping off in the purchase funnel?
- Which traffic sources generate the most customers and revenue?
- Which channels convert visitors most efficiently?
- How does product performance vary across the catalog?
- Where are the biggest opportunities for improving conversion and revenue?

---

## 🛠️ Tools & Technologies

- **SQL**
- CTEs
- Aggregate Functions
- `CASE WHEN`
- Conditional Aggregation
- `COUNT(DISTINCT)`
- `GROUP BY`
- `ORDER BY`
- Conversion-rate calculations
- Revenue and Average Order Value analysis

---

## 🔍 Analysis Performed

### 1. Purchase Funnel Analysis

Analyzed the complete customer journey:

**Page View → Add to Cart → Checkout → Payment → Purchase**

Key finding:

- View → Cart has the largest drop-off, with only **31.21%** of viewers progressing to the cart.
- Overall View → Purchase conversion is **16.59%**.
- Once customers reach the payment stage, conversion remains strong at **92.19%**.

This indicates that the largest opportunity lies earlier in the customer journey rather than at the final payment stage.

---

### 2. Traffic Source Analysis

Compared:

- Organic
- Paid Ads
- Email
- Social

across traffic volume, funnel progression, and purchase conversion.

| Traffic Source | Views | Purchases | View → Purchase |
|---|---:|---:|---:|
| Organic | 2,038 | 343 | 16.83% |
| Paid Ads | 968 | 204 | 21.07% |
| Email | 522 | 177 | **33.91%** |
| Social | 1,472 | 102 | **6.93%** |

### Key Insights

- **Email** has the highest conversion rate at **33.91%**, despite having the smallest audience.
- **Social** has the lowest conversion rate at **6.93%**, despite generating substantial traffic.
- **Organic** generates the highest total revenue at approximately **$37,280**.

---

## 💰 Revenue Analysis

Revenue and Average Order Value were compared across acquisition channels.

| Traffic Source | Buyers | Revenue | Average Order Value |
|---|---:|---:|---:|
| Organic | 343 | $37,279.98 | $108.69 |
| Paid Ads | 204 | $21,487.54 | $105.33 |
| Email | 177 | $17,876.75 | $101.00 |
| Social | 102 | $11,330.84 | $111.09 |

The relatively similar Average Order Values across channels indicate that differences in revenue are driven primarily by **conversion volume rather than substantially different customer spending levels**.

---

## 🛍️ Product Performance

Analyzed product-level:

- Views
- Add-to-cart activity
- Purchases
- View-to-cart conversion
- View-to-purchase conversion

Product performance was relatively consistent across the catalog, with View → Purchase conversion ranging from approximately **15.5% to 17.5%**.

Product **201** had the lowest conversion rate at **15.49%** despite receiving above-average traffic, making it a potential candidate for further investigation.

---

## 💡 Business Recommendations

Based on the analysis:

1. **Prioritize View → Cart optimization**  
   Improve product pages, add-to-cart visibility, incentives, and purchase intent earlier in the funnel.

2. **Review Social campaign performance**  
   Investigate audience targeting, creative, and landing-page relevance before increasing spend.

3. **Expand Email opportunities**  
   Email demonstrates the strongest conversion performance and could potentially support additional customer acquisition and engagement.

4. **Continue investing in Organic acquisition**  
   Organic is the strongest revenue contributor in the analyzed data and does not carry direct media spend.

5. **Investigate Product 201**  
   Review its pricing, product listing, and customer feedback to understand its relatively lower conversion.

---

## 📁 Project Files

- `e_commerce sales analysis.sql` — SQL queries used for the analysis
- `user_events.csv` — Source dataset
- `Funnel_Analysis_Report.docx` — Detailed analysis and findings

---

## 📈 Key Takeaway

The analysis shows that **increasing traffic alone is not necessarily the best path to revenue growth**. The strongest opportunities come from improving early-funnel conversion, focusing on high-performing acquisition channels, and addressing underperforming traffic sources and products.
