from sqlalchemy import create_engine
import pandas as pd
import psycopg2
import os


password = os.getenv('PASSWORD')
userid = os.getenv('USERID')
# password = "demopass"
# userid = "elt"
database = "AdvantureWorks"

def load(df: pd.DataFrame, table: str) -> None:
    try:
        rows_imported = 0
        engine = create_engine(f"postgresql://{userid}:{password}@localhost:5432/{database}")
        print(f"importing rows {rows_imported} to {rows_imported + len(df)}... for table {table}")
        # Save df to postgreSQL
        df.to_sql(f"src_{table}", engine, if_exists="replace", index=False)
        rows_imported += len(df)
        # add elapsed time to final print out
        print("Data imported successful")
        
    except Exception as e:
        print(f"Data load error: {e}")
