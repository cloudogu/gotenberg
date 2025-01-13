# Visuelle Tests

In dieser Anleitung wird erklärt, wie die manuellen Tests für das Gotenberg Dogu in einer CES-Testumgebung durchführt werden.

## 1. Dogu Abhängigkeiten

Eine Auswahl von Dogus ist notwendig, um die Tests durchzuführen.
Es muss sichergestellt werden, dass die folgenden Dogus installiert sind:

- `official/scm`
- `official/cas`
- `official/nginx`
- `official/postfix`
- `official/usermgt`

## 2. Installation Gotenberg Dogu

Die Installation des Dogus kann wie gewohnt, z.B. mittels `cesapp build` + `cesapp start`, durchgeführt werden.

## 3. Einrichtung Gotenberg in SCM-Manager

Für die Aktivierung der Gotenberg Integration im SCM-Manager, ist eine Änderung der Konfiguration notwendig.
Unter [Administration -> Settings -> Gotenberg](https://192.168.56.2/scm/admin/settings/gotenberg), muss folgender Wert konfiguriert werden: `http://gotenberg:3000`

## 4. Verprobung Word-Dokument

Um die Funktionalität der Gotenberg Integration zu verproben, muss ein Dokument im passenden Format (z.B. Word `docx`) in einem Repository hinterlegt werden.
Anschließend kann die korrekte Anzeige des Dokuments in der Vorschau der Weboberfläche überprüft werden.

## 5. Verprobung Custom Font

Um das korrekte Ladeverhalten von Schriftarten sicherzustellen, muss im Ordner `/var/lib/ces/gotenberg/volumes/fonts` eine Schriftart (z.B. im `ttf` Format) hinterlegt werden.
Anschließend kann ein Dokument, welches die selbe Schriftart enthält, wie in Schritt 4 verprobt werden.
