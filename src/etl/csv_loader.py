import pandas as pd
from sqlalchemy import create_engine


def load_csv_to_postgres(
    csv_path: str,
    table_name: str,
    postgres_conn: str
) -> None:
    """
    Generic CSV loader.
    """

    engine = create_engine(postgres_conn)

    df = pd.read_csv(csv_path)

    df.columns = (
        df.columns
        .str.strip()
        .str.lower()
    )

    df.to_sql(
        name=table_name,
        con=engine,
        if_exists="append",
        index=False,
        method="multi",
        chunksize=5000
    )

    print(f"Loaded {len(df)} rows into {table_name}")