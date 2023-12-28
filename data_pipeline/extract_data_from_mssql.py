from load_data_to_pgsql import load
import pandas as pd
import pyodbc
import os


driver = "{ODBC Driver 17 for SQL Server}"
server = "LongNguyen\LONGDEV"
database = "AdventureWorks2019"
connection = None

def extract() -> None:
    global connection
    
    try:
        connection = pyodbc.connect(
                        driver=driver,
                        server=server,
                        database=database,
                        trusted_connection='yes'
                    )
        tables = [
            "Sales.Customer",
            "Sales.SalesOrderDetail",
            "Sales.SalesOrderHeader",
            "Sales.SalesOrderHeaderSalesReason",
            "Person.CountryRegion",
            "Person.Person",
            "Production.Product",
            "Production.ProductCategory",
            "Production.ProductSubcategory",
            "Sales.SalesReason",
            "Sales.SalesTerritory",
            "Person.StateProvince",
            "Sales.Store",
            "Person.Address",
        ]
        
        for table in tables:
            # query and load save data to dataframe
            df = pd.read_sql_query(f"SELECT * FROM {table}", connection)
            table_rename = table.replace(".", "_")
            load(df, table_rename)
        
    except Exception as e:
        print(f"Data extract error: {e}")
    
    finally:
        if connection is not None:
            connection.close()
        
if __name__ == "__main__":
    extract()