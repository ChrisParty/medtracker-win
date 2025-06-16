
from pathlib import Path

APP_NAME = "MedTracker"
DATA_DIR = Path.home() / f".{APP_NAME.lower()}"

def init_data_dir() -> None:
    (DATA_DIR / "attachments").mkdir(parents=True, exist_ok=True)
    (DATA_DIR / "exports").mkdir(exist_ok=True)
