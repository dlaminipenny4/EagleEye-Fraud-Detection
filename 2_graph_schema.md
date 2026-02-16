# AWS Neptune Graph Schema Mapping

| Entity Type | Graph Element | MySQL Column Source | Description |
| :--- | :--- | :--- | :--- |
| **User** | Node | `account_number` | Primary entity initiating transactions. |
| **Merchant** | Node | `merchant_category` | Entity receiving the payment. |
| **City** | Node | `location_city` | Geographical point of transaction. |
| **TRANSACTED** | Edge | `amount`, `date` | Connects User to Merchant. |
| **LOCATED_IN** | Edge | — | Connects Merchant or User to a City. |