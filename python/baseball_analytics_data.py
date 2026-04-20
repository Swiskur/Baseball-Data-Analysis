import pandas as pd
import os


DATA_DIR = r"C:\Users\schae\Downloads"
file_path = os.path.join(DATA_DIR,"Expected Stats.csv")
output_file = os.path.join(DATA_DIR, "Cleaned_expected_stats.csv")

df = pd.read_csv(file_path)

df.columns = df.columns.str.strip().str.lower().str.replace(" ", "_")

df["woba_xwoba_diff"] = df["woba"] - df["xwoba"]

df["slg_xslg_diff"] = df["slg_percent"] - df["xslg"]

df["obp_xobp_diff"] = df["on_base_percent"] - df["xobp"]


df = df[df["pa"] > 100]

df.to_csv(output_file, index=False)

print("Cleaned file saved to: ", output_file)

print(df.head())
print(df.columns.tolist())
