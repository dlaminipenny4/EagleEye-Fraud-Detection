import mysql.connector
import pandas as pd
import os


db_config = {
    'user': 'root',
    'password': 'Nontobeko@90', 
    'host': '127.0.0.1',
    'database': 'EagleEye_Fraud_DB'
}

def run_extraction():
    try:
        
        print("Connecting to EagleEye_Fraud_DB...")
        conn = mysql.connector.connect(**db_config)
        
    
        query = "SELECT * FROM Transactions"
        

        df = pd.read_sql(query, conn)
        
     
        print("\n--- Data Preview (First 5 Rows) ---")
        print(df.head())
        print(f"\nTotal Rows Extracted: {len(df)}")
        
        output_file = 'raw_transactions.csv'
        df.to_csv(output_file, index=False)
        print(f"\nSuccess! Data saved to: {os.path.abspath(output_file)}")
        
    except Exception as e:
        print(f"Error during extraction: {e}")
    finally:
        if 'conn' in locals() and conn.is_connected():
            conn.close()
            print("Database connection closed.")

if __name__ == "__main__":
    run_extraction()