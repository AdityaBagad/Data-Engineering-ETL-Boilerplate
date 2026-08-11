from pathlib import Path

from sqlalchemy import create_engine
from sqlalchemy import text


def create_tables(conn_string: str) -> None:
    """
    Execute all DDL files in order.
    """

    engine = create_engine(conn_string)

    sql_dir = Path("/opt/airflow/sql")

    ddl_files = [
        "customers.sql",
        "cards.sql",
        "merchants.sql",
        "transactions.sql"
    ]

    with engine.begin() as conn:

        for ddl_file in ddl_files:

            sql = (sql_dir / ddl_file).read_text()

            conn.execute(text(sql))

            print(f"Executed {ddl_file}")