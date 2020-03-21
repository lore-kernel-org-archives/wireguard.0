Return-Path: <SRS0=1oQw=5P=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1,ZIPFILE autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3269DC2D0E7
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 02:19:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CC2F20733
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 02:19:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=reldeif.de header.i=@reldeif.de header.b="T6S1IcgR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CC2F20733
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=reldeif.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26388561;
	Mon, 30 Mar 2020 02:10:47 +0000 (UTC)
Received: from mail.reldeif.de (<unknown> [2a00:f48:1003:1::1fe4:b705])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e2d45bf6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Mar 2020 19:21:13 +0000 (UTC)
Received: from [192.168.2.112]
 (dslb-088-067-249-136.088.067.pools.vodafone-ip.de [88.67.249.136])
 by mail.reldeif.de (Postfix) with ESMTPSA id 8353E400B1
 for <wireguard@lists.zx2c4.com>; Sat, 21 Mar 2020 20:27:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=reldeif.de;
 s=2019010301; t=1584818877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Y5ux/veVxBs99KEs8giCB5SMIJJv4Pjtq+euLqDO4iQ=;
 b=T6S1IcgR+240y2dRuB2Db13h0ftH9UTz5IgfgwI3W7LZ6dWdh4up1NDVaGjB7MDM60kfIE
 ubeXTMVj5MTYYV/Y84XIJMGH60qAdL0/A4pIJVvSEnjbgAae9R2o0oORHvET52Iua/UvzG
 wNxegzCVdSaAc0N4U7In/CuzBj+GHxg=
From: =?UTF-8?Q?Bj=c3=b6rn_Fiedler?= <bjoern@reldeif.de>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: [PATCH] Add german translation
Message-ID: <e478e85d-e62e-a064-287b-d876c2f84ac5@reldeif.de>
Date: Sat, 21 Mar 2020 20:27:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
X-Mailman-Approved-At: Mon, 30 Mar 2020 04:10:42 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Suggestion for german translation.
Created with the help of andentered into crowdin.

Signed-off-by: Björn Fiedler <bjoern@reldeif.de>
---
 ui/src/main/res/values-de/strings.xml | 188 ++++++++++++++++++++++++++
 1 file changed, 188 insertions(+)
 create mode 100644 ui/src/main/res/values-de/strings.xml

diff --git a/ui/src/main/res/values-de/strings.xml b/ui/src/main/res/values-de/strings.xml
new file mode 100644
index 0000000..516f9c1
--- /dev/null
+++ b/ui/src/main/res/values-de/strings.xml
@@ -0,0 +1,188 @@
+<?xml version="1.0" encoding="utf-8"?>
+<resources>
+    <plurals name="delete_error">
+        <item quantity="one">%d Tunnel konnte nicht gelöscht werden: %s</item>
+        <item quantity="other">%d Tunnel konnten nicht gelöscht werden: %s</item>
+    </plurals>
+    <plurals name="delete_success">
+        <item quantity="one">%d Tunnel erfolgreich gelöscht</item>
+        <item quantity="other">%d Tunnel erfolgreich gelöscht</item>
+    </plurals>
+    <plurals name="delete_title">
+        <item quantity="one">%d Tunnel ausgewählt</item>
+        <item quantity="other">%d Tunnel ausgewählt</item>
+    </plurals>
+    <plurals name="import_partial_success">
+        <item quantity="one">%d von %d Tunnel importiert</item>
+        <item quantity="other">%d von %d Tunnel importiert</item>
+    </plurals>
+    <plurals name="import_total_success">
+        <item quantity="one">%d Tunnel importiert</item>
+        <item quantity="other">%d Tunnel importiert</item>
+    </plurals>
+    <plurals name="set_excluded_applications">
+        <item quantity="one">%d ausgeschlossene Anwendung</item>
+        <item quantity="other">%d ausgeschlossene Anwendungen</item>
+    </plurals>
+    <string name="add_peer">Teilnehmer hinzufügen</string>
+    <string name="addresses">Adressen</string>
+    <string name="allowed_ips">Erlaubte IPs</string>
+    <string name="app_name">WireGuard</string>
+    <string name="bad_config_context">%1$ss %2$s</string>
+    <string name="bad_config_context_top_level">%s</string>
+    <string name="bad_config_error">%1$s in %2$s</string>
+    <string name="bad_config_explanation_pka">: Muss positiv sein und nicht größer als 65535</string>
+    <string name="bad_config_explanation_positive_number">: Muss positiv sein</string>
+    <string name="bad_config_explanation_udp_port">: Muss eine gültige UDP-Portnummer sein</string>
+    <string name="bad_config_reason_invalid_key">Invalider Wert</string>
+    <string name="bad_config_reason_invalid_number">Ungültige Zahl</string>
+    <string name="bad_config_reason_invalid_value">Ungültiger Wert</string>
+    <string name="bad_config_reason_missing_attribute">Attribut fehlt</string>
+    <string name="bad_config_reason_missing_section">Fehlende Sektion</string>
+    <string name="bad_config_reason_syntax_error">Syntaxfehler</string>
+    <string name="bad_config_reason_unknown_attribute">Unbekanntes Attribut</string>
+    <string name="bad_config_reason_unknown_section">Unbekannte Sektion</string>
+    <string name="bad_config_reason_value_out_of_range">Wert ist außerhalb des gültigen Bereichs</string>
+    <string name="bad_extension_error">Dateiendung muss .conf oder .zip sein</string>
+    <string name="cancel">Abbrechen</string>
+    <string name="config_delete_error">Konfigurationsdatei %s kann nicht gelöscht werden</string>
+    <string name="config_exists_error">Konfiguration für „%s“ existiert bereits</string>
+    <string name="config_file_exists_error">Konfigurationsdatei „%s“ existiert bereits</string>
+    <string name="config_not_found_error">Konfigurationsdatei „%s“ nicht gefunden</string>
+    <string name="config_rename_error">Konfigurationsdatei „%s “ kann nicht umbenannt werden</string>
+    <string name="config_save_error">Konfiguration für „%1$s“ kann nicht gespeichert werden: %2$s</string>
+    <string name="config_save_success">Konfiguration für „%s ” erfolgreich gespeichert</string>
+    <string name="create_activity_title">WireGuard-Tunnel erstellen</string>
+    <string name="create_bin_dir_error">Lokales Anwendungsverzeichnis konnte nicht erstellt werden</string>
+    <string name="create_empty">Neu erstellen</string>
+    <string name="create_from_file">Aus Datei oder Archiv importieren</string>
+    <string name="create_from_qr_code">Vom QR-Code scannen</string>
+    <string name="create_output_dir_error">Konnte das Ausgabeverzeichnis nicht erstellen</string>
+    <string name="create_downloads_file_error">Datei konnte im Download-Verzeichnis nicht erstellt werden</string>
+    <string name="create_temp_dir_error">Lokales temporäres Verzeichnis konnte nicht erstellt werden</string>
+    <string name="create_tunnel">Tunnel erstellen</string>
+    <string name="dark_theme_summary_off">Helles (Tag) Design in Verwendung</string>
+    <string name="dark_theme_summary_on">Dunkles (Nacht) Design in Verwendung</string>
+    <string name="dark_theme_title">Dunkles Design verwenden</string>
+    <string name="delete">Entfernen</string>
+    <string name="toggle_all">Alle umschalten</string>
+    <string name="dns_servers">DNS-Server</string>
+    <string name="edit">Bearbeiten</string>
+    <string name="endpoint">Endpunkt</string>
+    <string name="error_down">Fehler beim Herunterfahren des Tunnels: %s</string>
+    <string name="error_fetching_apps">Fehler beim Abrufen der App-Liste: %s</string>
+    <string name="error_root">Bitte root-Zugriff anfordern und erneut versuchen</string>
+    <string name="error_up">Fehler beim Starten des Tunnels: %s</string>
+    <string name="exclude_private_ips">Private IPs ausschließen</string>
+    <string name="excluded_applications">Ausgeschlossene Anwendungen</string>
+    <string name="generate">Generieren</string>
+    <string name="generic_error">Unbekannter „%s“ Fehler</string>
+    <string name="hint_automatic">(auto)</string>
+    <string name="hint_generated">(generiert)</string>
+    <string name="hint_optional">(optional)</string>
+    <string name="hint_random">(zufällig)</string>
+    <string name="illegal_filename_error">Ungültiger Dateiname „%s“</string>
+    <string name="import_error">Kann Tunnel nicht importieren: %s</string>
+    <string name="import_from_qr_code">Tunnel aus QR-Code importieren</string>
+    <string name="import_success">„%s” importiert</string>
+    <string name="interface_title">Schnittstelle</string>
+    <string name="key_length_explanation_base64">: WireGuard base64-Schlüssel müssen 44 Zeichen enthalten (32 Bytes)</string>
+    <string name="key_length_explanation_binary">: WireGuard-Schlüssel müssen 32 Bytes groß sein</string>
+    <string name="key_length_explanation_hex">: WireGuard Hex-Schlüssel müssen 64 Zeichen (32 Bytes) groß sein</string>
+    <string name="listen_port">Eingangs-Port</string>
+    <string name="log_export_error">Fehler beim Exportieren des Logs: %s</string>
+    <string name="log_export_success">Gespeichert in „%s”</string>
+    <string name="log_export_summary">Log-Datei wird im Download-Ordner gespeichert</string>
+    <string name="log_export_title">Logdatei exportieren</string>
+    <string name="logcat_error">Konnte logcat nicht ausführen: </string>
+    <string name="module_version_error">Konnte Version des Kernel-Moduls nicht ermitteln</string>
+    <string name="module_installer_not_found">Für Ihr Gerät sind keine Module verfügbar</string>
+    <string name="module_installer_initial">Das experimentelle Kernelmodul kann die Leistung verbessern</string>
+    <string name="module_installer_title">Kernelmodul herunterladen und installieren</string>
+    <string name="module_installer_working">Herunterladen und Installieren…</string>
+    <string name="module_installer_error">Es ist etwas schief gelaufen. Bitte versuchen Sie es später erneut</string>
+    <string name="module_disabler_disabled_title">Kernelmodul-Backend aktivieren</string>
+    <string name="module_disabler_disabled_summary">Das experimentelle Kernelmodul kann die Leistung verbessern</string>
+    <string name="module_disabler_enabled_title">Kernelmodul-Backend deaktivieren</string>
+    <string name="module_disabler_enabled_summary">Das langsamere Userspace-Backend kann die Stabilität verbessern</string>
+    <string name="success_application_will_restart">Erfolgreich. Die Anwendung wird nun neu starten…</string>
+    <string name="mtu">MTU</string>
+    <string name="multiple_tunnels_title">Erlaube mehrere Tunnel gleichzeitig</string>
+    <string name="multiple_tunnels_summary_on">Mehrere Tunnel können gleichzeitig aktiviert werden</string>
+    <string name="multiple_tunnels_summary_off">Einschalten eines Tunnels wird andere ausschalten</string>
+    <string name="name">Name</string>
+    <string name="no_config_error">Versucht einen Tunnel ohne Konfiguration zu starten</string>
+    <string name="no_configs_error">Keine Konfigurationen gefunden</string>
+    <string name="no_tunnels_error">Keine Tunnel vorhanden</string>
+    <string name="parse_error_generic">String (Zeichenkette)</string>
+    <string name="parse_error_inet_address">IP-Adresse</string>
+    <string name="parse_error_inet_endpoint">Endpunkt</string>
+    <string name="parse_error_inet_network">IP-Netzwerk</string>
+    <string name="parse_error_integer">Zahl</string>
+    <string name="parse_error_reason">Kann %1$s “%2$s ” nicht verarbeiten</string>
+    <string name="peer">Teilnehmer</string>
+    <string name="permission_description">Ermöglicht einer App, WireGuard-Tunnel zu steuern. Apps mit dieser Berechtigung können WireGuard-Tunnel nach Belieben aktivieren und deaktivieren, wodurch möglicherweise der Internetverkehr falsch geleitet wird.</string>
+    <string name="permission_label">WireGuard-Tunnel steuern</string>
+    <string name="persistent_keepalive">Dauerhafte Erhaltung</string>
+    <string name="pre_shared_key">Vorab geteilter Schlüssel</string>
+    <string name="private_key">Privater Schlüssel</string>
+    <string name="public_key">Öffentlicher Schlüssel</string>
+    <string name="public_key_description">Öffentlicher Schlüssel</string>
+    <string name="qr_code_hint">Tipp: Mit `qrencode -t ansiutf8 &lt; tunnel.conf` generieren.</string>
+    <string name="restore_on_boot_summary_on">Wird aktivierte Tunnel beim Systemstart automatisch wieder starten</string>
+    <string name="restore_on_boot_summary_off">Wird aktivierte Tunnel beim Systemstart nicht automatisch starten</string>
+    <string name="restore_on_boot_title">Beim Neustart wiederherstellen</string>
+    <string name="save">Speichern</string>
+    <string name="select_all">Alle auswählen</string>
+    <string name="set_exclusions">Ausnahmen festlegen</string>
+    <string name="settings">Einstellungen</string>
+    <string name="shell_exit_status_read_error">Shell kann den Exit-Status nicht lesen</string>
+    <string name="shell_marker_count_error">Die Shell erwartete 4 Marker, erhielt aber %d</string>
+    <string name="shell_start_error">Shell konnte nicht gestartet werden: %d</string>
+    <string name="toggle_error">Fehler beim Umschalten des WireGuard-Tunnels: %s</string>
+    <string name="tools_installer_already">wg und wg-quick sind bereits installiert</string>
+    <string name="tools_installer_failure">Kommandozeilenwerkzeuge konnten nicht installiert werden (kein Root?)</string>
+    <string name="tools_installer_initial">Optionale Tools für Skripte installieren</string>
+    <string name="tools_installer_initial_magisk">Optionale Werkzeuge für das Skripten als Magisk-Modul installieren</string>
+    <string name="tools_installer_initial_system">Optionale Werkzeuge für Skripte auf der Systempartition installieren</string>
+    <string name="tools_installer_success_magisk">wg und wg-quick als Magisk-Modul installiert (Neustart erforderlich)</string>
+    <string name="tools_installer_success_system">wg und wg-quick auf der Systempartition installiert</string>
+    <string name="tools_installer_title">Kommandozeilenwerkzeuge installieren</string>
+    <string name="tools_installer_working">Installiere wg und wg-quick</string>
+    <string name="tools_unavailable_error">Erforderliche Tools nicht verfügbar</string>
+    <string name="transfer">Transfer</string>
+    <string name="transfer_rx_tx">empfangen: %1$s, gesendet: %2$s</string>
+    <string name="transfer_bytes">%d B</string>
+    <string name="transfer_kibibytes">%.2f KiB</string>
+    <string name="transfer_mibibytes">%.2f MiB</string>
+    <string name="transfer_gibibytes">%.2f GiB</string>
+    <string name="transfer_tibibytes">%.2f TiB</string>
+    <string name="tun_create_error">Konnte tun Gerät nicht erstellen</string>
+    <string name="tunnel_config_error">Tunnel konnte nicht konfiguriert werden (wg-quick gab %d zurück)</string>
+    <string name="tunnel_create_error">Kann Tunnel nicht erstellen: %s</string>
+    <string name="tunnel_create_success">Tunnel „%s “ erfolgreich erstellt</string>
+    <string name="tunnel_error_already_exists">Tunnel „%s“ existiert bereits</string>
+    <string name="tunnel_error_invalid_name">Ungültiger Name</string>
+    <string name="tunnel_list_placeholder">Füge einen Tunnel mit der blauen Taste hinzu</string>
+    <string name="tunnel_name">Tunnelname</string>
+    <string name="tunnel_on_error">Tunnel kann nicht eingeschaltet werden (wgTurnOn gab %d zurück)</string>
+    <string name="tunnel_rename_error">Kann Tunnel nicht umbenennen: %s</string>
+    <string name="tunnel_rename_success">Tunnel erfolgreich in „%s “ umbenannt</string>
+    <string name="type_name_go_userspace">Go userspace</string>
+    <string name="type_name_kernel_module">Kernelmodul</string>
+    <string name="unknown_error">Unbekannter Fehler</string>
+    <string name="version_summary">%1$s Backend v%2$s</string>
+    <string name="version_summary_checking">Überprüfe %s Backend-Version</string>
+    <string name="version_summary_unknown">Unbekannte %s Version</string>
+    <string name="version_title">WireGuard für Android v%s</string>
+    <string name="vpn_not_authorized_error">VPN-Dienst nicht vom Benutzer autorisiert</string>
+    <string name="vpn_start_error">Android VPN-Dienst konnte nicht gestartet werden</string>
+    <string name="zip_export_error">Kann Tunnel nicht exportieren: %s</string>
+    <string name="zip_export_success">Gespeichert unter “%s”</string>
+    <string name="zip_export_summary">Zip-Datei wird im Download-Verzeichnis gespeichert</string>
+    <string name="zip_export_title">Tunnel als Zip-Datei exportieren</string>
+    <string name="key_length_error">Falsche Schlüssellänge</string>
+    <string name="key_contents_error">Falsche Zeichen in Schlüssel</string>
+    <string name="log_viewer_title">Log-Betrachter</string>
+    <string name="log_viewer_pref_summary">TBD</string>
+</resources>
-- 
2.26.0.rc2

