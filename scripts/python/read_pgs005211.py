# Rough polars read of PGS005211 - hard-coded, should be command line arg for text file
# So far what we're doing is printing out the first 100 lines, sorted by largest effect weight first

from posixpath import sep

import polars as pl
from pathlib import Path
import os


# Ensure we're running from the project root
path = Path(os.getcwd() + "/data/downloads/PGS005211.txt")
if not Path.exists(path):
    print("PGS005211.txt not found - script must be run from the project root.")
    exit(1)

# Get a dataframe for the file.  This hard coded 14 row skip is not ideal.
# Need somethjing like what can be done in PyArrow, where we test the rows.
df = pl.read_csv(path, skip_rows=14, separator="\t")

# Override the default table row limit to 100, and print the first sorted 100 rows.
with pl.Config(tbl_rows=100):
    print(df.sort(by="effect_weight", descending=True).head(100))







