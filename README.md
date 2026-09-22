# PDF Werkzeug

Seiten aus mehreren PDFs zusammenfuegen, loeschen, drehen und sortieren.
Laeuft komplett im Browser. Die Dateien werden nirgendwo hochgeladen, es gibt
keinen Server, der irgendetwas zu sehen bekaeme.

## Starten

    ./start.sh

Oeffnet http://localhost:8777. Mit `?demo` dahinter laedt das Werkzeug die zwei
Beispieldateien aus `test-pdfs/` von selbst.

## Warum ein Server, wenn doch alles im Browser laeuft

Nur wegen der Browser-Regeln: eine Seite, die per `file://` geoeffnet wird, darf
keine Module und keine Worker nachladen. Deswegen der kleine Python-Server. Wenn
die Seite spaeter irgendwo im Netz liegt (GitHub Pages reicht), faellt der weg.

## Bedienung

- PDFs in die Flaeche ziehen oder anklicken und auswaehlen, mehrere gehen
- Seiten anklicken zum Markieren, dann drehen oder loeschen
- Seiten mit der Maus verschieben, um die Reihenfolge zu aendern
- Speichern baut aus allem eine neue PDF-Datei

## Dateien

    index.html       das ganze Werkzeug, Oberflaeche und Logik
    lib/pdf-lib      baut die neue PDF-Datei zusammen
    lib/pdfjs        zeichnet die Vorschaubilder
    test-pdfs/       zwei Beispieldateien zum Ausprobieren
    start.sh         startet den lokalen Server

## Geprueft

Getestet in echtem Chrome ueber das Debugging-Protokoll: zwei Dateien einlesen,
fuenf Vorschaubilder zeichnen, markieren, drehen, loeschen, speichern. Die
Ausgabedatei beginnt mit %PDF- und laesst sich wieder oeffnen.

Die Logik zum Zusammenbauen wurde zusaetzlich einzeln geprueft: drei Seiten aus
zwei Dateien in neuer Reihenfolge mit den Drehungen 0, 90 und 180 Grad, danach
wieder eingelesen und gegengeprueft.

## Naechste Schritte

- Seiten aus Bildern (JPG, PNG) hinzufuegen
- Seitenzahlen oder Wasserzeichen aufdrucken
- Dateigroesse verkleinern
- Irgendwann online stellen und schauen, ob jemand kommt
