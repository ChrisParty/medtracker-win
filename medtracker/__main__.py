
from PySide6.QtWidgets import QApplication, QMessageBox

def main() -> None:
    app = QApplication([])
    QMessageBox.information(None, "MedTracker", "Σκελετός MedTracker εγκαταστάθηκε & εκτελείται!")
    app.exec()

if __name__ == "__main__":
    main()
