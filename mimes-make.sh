#!/usr/bin/env bash

MIME_VLC="video/dv video/mpeg video/x-mpeg video/msvideo video/quicktime video/x-anim video/x-avi video/x-ms-asf video/x-ms-wmv video/x-msvideo video/x-nsv video/x-flc video/x-fli video/x-flv video/vnd.rn-realvideo video/mp4 video/mp4v-es video/mp2t video/x-ogm+ogg video/ogg application/x-matroska audio/x-matroska video/x-matroska video/webm audio/webm audio/x-mpegurl audio/x-scpls audio/x-m4a audio/x-ms-asf audio/x-ms-asx audio/x-ms-wax application/vnd.rn-realmedia audio/x-real-audio application/x-shockwave-flash misc/ultravox audio/vnd.rn-realaudio audio/x-pn-aiff audio/x-pn-au audio/x-pn-windows-acm image/vnd.rn-realpix audio/x-pn-realaudio-plugin application/x-extension-mp4 audio/amr audio/amr-wb x-content/video-vcd x-content/video-svcd x-content/video-dvd x-content/audio-cdda application/xspf+xml x-scheme-handler/mms x-scheme-handler/rtmp x-scheme-handler/rtsp"

for e in $MIME_VLC
do
    xdg-mime default vlc.desktop $e
done

MIME_CLEMENTINE="application/ogg application/x-ogg application/x-ogm-audio audio/aac audio/mp4 audio/mpeg audio/mpegurl audio/ogg audio/vnd.rn-realaudio audio/vorbis audio/x-flac audio/x-mp3 audio/x-mpeg audio/x-mpegurl audio/x-ms-wma audio/x-musepack audio/x-oggflac audio/x-pn-realaudio audio/x-scpls audio/x-speex audio/x-vorbis audio/x-vorbis+ogg audio/x-wav video/x-ms-asf x-content/audio-player x-scheme-handler/zune x-scheme-handler/itpc x-scheme-handler/itms x-scheme-handler/feed"

for e in $MIME_CLEMENTINE
do
    xdg-mime default clementine.desktop $e
done

MIME_GWENVIEW="image/gif image/jpeg image/png image/bmp image/x-eps image/x-ico image/x-portable-bitmap image/x-portable-graymap image/x-portable-pixmap image/x-xbitmap image/x-xpixmap image/tiff image/x-psd image/x-webp"

for e in $MIME_GWENVIEW
do
    xdg-mime default org.kde.gwenview.desktop $e
done

MIME_CHROME="text/html text/xml application/xhtml_xml x-scheme-handler/http x-scheme-handler/https x-scheme-handler/ftp"

for e in $MIME_CHROME
do
    xdg-mime default google-chrome.desktop $e
done

MIME_O_CHM="application/x-chm"

for e in $MIME_O_CHM
do
    xdg-mime default okularApplication_chm.desktop $e
done

MIME_O_COMICBOOK="application/x-cbz application/x-cbr application/x-cbt"

for e in $MIME_O_COMICBOOK
do
    xdg-mime default okularApplication_comicbook.desktop $e
done

MIME_O_DJVU="image/vnd.djvu"

for e in $MIME_O_DJVU
do
    xdg-mime default okularApplication_djvu.desktop $e
done

MIME_O_DVI="application/x-dvi application/x-gzdvi application/x-bzdvi"

for e in $MIME_O_DVI
do
    xdg-mime default okularApplication_dvi.desktop $e
done

MIME_O_EPUB="application/epub+zip"

for e in $MIME_O_EPUB
do
    xdg-mime default okularApplication_epub.desktop $e
done

MIME_O_FAX="image/fax-g3 image/g3fax"

for e in $MIME_O_FAX
do
    xdg-mime default okularApplication_fax.desktop $e
done

MIME_O_FB="application/x-fictionbook+xml"

for e in $MIME_O_FB
do
    xdg-mime default okularApplication_fb.desktop $e
done

MIME_O_GHOSTVIEW="application/postscript image/x-eps application/x-gzpostscript application/x-bzpostscript image/x-gzeps image/x-bzeps"

for e in $MIME_O_GHOSTVIEW
do
    xdg-mime default okularApplication_ghostview.desktop $e
done

MIME_O_PDF="application/pdf application/x-gzpdf application/x-bzpdf application/x-wwf"

for e in $MIME_O_PDF
do
    xdg-mime default okularApplication_pdf.desktop $e
done

MIME_O_PLUCKER="application/prs.plucker"

for e in $MIME_O_PLUCKER
do
    xdg-mime default okularApplication_plucker.desktop $e
done

MIME_O_XPS="application/oxps application/vnd.ms-xpsdocument"

for e in $MIME_O_XPS
do
    xdg-mime default okularApplication_xps.desktop $e
done

update-desktop-database ~/.local/share/applications
update-mime-database ~/.local/share/mime
