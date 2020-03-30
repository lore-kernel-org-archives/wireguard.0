Return-Path: <SRS0=yWyP=5Q=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EE8C2D0E8
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 31 Mar 2020 03:30:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2782520732
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 31 Mar 2020 03:30:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QXHls85F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2782520732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c06daee;
	Tue, 31 Mar 2020 03:22:37 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c5e25bbc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Mar 2020 09:02:40 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id 31so20615629wrs.3
 for <wireguard@lists.zx2c4.com>; Mon, 30 Mar 2020 02:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iEl+rbXi9V5Afn34KHKGFWWoOWRNKBBigvgNiEcSKiE=;
 b=QXHls85F12odCwKgkyM4vp9s+ATqJOLernaVadtYFhG5g8ZXAmLw8WdfbJNY7dl/iA
 sm5gae0G+Xuiv0rbktHyUzRWej6gW8No4kWAQE9NA1ZOqxPLFWap+bSsc6/KQcJxy4Ti
 /HpQgHm42ABwNg+uT9v1kNiwMriKtEAwUD8wW79sHjNUYD8XCANHOC8wQuSl/6sB+Grd
 PiigYjlNqnw3sOUOx46b9mYmaCqjIM4VXaCgWI/pGDeQ0KxFD8as2bMixN8i8tlD8QSL
 1yQaauwV1iPEYQhDcfnPb/tqNxcq1eB83OKWtO9jF8GDU+GDHej7Ry5gadckPhvztqbU
 rnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iEl+rbXi9V5Afn34KHKGFWWoOWRNKBBigvgNiEcSKiE=;
 b=S+JWsBRjLCzDaf7BIFOFeZy6y9bPXZ3ERNRdmh/lJAP6k7vNQ2p1Om/KIGN9Gz+wqh
 k7EKKzt57PBfnwlp1+nJit9D6JNFEB9LTOEOCvp51EiRCCuqOTlYGn+UHy6TuHcrYE7d
 kYaodXeyB+27ewbvrKTiyf08T5RJ52ld2+g14PVq7zTwmrsZ10aOOzmUZev1pbpq3WWg
 e1o7QWuQ90X9IFuI56oVqeq3rd/Pgugr5zF2WSKmV9FpzKm/yuSIzCvsrPAj2tePQ0/r
 efxjiw99OrJYtF15olJYCCvi+ySOULsgy/34MoD/pc7VykTO4GCF7Sea2Z0Xj+BJfH4T
 94yg==
X-Gm-Message-State: ANhLgQ0WRN3kp+iGtGrU84ZmnyWj0uNJxJ5j7wwfxRm3kAm/dcOGuFXO
 H3/0fC59P9N0HtkGJmqBwyrsldXVtO4=
X-Google-Smtp-Source: ADFU+vtEXLpjUbIjsmGun7Eko/uc5uEPbeiNoPgpeyUkrctm4J9ugOG1RcsUBHfEMV0EKfHkqx8jPg==
X-Received: by 2002:adf:fc4c:: with SMTP id e12mr13652209wrs.265.1585559431008; 
 Mon, 30 Mar 2020 02:10:31 -0700 (PDT)
Received: from jupiter.localdomain ([151.40.226.243])
 by smtp.gmail.com with ESMTPSA id u17sm23051850wri.45.2020.03.30.02.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 02:10:30 -0700 (PDT)
From: Vincenzo Reale <vinx.reale@gmail.com>
X-Google-Original-From: Vincenzo Reale <smart2128@baslug.org>
To: wireguard@lists.zx2c4.com
Cc: Vincenzo Reale <smart2128@baslug.org>
Subject: [PATCH] Italian translation
Date: Mon, 30 Mar 2020 11:10:22 +0200
Message-Id: <20200330091022.12097-1-smart2128@baslug.org>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 31 Mar 2020 05:22:32 +0200
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

---
 WireGuard/WireGuard.xcodeproj/project.pbxproj |   1 +
 .../WireGuard/it.lproj/Localizable.strings    | 443 ++++++++++++++++++
 2 files changed, 444 insertions(+)
 create mode 100644 WireGuard/WireGuard/it.lproj/Localizable.strings

diff --git a/WireGuard/WireGuard.xcodeproj/project.pbxproj b/WireGuard/WireGuard.xcodeproj/project.pbxproj
index 06a8de4..f872d16 100644
--- a/WireGuard/WireGuard.xcodeproj/project.pbxproj
+++ b/WireGuard/WireGuard.xcodeproj/project.pbxproj
@@ -973,6 +973,7 @@
 			hasScannedForEncodings = 0;
 			knownRegions = (
 				en,
+				it,
 				ja,
 				Base,
 			);
diff --git a/WireGuard/WireGuard/it.lproj/Localizable.strings b/WireGuard/WireGuard/it.lproj/Localizable.strings
new file mode 100644
index 0000000..c9d9a5c
--- /dev/null
+++ b/WireGuard/WireGuard/it.lproj/Localizable.strings
@@ -0,0 +1,443 @@
+// SPDX-License-Identifier: MIT
+// Copyright © 2018-2019 WireGuard LLC. All Rights Reserved.
+
+// Generic alert action names
+
+"actionOK" = "OK";
+"actionCancel" = "Annulla";
+"actionSave" = "Salva";
+
+// Tunnels list UI
+
+"tunnelsListTitle" = "WireGuard";
+"tunnelsListSettingsButtonTitle" = "Impostazioni";
+"tunnelsListCenteredAddTunnelButtonTitle" = "Aggiungi un tunnel";
+"tunnelsListSwipeDeleteButtonTitle" = "Elimina";
+"tunnelsListSelectButtonTitle" = "Seleziona";
+"tunnelsListSelectAllButtonTitle" = "Seleziona tutto";
+"tunnelsListDeleteButtonTitle" = "Elimina";
+"tunnelsListSelectedTitle (%d)" = "%d selezionati";
+
+// Tunnels list menu
+
+"addTunnelMenuHeader" = "Aggiungi un nuovo tunnel WireGuard";
+"addTunnelMenuImportFile" = "Crea da file o archivio";
+"addTunnelMenuQRCode" = "Crea da codice QR";
+"addTunnelMenuFromScratch" = "Crea da zero";
+
+// Tunnels list alerts
+
+"alertImportedFromMultipleFilesTitle (%d)" = "Creati %d tunnel";
+"alertImportedFromMultipleFilesMessage (%1$d of %2$d)" = "Creati %1$d di %2$d tunnel da file importati";
+
+"alertImportedFromZipTitle (%d)" = "Creati %d tunnel";
+"alertImportedFromZipMessage (%1$d of %2$d)" = "Creati %1$d di %2$d tunnel da archivio zip";
+
+"alertBadConfigImportTitle" = "Impossibile importare il tunnel";
+"alertBadConfigImportMessage (%@)" = "Il file ‘%@’ non contiene una configurazione valida di WireGuard";
+
+"deleteTunnelsConfirmationAlertButtonTitle" = "Elimina";
+"deleteTunnelConfirmationAlertButtonMessage (%d)" = "Vuoi eliminare %d tunnel?";
+"deleteTunnelsConfirmationAlertButtonMessage (%d)" = "Vuoi eliminare %d tunnel?";
+
+// Tunnel detail and edit UI
+
+"newTunnelViewTitle" = "Nuova configurazione";
+"editTunnelViewTitle" = "Modifica configurazione";
+
+"tunnelSectionTitleStatus" = "Stato";
+
+"tunnelStatusInactive" = "Inattivo";
+"tunnelStatusActivating" = "Attivazione";
+"tunnelStatusActive" = "Attivo";
+"tunnelStatusDeactivating" = "Disattivazione";
+"tunnelStatusReasserting" = "Riattivazione";
+"tunnelStatusRestarting" = "Riavvio";
+"tunnelStatusWaiting" = "In attesa";
+
+"macToggleStatusButtonActivate" = "Attiva";
+"macToggleStatusButtonActivating" = "Attivazione…";
+"macToggleStatusButtonDeactivate" = "Disattiva";
+"macToggleStatusButtonDeactivating" = "Disattivazione…";
+"macToggleStatusButtonReasserting" = "Riattivazione…";
+"macToggleStatusButtonRestarting" = "Riavvia…";
+"macToggleStatusButtonWaiting" = "In attesa…";
+
+"tunnelSectionTitleInterface" = "Interfaccia";
+
+"tunnelInterfaceName" = "Nome";
+"tunnelInterfacePrivateKey" = "Chiave privata";
+"tunnelInterfacePublicKey" = "Chiave pubblica";
+"tunnelInterfaceGenerateKeypair" = "Genera coppia di chiavi";
+"tunnelInterfaceAddresses" = "Indirizzi";
+"tunnelInterfaceListenPort" = "Porta in ascolto";
+"tunnelInterfaceMTU" = "MTU";
+"tunnelInterfaceDNS" = "Server DNS";
+"tunnelInterfaceStatus" = "Stato";
+
+"tunnelSectionTitlePeer" = "Peer";
+
+"tunnelPeerPublicKey" = "Chiave pubblica";
+"tunnelPeerPreSharedKey" = "Chiave pre-condivisa";
+"tunnelPeerEndpoint" = "Endpoint";
+"tunnelPeerPersistentKeepalive" = "Keepalive permanente";
+"tunnelPeerAllowedIPs" = "IP consentiti";
+"tunnelPeerRxBytes" = "Dati ricevuti";
+"tunnelPeerTxBytes" = "Dati inviati";
+"tunnelPeerLastHandshakeTime" = "Ultima negoziazione";
+"tunnelPeerExcludePrivateIPs" = "Escludi IP privati";
+
+"tunnelSectionTitleOnDemand" = "Attivazione su richiesta";
+
+"tunnelOnDemandCellular" = "Cellulare";
+"tunnelOnDemandEthernet" = "Ethernet";
+"tunnelOnDemandWiFi" = "Wi-Fi";
+"tunnelOnDemandSSIDsKey" = "SSID";
+
+"tunnelOnDemandAnySSID" = "Qualsiasi SSID";
+"tunnelOnDemandOnlyTheseSSIDs" = "Solo questi SSID";
+"tunnelOnDemandExceptTheseSSIDs" = "Eccetto questi SSID";
+"tunnelOnDemandOnlySSID (%d)" = "Solo %d SSID";
+"tunnelOnDemandOnlySSIDs (%d)" = "Solo %d SSID";
+"tunnelOnDemandExceptSSID (%d)" = "Eccetto %d SSID";
+"tunnelOnDemandExceptSSIDs (%d)" = "Eccetto %d SSID";
+"tunnelOnDemandSSIDOptionDescriptionMac (%1$@: %2$@)" = "%1$@: %2$@";
+
+"tunnelOnDemandSSIDViewTitle" = "SSID";
+"tunnelOnDemandSectionTitleSelectedSSIDs" = "SSID";
+"tunnelOnDemandNoSSIDs" = "Nessun SSID";
+"tunnelOnDemandSectionTitleAddSSIDs" = "Aggiungi SSID";
+"tunnelOnDemandAddMessageAddConnectedSSID (%@)" = "Aggiungi connesso: %@";
+"tunnelOnDemandAddMessageAddNewSSID" = "Aggiungi nuovo";
+
+"tunnelOnDemandKey" = "Su richiesta";
+"tunnelOnDemandOptionOff" = "Off";
+"tunnelOnDemandOptionWiFiOnly" = "Solo Wi-Fi";
+"tunnelOnDemandOptionWiFiOrCellular" = "Wi-Fi o cellulare";
+"tunnelOnDemandOptionCellularOnly" = "Solo cellulare";
+"tunnelOnDemandOptionWiFiOrEthernet" = "Wi-Fi o ethernet";
+"tunnelOnDemandOptionEthernetOnly" = "Solo ethernet";
+
+"addPeerButtonTitle" = "Aggiungi peer";
+
+"deletePeerButtonTitle" = "Elimina peer";
+"deletePeerConfirmationAlertButtonTitle" = "Elimina";
+"deletePeerConfirmationAlertMessage" = "Vuoi eliminare questo peer?";
+
+"deleteTunnelButtonTitle" = "Elimina tunnel";
+"deleteTunnelConfirmationAlertButtonTitle" = "Elimina";
+"deleteTunnelConfirmationAlertMessage" = "Vuoi eliminare questo tunnel?";
+
+"tunnelEditPlaceholderTextRequired" = "Richiesto";
+"tunnelEditPlaceholderTextOptional" = "Facoltativo";
+"tunnelEditPlaceholderTextAutomatic" = "Automatico";
+"tunnelEditPlaceholderTextStronglyRecommended" = "Vivamente consigliato";
+"tunnelEditPlaceholderTextOff" = "Spento";
+
+"tunnelPeerPersistentKeepaliveValue (%@)" = "ogni %@ secondi";
+"tunnelHandshakeTimestampNow" = "Ora";
+"tunnelHandshakeTimestampSystemClockBackward" = "(L'orologio va all'indietro)";
+"tunnelHandshakeTimestampAgo (%@)" = "%@ fa";
+"tunnelHandshakeTimestampYear (%d)" = "%d anno";
+"tunnelHandshakeTimestampYears (%d)" = "%d anni";
+"tunnelHandshakeTimestampDay (%d)" = "%d giorno";
+"tunnelHandshakeTimestampDays (%d)" = "%d giorni";
+"tunnelHandshakeTimestampHour (%d)" = "%d ora";
+"tunnelHandshakeTimestampHours (%d)" = "%d ore";
+"tunnelHandshakeTimestampMinute (%d)" = "%d minuto";
+"tunnelHandshakeTimestampMinutes (%d)" = "%d minuti";
+"tunnelHandshakeTimestampSecond (%d)" = "%d secondo";
+"tunnelHandshakeTimestampSeconds (%d)" = "%d secondi";
+
+"tunnelHandshakeTimestampHours hh:mm:ss (%@)" = "%@ ore";
+"tunnelHandshakeTimestampMinutes mm:ss (%@)" = "%@ minuti";
+
+"tunnelPeerPresharedKeyEnabled" = "abilitata";
+
+// Error alerts while creating / editing a tunnel configuration
+
+/* Alert title for error in the interface data */
+"alertInvalidInterfaceTitle" = "Interfaccia non valida";
+
+/* Any one of the following alert messages can go with the above title */
+"alertInvalidInterfaceMessageNameRequired" = "Il nome dell'interfaccia è richiesto";
+"alertInvalidInterfaceMessagePrivateKeyRequired" = "La chiave privata dell'interfaccia è richiesta";
+"alertInvalidInterfaceMessagePrivateKeyInvalid" = "La chiave privata deve essere una chiave a 32 bit con codifica base64";
+"alertInvalidInterfaceMessageAddressInvalid" = "Gli indirizzi dell'interfaccia devono essere un elenco separato da virgole di indirizzi IP, facoltativamente in notazione CIDR";
+"alertInvalidInterfaceMessageListenPortInvalid" = "La porta in ascolto dell'interfaccia deve essere compresa tra 0 e 65535, o non specificata";
+"alertInvalidInterfaceMessageMTUInvalid" = "Il valore di MTU deve essere compreso tra 576 e 65535, o non specificato";
+"alertInvalidInterfaceMessageDNSInvalid" = "I server DNS dell'interfaccia devono essere un elenco separato da virgole di indirizzi IP";
+
+/* Alert title for error in the peer data */
+"alertInvalidPeerTitle" = "Peer non valido";
+
+/* Any one of the following alert messages can go with the above title */
+"alertInvalidPeerMessagePublicKeyRequired" = "La chiave pubblica del peer è richiesta";
+"alertInvalidPeerMessagePublicKeyInvalid" = "La chiave pubblica del peer deve essere una chiave a 32 byte con codifica base64";
+"alertInvalidPeerMessagePreSharedKeyInvalid" = "La chiave pre-condivisa del peer deve essere una chiave a 32 byte con codifica base64";
+"alertInvalidPeerMessageAllowedIPsInvalid" = "Gli IP consentiti del peer devono essere un elenco separato da virgole di indirizzi IP, facoltativamente in notazione CIDR";
+"alertInvalidPeerMessageEndpointInvalid" = "L'endpoint del peer deve essere nella forma ‘host:porta’ o ‘[host]:porta’";
+"alertInvalidPeerMessagePersistentKeepaliveInvalid" = "Il keepalive permanente del peer deve essere compreso tra 0 e 65535, o non specificato";
+"alertInvalidPeerMessagePublicKeyDuplicated" = "Due o più peer non possono avere la stessa chiave pubblica";
+
+// Scanning QR code UI
+
+"scanQRCodeViewTitle" = "Scansione codice QR";
+"scanQRCodeTipText" = "Suggerimento: generalo con `qrencode -t ansiutf8 < tunnel.conf`";
+
+// Scanning QR code alerts
+
+"alertScanQRCodeCameraUnsupportedTitle" = "Fotocamera non supportata";
+"alertScanQRCodeCameraUnsupportedMessage" = "Questo dispositivo non è in grado di analizzare codici QR";
+
+"alertScanQRCodeInvalidQRCodeTitle" = "Codice QR non valido";
+"alertScanQRCodeInvalidQRCodeMessage" = "Il codice QR analizzato non è una configurazione valida di WireGuard";
+
+"alertScanQRCodeUnreadableQRCodeTitle" = "Codice non valido";
+"alertScanQRCodeUnreadableQRCodeMessage" = "Il codice analizzato non può essere letto";
+
+"alertScanQRCodeNamePromptTitle" = "Assegna un nome al tunnel analizzato";
+
+// Settings UI
+
+"settingsViewTitle" = "Impostazioni";
+
+"settingsSectionTitleAbout" = "Informazioni";
+"settingsVersionKeyWireGuardForIOS" = "WireGuard per iOS";
+"settingsVersionKeyWireGuardGoBackend" = "Backend Go di WireGuard";
+
+"settingsSectionTitleExportConfigurations" = "Esporta configurazioni";
+"settingsExportZipButtonTitle" = "Esporta archivio zip";
+
+"settingsSectionTitleTunnelLog" = "Log";
+"settingsViewLogButtonTitle" = "Visualizza log";
+
+// Log view
+
+"logViewTitle" = "Log";
+
+// Log alerts
+
+"alertUnableToRemovePreviousLogTitle" = "Esportazione del log non riuscita";
+"alertUnableToRemovePreviousLogMessage" = "Il log pre-esistente non può essere svuotato";
+
+"alertUnableToWriteLogTitle" = "Esportazione del log non riuscita";
+"alertUnableToWriteLogMessage" = "Impossibile scrivere i log su file";
+
+// Zip import / export error alerts
+
+"alertCantOpenInputZipFileTitle" = "Impossibile leggere l'archivio zip";
+"alertCantOpenInputZipFileMessage" = "Questo archivio zip non può essere letto.";
+
+"alertCantOpenOutputZipFileForWritingTitle" = "Impossibile creare l'archivio zip";
+"alertCantOpenOutputZipFileForWritingMessage" = "Impossibile aprire in file zip per la scrittura.";
+
+"alertBadArchiveTitle" = "Impossibile leggere l'archivio zip";
+"alertBadArchiveMessage" = "Archivio zip non valido o danneggiato.";
+
+"alertNoTunnelsToExportTitle" = "Niente da esportare";
+"alertNoTunnelsToExportMessage" = "Non ci sono tunnel da esportare";
+
+"alertNoTunnelsInImportedZipArchiveTitle" = "Nessun tunnel nell'archivio zip";
+"alertNoTunnelsInImportedZipArchiveMessage" = "Non è stato trovato alcun file .conf di tunnel all'interno dell'archivio zip.";
+
+// Conf import error alerts
+
+"alertCantOpenInputConfFileTitle" = "Impossibile importare da file";
+"alertCantOpenInputConfFileMessage (%@)" = "Il file ‘%@’ non può essere letto.";
+
+// Tunnel management error alerts
+
+"alertTunnelActivationFailureTitle" = "Attivazione non riuscita";
+"alertTunnelActivationFailureMessage" = "Il tunnel non può essere attivato. Assicurati di essere connesso a Internet.";
+"alertTunnelActivationSavedConfigFailureMessage" = "Impossibile recuperare le Informazioni del tunnel dalla configurazione salvata.";
+"alertTunnelActivationBackendFailureMessage" = "Impossibile attivare la libreria del backend Go.";
+"alertTunnelActivationFileDescriptorFailureMessage" = "Impossibile determinare il descrittore file del dispositivo TUN.";
+"alertTunnelActivationSetNetworkSettingsMessage" = "Impossibile applicare le Impostazioni di rete all'oggetto del tunnel";
+
+"alertTunnelActivationFailureOnDemandAddendum" = " Questo tunnel è stato attivato su richiesta, per cui potrebbe essere riattivato automaticamente dal sistema operativo. Puoi disabilitare Attiva su richiesta in questa applicazione modificando la configurazione del tunnel.";
+
+"alertTunnelDNSFailureTitle" = "Risoluzione DNS non riuscita";
+"alertTunnelDNSFailureMessage" = "Uno o più domini di endpoint non può essere risolto.";
+
+"alertTunnelNameEmptyTitle" = "Nessun nome fornito";
+"alertTunnelNameEmptyMessage" = "Impossibile creare un tunnel con un nome vuoto";
+
+"alertTunnelAlreadyExistsWithThatNameTitle" = "Il nome esiste già";
+"alertTunnelAlreadyExistsWithThatNameMessage" = "Un tunnel con quel nome esiste già";
+
+"alertTunnelActivationErrorTunnelIsNotInactiveTitle" = "Attivazione in corso";
+"alertTunnelActivationErrorTunnelIsNotInactiveMessage" = "Il tunnel è già attivo o in fase di attivazione";
+
+// Tunnel management error alerts on system error
+
+/* The alert message that goes with the following titles would be
+   one of the alertSystemErrorMessage* listed further down */
+"alertSystemErrorOnListingTunnelsTitle" = "Impossibile elencare i tunnel";
+"alertSystemErrorOnAddTunnelTitle" = "Impossibile creare i tunnel";
+"alertSystemErrorOnModifyTunnelTitle" = "Impossibile modificare il tunnel";
+"alertSystemErrorOnRemoveTunnelTitle" = "Impossibile rimuovere il tunnel";
+
+/* The alert message for this alert shall include
+ one of the alertSystemErrorMessage* listed further down */
+"alertTunnelActivationSystemErrorTitle" = "Attivazione non riuscita";
+"alertTunnelActivationSystemErrorMessage (%@)" = "Il tunnel non può essere attivato. %@";
+
+/* alertSystemErrorMessage* messages */
+"alertSystemErrorMessageTunnelConfigurationInvalid" = "La configurazione non è valida.";
+"alertSystemErrorMessageTunnelConfigurationDisabled" = "La configurazione è disabilitata.";
+"alertSystemErrorMessageTunnelConnectionFailed" = "La connessione non è riuscita.";
+"alertSystemErrorMessageTunnelConfigurationStale" = "La configurazione è obsoleta.";
+"alertSystemErrorMessageTunnelConfigurationReadWriteFailed" = "La lettura o la scrittura della configurazione non è riuscita.";
+"alertSystemErrorMessageTunnelConfigurationUnknown" = "Errore di sistema sconosciuto.";
+
+// Mac status bar menu / pulldown menu / main menu
+
+"macMenuNetworks (%@)" = "Reti: %@";
+"macMenuNetworksNone" = "Reti: nessuna";
+
+"macMenuTitle" = "WireGuard";
+"macMenuManageTunnels" = "Gestisci i tunnel";
+"macMenuImportTunnels" = "Importa tunnel da file…";
+"macMenuAddEmptyTunnel" = "Aggiungi tunnel vuoto…";
+"macMenuViewLog" = "Visualizza log";
+"macMenuExportTunnels" = "Esporta tunnel in Zip…";
+"macMenuAbout" = "Informazioni su WireGuard";
+"macMenuQuit" = "Chiudi WireGuard";
+
+"macMenuHideApp" = "Nascondi WireGuard";
+"macMenuHideOtherApps" = "Nascondi altri";
+"macMenuShowAllApps" = "Mostra tutto";
+
+"macMenuFile" = "File";
+"macMenuCloseWindow" = "Chiudi finestra";
+
+"macMenuEdit" = "Modifica";
+"macMenuCut" = "Taglia";
+"macMenuCopy" = "Copia";
+"macMenuPaste" = "Incolla";
+"macMenuSelectAll" = "Seleziona tutto";
+
+"macMenuTunnel" = "Tunnel";
+"macMenuToggleStatus" = "Commuta stato";
+"macMenuEditTunnel" = "Modifica…";
+"macMenuDeleteSelected" = "Elimina selezionati";
+
+"macMenuWindow" = "Finestra";
+"macMenuMinimize" = "Minimizza";
+"macMenuZoom" = "Zoom";
+
+// Mac manage tunnels window
+
+"macWindowTitleManageTunnels" = "Gestisci i tunnel di WireGuard";
+
+"macDeleteTunnelConfirmationAlertMessage (%@)" = "Sei sicuro di voler eliminare ‘%@’?";
+"macDeleteMultipleTunnelsConfirmationAlertMessage (%d)" = "Sei sicuro di voler eliminare %d tunnel?";
+"macDeleteTunnelConfirmationAlertInfo" = "Non puoi annullare questa azione.";
+"macDeleteTunnelConfirmationAlertButtonTitleDelete" = "Elimina";
+"macDeleteTunnelConfirmationAlertButtonTitleCancel" = "Annulla";
+"macDeleteTunnelConfirmationAlertButtonTitleDeleting" = "Eliminazione…";
+
+"macButtonImportTunnels" = "Importa tunnel da file";
+"macSheetButtonImport" = "Importa";
+
+"macNameFieldExportLog" = "Salva i log in:";
+"macSheetButtonExportLog" = "Salva";
+
+"macNameFieldExportZip" = "Esporta i tunnel in:";
+"macSheetButtonExportZip" = "Salva";
+
+"macButtonDeleteTunnels (%d)" = "Elimina %d tunnel";
+
+// Mac detail/edit view fields
+
+"macFieldKey (%@)" = "%@:";
+"macFieldOnDemand" = "Su richiesta:";
+"macFieldOnDemandSSIDs" = "SSID:";
+
+// Mac status display
+
+"macStatus (%@)" = "Stato: %@";
+
+// Mac editing config
+
+"macEditDiscard" = "Scarta";
+"macEditSave" = "Salva";
+
+"macAlertNameIsEmpty" = "Il nome è richiesto";
+"macAlertDuplicateName (%@)" = "Un altro tunnel con il nome ‘%@’ esiste già.";
+
+"macAlertInvalidLine (%@)" = "Riga non valida: ‘%@’.";
+
+"macAlertNoInterface" = "La configurazione deve avere una sezione ‘Interface’.";
+"macAlertMultipleInterfaces" = "La configurazione deve avere solo una sezione ‘Interface’.";
+"macAlertPrivateKeyInvalid" = "La chiave privata non è valida.";
+"macAlertListenPortInvalid (%@)" = "La porta in ascolto ‘%@’ non è valida.";
+"macAlertAddressInvalid (%@)" = "L'indirizzo %@’ non è valido.";
+"macAlertDNSInvalid (%@)" = "Il DNS ‘%@’ non valido.";
+"macAlertMTUInvalid (%@)" = "Il valore di MTU ‘%@’ non è valido.";
+
+"macAlertUnrecognizedInterfaceKey (%@)" = "L'interfaccia contiene una chiave non riconosciuta ‘%@’";
+"macAlertInfoUnrecognizedInterfaceKey" = "Chiavi valide sono: ‘PrivateKey’, ‘ListenPort’, ‘Address’, ‘DNS’ e ‘MTU’.";
+
+"macAlertPublicKeyInvalid" = "La chiave pubblica non è valida";
+"macAlertPreSharedKeyInvalid" = "La chiave pre-condivisa non è valida";
+"macAlertAllowedIPInvalid (%@)" = "L'IP consentito ‘%@’ non è valido";
+"macAlertEndpointInvalid (%@)" = "L'endpoint ‘%@’ non è valido";
+"macAlertPersistentKeepliveInvalid (%@)" = "Il valore di keepalive permanente ‘%@’ non è valido";
+
+"macAlertUnrecognizedPeerKey (%@)" = "Peer contiene una chiave non riconosciuta ‘%@’";
+"macAlertInfoUnrecognizedPeerKey" = "Chiavi valide sono: ‘PublicKey’, ‘PresharedKey’, ‘AllowedIPs’, ‘Endpoint’ e ‘PersistentKeepalive’";
+
+"macAlertMultipleEntriesForKey (%@)" = "Dovrebbe esistere solo una voce per sezione della chiave ‘%@’";
+
+// Mac about dialog
+
+"macAppVersion (%@)" = "Versione applicazione: %@";
+"macGoBackendVersion (%@)" = "Versione backend Go: %@";
+
+// Privacy
+
+"macExportPrivateData" = "esporta chiavi private dei tunnel";
+"macViewPrivateData" = "visualizza chiavi private dei tunnel";
+"iosExportPrivateData" = "Autenticati per esportare le chiavi private dei tunnel.";
+"iosViewPrivateData" = "Autenticati per visualizzare le chiavi private dei tunnel.";
+
+// Mac alert
+
+"macConfirmAndQuitAlertMessage" = "Vuoi chiudere il gestore dei tunnel o chiudere completamente WireGuard?";
+"macConfirmAndQuitAlertInfo" = "Se chiudi il gestore dei tunnel, WireGuard continuerà a essere disponibile dall'icona della barra dei menu.";
+"macConfirmAndQuitInfoWithActiveTunnel (%@)" = "Se chiudi il gestore dei tunnel, WireGuard continuerà a essere disponibile dall'icona della barra dei menu.\n\nNota che se vuoi chiudere completamente WireGuard il tunnel attualmente attivo ('%@') rimarrà attivo fino a quando lo disabiliti da questa applicazione o tramite il pannello Rete nelle Preferenze di Sistema.";
+"macConfirmAndQuitAlertQuitWireGuard" = "Chiudi WireGuard";
+"macConfirmAndQuitAlertCloseWindow" = "Chiudi il gestore dei tunnel";
+
+"macAppExitingWithActiveTunnelMessage" = "WireGuard sta per essere chiuso con un tunnel attivo";
+"macAppExitingWithActiveTunnelInfo" = "Il tunnel rimarrà attivo dopo l'uscita. Puoi disabilitarlo riaprendo questa applicazione o tramite il pannello Rete nelle Preferenze di Sistema.";
+
+// Mac tooltip
+
+"macToolTipEditTunnel" = "Modifica tunnel (⌘E)";
+"macToolTipToggleStatus" = "Commuta stato (⌘T)";
+
+// Mac log view
+
+"macLogColumnTitleTime" = "Time";
+"macLogColumnTitleLogMessage" = "Messaggio di log";
+"macLogButtonTitleClose" = "Chiudi";
+"macLogButtonTitleSave" = "Salva…";
+
+// Mac unusable tunnel view
+
+"macUnusableTunnelMessage" = "La configurazione per questo tunnel non è presente nel tuo portachiavi.";
+"macUnusableTunnelInfo" = "Nel caso in cui questo tunnel sia stato creato da un altro utente, solo tale utente può visualizzare, modificare o attivare il tunnel.";
+"macUnusableTunnelButtonTitleDeleteTunnel" = "Elimina tunnel";
+
+// Mac App Store updating alert
+
+"macAppStoreUpdatingAlertMessage" = "App Store vuole aggiornare WireGuard";
+"macAppStoreUpdatingAlertInfoWithOnDemand (%@)" = "Disabilita l'attivazione su richiesta del tunnel ‘%@’, disattivalo e continua l'aggiornamento in App Store.";
+"macAppStoreUpdatingAlertInfoWithoutOnDemand (%@)" = "Disattiva il tunnel ‘%@’ e continua l'aggiornamento in App Store.";
+
+// Donation
+
+"donateLink" = "♥ Fai una donazione al WireGuard Project";
-- 
2.26.0

