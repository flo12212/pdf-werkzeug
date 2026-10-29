# PDF Werkzeug

Seiten aus mehreren PDFs zusammenfuegen, loeschen, drehen, sortieren und
ausfuellen. Laeuft komplett im Browser. Die Dateien werden nirgendwo
hochgeladen, es gibt keinen Server, der irgendetwas zu sehen bekaeme.

## Starten

    ./start.sh

Oeffnet http://localhost:8777. Mit `?demo` dahinter laedt das Werkzeug die zwei
Beispieldateien aus `test-pdfs/` von selbst, mit `?demo=formular` das Beispiel
zum Ausfuellen.

Unter Windows ohne Python geht auch das Python von LibreOffice:

    & "C:\Program Files\LibreOffice\program\python.exe" -m http.server 8777 --bind 127.0.0.1

## Warum ein Server, wenn doch alles im Browser laeuft

Nur wegen der Browser-Regeln: eine Seite, die per `file://` geoeffnet wird, darf
keine Module und keine Worker nachladen. Deswegen der kleine Python-Server. Wenn
die Seite spaeter irgendwo im Netz liegt (GitHub Pages reicht), faellt der weg.

## Bedienung

- PDFs in die Flaeche ziehen oder anklicken und auswaehlen, mehrere gehen
- Seiten anklicken zum Markieren, dann drehen oder loeschen
- Seiten mit der Maus verschieben, um die Reihenfolge zu aendern
- Ausfuellen zeigt die markierten Seiten (oder alle) gross mit Eingabefeldern,
  ein Klick auf eine freie Stelle setzt ein eigenes Textfeld
- Speichern baut aus allem eine neue PDF-Datei, der eingetragene Text steht
  danach fest auf der Seite

## Ausfuellen

Beim Einlesen sucht das Werkzeug auf jeder Seite nach Feldern, die Karte zeigt
oben links, wie viele es gefunden hat:

- **Formularfelder**, wenn das PDF ein echtes Formular ist (Text, Haken,
  Auswahlliste). Dann wird nichts zusaetzlich geraten
- **Leere Kaestchen** auf Arbeitsblaettern: gefuellte oder umrandete Rechtecke,
  auch mit runden Ecken, in denen weder Text noch ein Bild steht
- **Luecken** aus Punkten (`.....`) oder Unterstrichen (`___`) im Text

Gedrehte Seiten (`/Rotate`) gehen auch, der Text steht beim Speichern aufrecht.
Schraeg liegende Kaestchen und eingescannte Blaetter (nur ein Bild, kein Text)
erkennt es nicht, dort hilft das eigene Textfeld per Klick.

Formularfelder werden beim Speichern eingetragen und flach gemacht, weil das
Formular beim Kopieren in die neue Datei sonst verloren geht. Alles andere wird
mit Helvetica aufgedruckt. Zeichen, die diese Schrift nicht kennt (z.B. Pfeile),
werden ersetzt.

## Dateien

    index.html       das ganze Werkzeug, Oberflaeche und Logik
    lib/pdf-lib      baut die neue PDF-Datei zusammen und schreibt den Text
    lib/pdfjs        zeichnet die Seiten und liefert Text, Zeichenbefehle, Formularfelder
    test-pdfs/       Beispieldateien, formular.pdf hat ein Formular und ein Arbeitsblatt
    start.sh         startet den lokalen Server

## Geprueft

Getestet in echtem Chrome ueber das Debugging-Protokoll: zwei Dateien einlesen,
fuenf Vorschaubilder zeichnen, markieren, drehen, loeschen, speichern. Die
Ausgabedatei beginnt mit %PDF- und laesst sich wieder oeffnen.

Die Logik zum Zusammenbauen wurde zusaetzlich einzeln geprueft: drei Seiten aus
zwei Dateien in neuer Reihenfolge mit den Drehungen 0, 90 und 180 Grad, danach
wieder eingelesen und gegengeprueft.

Ausfuellen (29.10.2026): `formular.pdf` ergibt 5 Formularfelder und 4 erkannte
Luecken, der Kasten mit Text bleibt aussen vor. Nach dem Speichern sind keine
Formularfelder mehr uebrig und alle Werte stehen als Text in der Datei, auch
Umlaute, Zeilenumbruch und ein eigenes Feld. Zusaetzlich mit einem echten
Arbeitsblatt (8 Seiten, teils gedreht) geprueft: fertige Tafelbilder 0 Felder,
die Lueckenblaetter alle Kaestchen ausser zwei schraegen.

## Naechste Schritte

- Seiten aus Bildern (JPG, PNG) hinzufuegen
- Seitenzahlen oder Wasserzeichen aufdrucken
- Dateigroesse verkleinern
- Eigene Textfelder verschieben und in der Groesse aendern
- Irgendwann online stellen und schauen, ob jemand kommt
