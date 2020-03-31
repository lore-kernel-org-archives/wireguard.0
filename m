Return-Path: <SRS0=yWyP=5Q=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D6DC43331
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 31 Mar 2020 07:39:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AE502072A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 31 Mar 2020 07:39:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhsmBq7v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AE502072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 598d3bce;
	Tue, 31 Mar 2020 07:31:14 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8010536d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Mar 2020 07:31:12 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id 65so24620689wrl.1
 for <wireguard@lists.zx2c4.com>; Tue, 31 Mar 2020 00:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PUzebqElyCxyrHeswJPqplWo1nbnbBvt52lJxdZATcA=;
 b=XhsmBq7v8iXxDtSY1RdvjKWVWkBYe72rCBGA7QLRqVc02sMd446eYqgxQl5ME+MQhd
 DU2BK6v2MNdPaojf0thcpHE/nfkOV7HeUwIuqIp30VIajtUnKtnOmpD26o9XFs49QYgo
 SG/0Mi12AGWnZEwr3N4tpGRDX5A5/pyxF6o6WWNLxx06oF57cRQNidJl6Ft9O89I2GW+
 o1rdbI0k6+nwBaVfqkD1L4gZFYhwdYiFBUoWhZz0P1swysKVNIu+of2x0QaUg/ZQ7x0d
 wFkRLjNObyAT9dQZ7AarkOsswkISzAR9xZA6jm6NpYLpJeZwLC7nmDdBZ/3BHCoxxBA7
 /WbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PUzebqElyCxyrHeswJPqplWo1nbnbBvt52lJxdZATcA=;
 b=E+9trlcURINd4d/xhfwKnADWPAcI5lMRy3721/Vmy3nCLD2W4zfvRiRA2ZtkC4nznM
 GJrHjlWIf2Y/yUQ9Leic/4V9eA9bfo49ESyXKh8f5TwiayqrVdLTRCZWsLnUkjjaZ0g5
 Eafrs/4zxNKgxfZfzy82VxS8HGGKPFEZpLilVWzZV4SU0Wf7tajm+nh/grX0GocNjQvF
 uXoPC6/hPcEjXXZFfmOGL9AGnCV7FAIHfjPvm9sHTWKEzdu4oCFvKwGbP8xXRZk2oOK0
 x7I8dmEgK22FcHhDkv2xFQuojHMCEmcfTjdTPP4ECXnwym9JZynMIdHCvRxiOgcLmbKI
 cgoQ==
X-Gm-Message-State: ANhLgQ1lKVVCEBBQ2+yKEN2QBil5JpVvcPRzrn+0EjPJ1f6Z8irGgWUA
 D+YJ+lCWqQ+SkGlpmnq9zYSQq8ft+NE=
X-Google-Smtp-Source: ADFU+vtEQP936F7A+gJ5cSDNYTM+Gxvg+evywPDIM7DSQWn1D6TQ7ObdMorDi26DEA7eH1gK2FYOhQ==
X-Received: by 2002:adf:dd8f:: with SMTP id x15mr20271665wrl.201.1585640349325; 
 Tue, 31 Mar 2020 00:39:09 -0700 (PDT)
Received: from jupiter.localdomain ([151.40.226.243])
 by smtp.gmail.com with ESMTPSA id l4sm24248594wru.1.2020.03.31.00.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 00:39:08 -0700 (PDT)
From: Vincenzo Reale <vinx.reale@gmail.com>
X-Google-Original-From: Vincenzo Reale <smart2128@baslug.org>
To: wireguard@lists.zx2c4.com
Cc: Vincenzo Reale <smart2128@baslug.org>
Subject: [PATCH] Windows Italian translation
Date: Tue, 31 Mar 2020 09:39:01 +0200
Message-Id: <20200331073901.40209-1-smart2128@baslug.org>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Signed-off-by: Vincenzo Reale <smart2128@baslug.org>
---
 gotext.go                       |    2 +-
 locales/it/messages.gotext.json | 1627 +++++++++++++++++++++++++++++++
 resources.rc                    |    7 +
 3 files changed, 1635 insertions(+), 1 deletion(-)
 create mode 100644 locales/it/messages.gotext.json

diff --git a/gotext.go b/gotext.go
index 1e83a1a1..2c1c47b4 100644
--- a/gotext.go
+++ b/gotext.go
@@ -1,5 +1,5 @@
 // +build generate
-//go:generate go run gotext.go -srclang=en update -out=zgotext.go -lang=en,fr,ja,sl
+//go:generate go run gotext.go -srclang=en update -out=zgotext.go -lang=en,fr,ja,sl,it
 
 /* SPDX-License-Identifier: MIT
  *
diff --git a/locales/it/messages.gotext.json b/locales/it/messages.gotext.json
new file mode 100644
index 00000000..6e349445
--- /dev/null
+++ b/locales/it/messages.gotext.json
@@ -0,0 +1,1627 @@
+{
+    "language": "it",
+    "messages": [
+        {
+            "id": "Error",
+            "message": "Error",
+            "translation": "Errore"
+        },
+        {
+            "id": "(no argument): elevate and install manager service",
+            "message": "(no argument): elevate and install manager service",
+            "translation": "(nessun argomento): eleva e installa il servizio di gestione"
+        },
+        {
+            "id": "Usage: {Args0} [\n{String}]",
+            "message": "Usage: {Args0} [\n{String}]",
+            "translation": "Utilizzo: {Args0} [\n{String}]",
+            "placeholders": [
+                {
+                    "id": "Args0",
+                    "string": "%[1]s",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 1,
+                    "expr": "os.Args[0]"
+                },
+                {
+                    "id": "String",
+                    "string": "%[2]s",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 2,
+                    "expr": "builder.String()"
+                }
+            ]
+        },
+        {
+            "id": "Command Line Options",
+            "message": "Command Line Options",
+            "translation": "Opzioni riga di comando"
+        },
+        {
+            "id": "Unable to determine whether the process is running under WOW64: {Err}",
+            "message": "Unable to determine whether the process is running under WOW64: {Err}",
+            "translation": "Impossibile determinare se il processo è in esecuzione in WOW64: {Err}",
+            "placeholders": [
+                {
+                    "id": "Err",
+                    "string": "%[1]v",
+                    "type": "error",
+                    "underlyingType": "interface{Error() string}",
+                    "argNum": 1,
+                    "expr": "err"
+                }
+            ]
+        },
+        {
+            "id": "You must use the 64-bit version of WireGuard on this computer.",
+            "message": "You must use the 64-bit version of WireGuard on this computer.",
+            "translation": "Devi utilizzare la versione a 64 bit di WireGuard su questo computer."
+        },
+        {
+            "id": "Unable to open current process token: {Err}",
+            "message": "Unable to open current process token: {Err}",
+            "translation": "Impossibile aprire il token del processo corrente: {Err}",
+            "placeholders": [
+                {
+                    "id": "Err",
+                    "string": "%[1]v",
+                    "type": "error",
+                    "underlyingType": "interface{Error() string}",
+                    "argNum": 1,
+                    "expr": "err"
+                }
+            ]
+        },
+        {
+            "id": "WireGuard may only be used by users who are a member of the Builtin {AdminGroupName} group.",
+            "message": "WireGuard may only be used by users who are a member of the Builtin {AdminGroupName} group.",
+            "translation": "WireGuard può essere utilizzato solo dagli utenti membri del gruppo {AdminGroupName} di sistema.",
+            "placeholders": [
+                {
+                    "id": "AdminGroupName",
+                    "string": "%[1]s",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 1,
+                    "expr": "elevate.AdminGroupName()"
+                }
+            ]
+        },
+        {
+            "id": "WireGuard is running, but the UI is only accessible from desktops of the Builtin {AdminGroupName} group.",
+            "message": "WireGuard is running, but the UI is only accessible from desktops of the Builtin {AdminGroupName} group.",
+            "translation": "WireGuard è in esecuzione, ma l'interfaccia utente è accessibile solo dai desktop del gruppo {AdminGroupName} di sistema.",
+            "placeholders": [
+                {
+                    "id": "AdminGroupName",
+                    "string": "%[1]s",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 1,
+                    "expr": "elevate.AdminGroupName()"
+                }
+            ]
+        },
+        {
+            "id": "WireGuard system tray icon did not appear after 30 seconds.",
+            "message": "WireGuard system tray icon did not appear after 30 seconds.",
+            "translation": "L'icona della barra delle applicazioni di WireGuard non è apparsa dopo 30 secondi."
+        },
+        {
+            "id": "Now",
+            "message": "Now",
+            "translation": "Ora"
+        },
+        {
+            "id": "System clock wound backward!",
+            "message": "System clock wound backward!",
+            "translation": "L'orologio di sistema va all'indietro!"
+        },
+        {
+            "id": "{Years} year(s)",
+            "message": "{Years} year(s)",
+            "translation": {
+                "select": {
+                    "feature": "plural",
+                    "arg": "Years",
+                    "cases": {
+                        "one": {
+                            "msg": "{Years} anno"
+                        },
+                        "other": {
+                            "msg": "{Years} anni"
+                        }
+                    }
+                }
+            },
+            "placeholders": [
+                {
+                    "id": "Years",
+                    "string": "%[1]d",
+                    "type": "int64",
+                    "underlyingType": "int64",
+                    "argNum": 1,
+                    "expr": "years"
+                }
+            ]
+        },
+        {
+            "id": "{Days} day(s)",
+            "message": "{Days} day(s)",
+            "translation": {
+                "select": {
+                    "feature": "plural",
+                    "arg": "Days",
+                    "cases": {
+                        "one": {
+                            "msg": "{Days} giorno"
+                        },
+                        "other": {
+                            "msg": "{Days} giorni"
+                        }
+                    }
+                }
+            },
+            "placeholders": [
+                {
+                    "id": "Days",
+                    "string": "%[1]d",
+                    "type": "int64",
+                    "underlyingType": "int64",
+                    "argNum": 1,
+                    "expr": "days"
+                }
+            ]
+        },
+        {
+            "id": "{Hours} hour(s)",
+            "message": "{Hours} hour(s)",
+            "translation": {
+                "select": {
+                    "feature": "plural",
+                    "arg": "Hours",
+                    "cases": {
+                        "one": {
+                            "msg": "{Hours} ora"
+                        },
+                        "other": {
+                            "msg": "{Hours} ore"
+                        }
+                    }
+                }
+            },
+            "placeholders": [
+                {
+                    "id": "Hours",
+                    "string": "%[1]d",
+                    "type": "int64",
+                    "underlyingType": "int64",
+                    "argNum": 1,
+                    "expr": "hours"
+                }
+            ]
+        },
+        {
+            "id": "{Minutes} minute(s)",
+            "message": "{Minutes} minute(s)",
+            "translation": {
+                "select": {
+                    "feature": "plural",
+                    "arg": "Minutes",
+                    "cases": {
+                        "one": {
+                            "msg": "{Minutes} minuto"
+                        },
+                        "other": {
+                            "msg": "{Minutes} minuti"
+                        }
+                    }
+                }
+            },
+            "placeholders": [
+                {
+                    "id": "Minutes",
+                    "string": "%[1]d",
+                    "type": "int64",
+                    "underlyingType": "int64",
+                    "argNum": 1,
+                    "expr": "minutes"
+                }
+            ]
+        },
+        {
+            "id": "{Seconds} second(s)",
+            "message": "{Seconds} second(s)",
+            "translation": {
+                "select": {
+                    "feature": "plural",
+                    "arg": "Seconds",
+                    "cases": {
+                        "one": {
+                            "msg": "{Seconds} secondo"
+                        },
+                        "other": {
+                            "msg": "{Seconds} secondi"
+                        }
+                    }
+                }
+            },
+            "placeholders": [
+                {
+                    "id": "Seconds",
+                    "string": "%[1]d",
+                    "type": "int64",
+                    "underlyingType": "int64",
+                    "argNum": 1,
+                    "expr": "seconds"
+                }
+            ]
+        },
+        {
+            "id": "{Timestamp} ago",
+            "message": "{Timestamp} ago",
+            "translation": "{Timestamp} fa",
+            "placeholders": [
+                {
+                    "id": "Timestamp",
+                    "string": "%[1]s",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 1,
+                    "expr": "timestamp"
+                }
+            ]
+        },
+        {
+            "id": "{Bytes} B",
+            "message": "{Bytes} B",
+            "translation": "{Bytes} B",
+            "placeholders": [
+                {
+                    "id": "Bytes",
+                    "string": "%[1]d",
+                    "type": "golang.zx2c4.com/wireguard/windows/conf.Bytes",
+                    "underlyingType": "uint64",
+                    "argNum": 1,
+                    "expr": "b"
+                }
+            ]
+        },
+        {
+            "id": "{Float64b__1024} KiB",
+            "message": "{Float64b__1024} KiB",
+            "translation": "{Float64b__1024} KiB",
+            "placeholders": [
+                {
+                    "id": "Float64b__1024",
+                    "string": "%.2[1]f",
+                    "type": "float64",
+                    "underlyingType": "float64",
+                    "argNum": 1,
+                    "expr": "float64(b) / 1024"
+                }
+            ]
+        },
+        {
+            "id": "{Float64b__1024__1024} MiB",
+            "message": "{Float64b__1024__1024} MiB",
+            "translation": "{Float64b__1024__1024} Mi",
+            "placeholders": [
+                {
+                    "id": "Float64b__1024__1024",
+                    "string": "%.2[1]f",
+                    "type": "float64",
+                    "underlyingType": "float64",
+                    "argNum": 1,
+                    "expr": "float64(b) / (1024 * 1024)"
+                }
+            ]
+        },
+        {
+            "id": "{Float64b__1024__1024__1024} GiB",
+            "message": "{Float64b__1024__1024__1024} GiB",
+            "translation": "{Float64b__1024__1024__1024} GiB",
+            "placeholders": [
+                {
+                    "id": "Float64b__1024__1024__1024",
+                    "string": "%.2[1]f",
+                    "type": "float64",
+                    "underlyingType": "float64",
+                    "argNum": 1,
+                    "expr": "float64(b) / (1024 * 1024 * 1024)"
+                }
+            ]
+        },
+        {
+            "id": "{Float64b__1024__1024__1024__1024} TiB",
+            "message": "{Float64b__1024__1024__1024__1024} TiB",
+            "translation": "{Float64b__1024__1024__1024__1024} TiB",
+            "placeholders": [
+                {
+                    "id": "Float64b__1024__1024__1024__1024",
+                    "string": "%.2[1]f",
+                    "type": "float64",
+                    "underlyingType": "float64",
+                    "argNum": 1,
+                    "expr": "float64(b) / (1024 * 1024 * 1024) / 1024"
+                }
+            ]
+        },
+        {
+            "id": "{Why}: {Offender}",
+            "message": "{Why}: {Offender}",
+            "translation": "{Why}: {Offender}",
+            "placeholders": [
+                {
+                    "id": "Why",
+                    "string": "%[1]s",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 1,
+                    "expr": "e.why"
+                },
+                {
+                    "id": "Offender",
+                    "string": "%[2]q",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 2,
+                    "expr": "e.offender"
+                }
+            ]
+        },
+        {
+            "id": "Invalid IP address",
+            "message": "Invalid IP address",
+            "translation": "Indirizzo IP non valido"
+        },
+        {
+            "id": "Invalid network prefix length",
+            "message": "Invalid network prefix length",
+            "translation": "Lunghezza del prefisso di rete non valida"
+        },
+        {
+            "id": "Missing port from endpoint",
+            "message": "Missing port from endpoint",
+            "translation": "Manca la porta dall'endpoint"
+        },
+        {
+            "id": "Invalid endpoint host",
+            "message": "Invalid endpoint host",
+            "translation": "Host dell'endpoint non valido"
+        },
+        {
+            "id": "Brackets must contain an IPv6 address",
+            "message": "Brackets must contain an IPv6 address",
+            "translation": "Le parentesi devono contenere un indirizzo IPv6"
+        },
+        {
+            "id": "Invalid MTU",
+            "message": "Invalid MTU",
+            "translation": "MTU non valido"
+        },
+        {
+            "id": "Invalid port",
+            "message": "Invalid port",
+            "translation": "Porta non valida"
+        },
+        {
+            "id": "Invalid persistent keepalive",
+            "message": "Invalid persistent keepalive",
+            "translation": "Keepalive permanente non valido"
+        },
+        {
+            "id": "Invalid key: {Err}",
+            "message": "Invalid key: {Err}",
+            "translation": "Chiave non valida: {Err}",
+            "placeholders": [
+                {
+                    "id": "Err",
+                    "string": "%[1]v",
+                    "type": "error",
+                    "underlyingType": "interface{Error() string}",
+                    "argNum": 1,
+                    "expr": "err"
+                }
+            ]
+        },
+        {
+            "id": "Keys must decode to exactly 32 bytes",
+            "message": "Keys must decode to exactly 32 bytes",
+            "translation": "Le chiavi devono decodificare esattamente 32 byte"
+        },
+        {
+            "id": "Number must be a number between 0 and 2^64-1: {Err}",
+            "message": "Number must be a number between 0 and 2^64-1: {Err}",
+            "translation": "Il numero deve essere un numero compreso tra 0 e 2^64-1: {Err}",
+            "placeholders": [
+                {
+                    "id": "Err",
+                    "string": "%[1]v",
+                    "type": "error",
+                    "underlyingType": "interface{Error() string}",
+                    "argNum": 1,
+                    "expr": "err"
+                }
+            ]
+        },
+        {
+            "id": "Two commas in a row",
+            "message": "Two commas in a row",
+            "translation": "Due virgole in una riga"
+        },
+        {
+            "id": "Tunnel name is not valid",
+            "message": "Tunnel name is not valid",
+            "translation": "Il nome del tunnel non è valido"
+        },
+        {
+            "id": "Line must occur in a section",
+            "message": "Line must occur in a section",
+            "translation": "Una riga deve essere presente in una sezione"
+        },
+        {
+            "id": "Invalid config key is missing an equals separator",
+            "message": "Invalid config key is missing an equals separator",
+            "translation": "Chiave di configurazione non valida manca di un separatore di uguale"
+        },
+        {
+            "id": "Key must have a value",
+            "message": "Key must have a value",
+            "translation": "La chiave deve avere un valore"
+        },
+        {
+            "id": "Invalid key for [Interface] section",
+            "message": "Invalid key for [Interface] section",
+            "translation": "Chiave non valida per la sezione [Interface]"
+        },
+        {
+            "id": "Invalid key for [Peer] section",
+            "message": "Invalid key for [Peer] section",
+            "translation": "Chiave non valida per la sezione [Peer]"
+        },
+        {
+            "id": "An interface must have a private key",
+            "message": "An interface must have a private key",
+            "translation": "Un'interfaccia deve avere una chiave privata"
+        },
+        {
+            "id": "[none specified]",
+            "message": "[none specified]",
+            "translation": "[non specificato]"
+        },
+        {
+            "id": "All peers must have public keys",
+            "message": "All peers must have public keys",
+            "translation": "Tutti i peer devono avere una chiave pubblica"
+        },
+        {
+            "id": "Error in getting configuration",
+            "message": "Error in getting configuration",
+            "translation": "Errore durante il recupero della configurazione"
+        },
+        {
+            "id": "Invalid key for interface section",
+            "message": "Invalid key for interface section",
+            "translation": "Chiave non valida per la sezione dell'interfaccia"
+        },
+        {
+            "id": "Protocol version must be 1",
+            "message": "Protocol version must be 1",
+            "translation": "La versione del protocollo deve essere 1"
+        },
+        {
+            "id": "Invalid key for peer section",
+            "message": "Invalid key for peer section",
+            "translation": "Chiave non valida per la sezione peer"
+        },
+        {
+            "id": "[EnumerationSeparator]",
+            "message": "[EnumerationSeparator]",
+            "translation": ", ",
+            "comment": "Text to insert between items when listing - most western languages will translate ‘[EnumerationSeparator]’ into ‘, ’ to produce lists like ‘apple, orange, strawberry’. Eastern languages might translate into ‘、’ to produce lists like ‘リンゴ、オレンジ、イチゴ’."
+        },
+        {
+            "id": "[UnitSeparator]",
+            "message": "[UnitSeparator]",
+            "translation": " ",
+            "comment": "Text to insert when combining units of a measure - most languages will translate ‘[UnitSeparator]’ into ‘ ’ (space) to produce lists like ‘2 minuti 30 sekund’, or empty string ‘’ to produce ‘2分30秒’."
+        },
+        {
+            "id": "About WireGuard",
+            "message": "About WireGuard",
+            "translation": "Informazioni su WireGuard"
+        },
+        {
+            "id": "WireGuard logo image",
+            "message": "WireGuard logo image",
+            "translation": "Immagine del logo di WireGuard"
+        },
+        {
+            "id": "App version: {Number}\nGo backend version: {WireGuardGoVersion}\nGo version: {Version_go}\nOperating system: {OsName}\nArchitecture: {GOARCH}",
+            "message": "App version: {Number}\nGo backend version: {WireGuardGoVersion}\nGo version: {Version_go}\nOperating system: {OsName}\nArchitecture: {GOARCH}",
+            "translation": "Versione applicazione: {Number}\nVersione backend Go: {WireGuardGoVersion}\nVersione Go: {Version_go}\nSistema operativo: {OsName}\nArchitettura: {GOARCH}",
+            "placeholders": [
+                {
+                    "id": "Number",
+                    "string": "%[1]s",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 1,
+                    "expr": "version.Number"
+                },
+                {
+                    "id": "WireGuardGoVersion",
+                    "string": "%[2]s",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 2,
+                    "expr": "device.WireGuardGoVersion"
+                },
+                {
+                    "id": "Version_go",
+                    "string": "%[3]s",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 3,
+                    "expr": "strings.TrimPrefix(runtime.Version(), \"go\")"
+                },
+                {
+                    "id": "OsName",
+                    "string": "%[4]s",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 4,
+                    "expr": "version.OsName()"
+                },
+                {
+                    "id": "GOARCH",
+                    "string": "%[5]s",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 5,
+                    "expr": "runtime.GOARCH"
+                }
+            ]
+        },
+        {
+            "id": "Close",
+            "message": "Close",
+            "translation": "Chiudi"
+        },
+        {
+            "id": "♥ \u0026Donate!",
+            "message": "♥ \u0026Donate!",
+            "translation": "♥ Fai una \u0026donazione!"
+        },
+        {
+            "id": "Status:",
+            "message": "Status:",
+            "translation": "Stato"
+        },
+        {
+            "id": "\u0026Deactivate",
+            "message": "\u0026Deactivate",
+            "translation": "\u0026Disattiva"
+        },
+        {
+            "id": "\u0026Activate",
+            "message": "\u0026Activate",
+            "translation": "\u0026Attiva"
+        },
+        {
+            "id": "Public key:",
+            "message": "Public key:",
+            "translation": "Chiave pubblica"
+        },
+        {
+            "id": "Listen port:",
+            "message": "Listen port:",
+            "translation": "Porta in ascolto"
+        },
+        {
+            "id": "MTU:",
+            "message": "MTU:",
+            "translation": "MTU"
+        },
+        {
+            "id": "Addresses:",
+            "message": "Addresses:",
+            "translation": "Indirizzi"
+        },
+        {
+            "id": "DNS servers:",
+            "message": "DNS servers:",
+            "translation": "Server DNS"
+        },
+        {
+            "id": "Preshared key:",
+            "message": "Preshared key:",
+            "translation": "Chiave pre-condivisa"
+        },
+        {
+            "id": "Allowed IPs:",
+            "message": "Allowed IPs:",
+            "translation": "IP consentiti"
+        },
+        {
+            "id": "Endpoint:",
+            "message": "Endpoint:",
+            "translation": "Endpoint"
+        },
+        {
+            "id": "Persistent keepalive:",
+            "message": "Persistent keepalive:",
+            "translation": "Keepalive permanente"
+        },
+        {
+            "id": "Latest handshake:",
+            "message": "Latest handshake:",
+            "translation": "Ultima negoziazione"
+        },
+        {
+            "id": "Transfer:",
+            "message": "Transfer:",
+            "translation": "Trasferimento"
+        },
+        {
+            "id": "enabled",
+            "message": "enabled",
+            "translation": "abilitato"
+        },
+        {
+            "id": "{String} received, {String_1} sent",
+            "message": "{String} received, {String_1} sent",
+            "translation": "{String} ricevuti, {String_1} inviati",
+            "placeholders": [
+                {
+                    "id": "String",
+                    "string": "%[1]s",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 1,
+                    "expr": "c.RxBytes.String()"
+                },
+                {
+                    "id": "String_1",
+                    "string": "%[2]s",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 2,
+                    "expr": "c.TxBytes.String()"
+                }
+            ]
+        },
+        {
+            "id": "Failed to determine tunnel state",
+            "message": "Failed to determine tunnel state",
+            "translation": "Determinazione dello stato del tunnel non riuscita"
+        },
+        {
+            "id": "Failed to activate tunnel",
+            "message": "Failed to activate tunnel",
+            "translation": "Attivazione del tunnel non riuscita"
+        },
+        {
+            "id": "Failed to deactivate tunnel",
+            "message": "Failed to deactivate tunnel",
+            "translation": "Disattivazione del tunnel non riuscita"
+        },
+        {
+            "id": "Interface: {Name}",
+            "message": "Interface: {Name}",
+            "translation": "Interfaccia: {Name}",
+            "placeholders": [
+                {
+                    "id": "Name",
+                    "string": "%[1]s",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 1,
+                    "expr": "config.Name"
+                }
+            ]
+        },
+        {
+            "id": "Peer",
+            "message": "Peer",
+            "translation": "Peer"
+        },
+        {
+            "id": "Create new tunnel",
+            "message": "Create new tunnel",
+            "translation": "Crea tunnel"
+        },
+        {
+            "id": "Edit tunnel",
+            "message": "Edit tunnel",
+            "translation": "Modifica tunnel"
+        },
+        {
+            "id": "\u0026Name:",
+            "message": "\u0026Name:",
+            "translation": "\u0026Nome:"
+        },
+        {
+            "id": "\u0026Public key:",
+            "message": "\u0026Public key:",
+            "translation": "Chiave \u0026pubblica"
+        },
+        {
+            "id": "(unknown)",
+            "message": "(unknown)",
+            "translation": "(sconosciuto)"
+        },
+        {
+            "id": "\u0026Block untunneled traffic (kill-switch)",
+            "message": "\u0026Block untunneled traffic (kill-switch)",
+            "translation": "\u0026Blocca traffico fuori dal tunnel (kill-switch)"
+        },
+        {
+            "id": "When a configuration has exactly one peer, and that peer has an allowed IPs containing at least one of 0.0.0.0/0 or ::/0, then the tunnel service engages a firewall ruleset to block all traffic that is neither to nor from the tunnel interface, with special exceptions for DHCP and NDP.",
+            "message": "When a configuration has exactly one peer, and that peer has an allowed IPs containing at least one of 0.0.0.0/0 or ::/0, then the tunnel service engages a firewall ruleset to block all traffic that is neither to nor from the tunnel interface, with special exceptions for DHCP and NDP.",
+            "translation": "Quando una configurazione ha esattamente un peer e quel peer ha un IP consentito contenente almeno uno di 0.0.0.0/0 o ::/0, il servizio tunnel impegna un insieme di regole del firewall per bloccare tutto il traffico che non proviene dall'interfaccia tunnel, con speciali eccezioni per DHCP e NDP."
+        },
+        {
+            "id": "\u0026Save",
+            "message": "\u0026Save",
+            "translation": "\u0026Salva"
+        },
+        {
+            "id": "Cancel",
+            "message": "Cancel",
+            "translation": "Annulla"
+        },
+        {
+            "id": "\u0026Configuration:",
+            "message": "\u0026Configuration:",
+            "translation": "\u0026Configurazione"
+        },
+        {
+            "id": "Invalid name",
+            "message": "Invalid name",
+            "translation": "Nome non valido"
+        },
+        {
+            "id": "A name is required.",
+            "message": "A name is required.",
+            "translation": "Un nome è richiesto."
+        },
+        {
+            "id": "Tunnel name ‘{NewName}’ is invalid.",
+            "message": "Tunnel name ‘{NewName}’ is invalid.",
+            "translation": "Il nome del tunnel ‘{NewName}’ non è valido",
+            "placeholders": [
+                {
+                    "id": "NewName",
+                    "string": "%[1]s",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 1,
+                    "expr": "newName"
+                }
+            ]
+        },
+        {
+            "id": "Unable to list existing tunnels",
+            "message": "Unable to list existing tunnels",
+            "translation": "Impossibile elencare i tunnel esistenti"
+        },
+        {
+            "id": "Tunnel already exists",
+            "message": "Tunnel already exists",
+            "translation": "Il tunnel esiste già"
+        },
+        {
+            "id": "Another tunnel already exists with the name ‘{NewName}’.",
+            "message": "Another tunnel already exists with the name ‘{NewName}’.",
+            "translation": "Un altro tunnel con il nome ‘{NewName}’ esiste già.",
+            "placeholders": [
+                {
+                    "id": "NewName",
+                    "string": "%[1]s",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 1,
+                    "expr": "newName"
+                }
+            ]
+        },
+        {
+            "id": "Unable to create new configuration",
+            "message": "Unable to create new configuration",
+            "translation": "Impossibile creare la nuova configurazione"
+        },
+        {
+            "id": "Writing file failed",
+            "message": "Writing file failed",
+            "translation": "Scrittura del file non riuscita"
+        },
+        {
+            "id": "File ‘{FilePath}’ already exists.\n\nDo you want to overwrite it?",
+            "message": "File ‘{FilePath}’ already exists.\n\nDo you want to overwrite it?",
+            "translation": "Il file ‘{FilePath}’ esiste già.\n\nVuoi sovrascriverlo?",
+            "placeholders": [
+                {
+                    "id": "FilePath",
+                    "string": "%[1]s",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 1,
+                    "expr": "filePath"
+                }
+            ]
+        },
+        {
+            "id": "Active",
+            "message": "Active",
+            "translation": "Attivo"
+        },
+        {
+            "id": "Activating",
+            "message": "Activating",
+            "translation": "Attivazione"
+        },
+        {
+            "id": "Inactive",
+            "message": "Inactive",
+            "translation": "Inattivo"
+        },
+        {
+            "id": "Deactivating",
+            "message": "Deactivating",
+            "translation": "Disattivazione"
+        },
+        {
+            "id": "Unknown state",
+            "message": "Unknown state",
+            "translation": "Stato sconosciuto"
+        },
+        {
+            "id": "Log",
+            "message": "Log",
+            "translation": "Log"
+        },
+        {
+            "id": "\u0026Copy",
+            "message": "\u0026Copy",
+            "translation": "\u0026Copia"
+        },
+        {
+            "id": "Select \u0026all",
+            "message": "Select \u0026all",
+            "translation": "Selezion\u0026a tutto"
+        },
+        {
+            "id": "\u0026Save to file…",
+            "message": "\u0026Save to file…",
+            "translation": "\u0026Salva su file…"
+        },
+        {
+            "id": "Time",
+            "message": "Time",
+            "translation": "Tempo"
+        },
+        {
+            "id": "Log message",
+            "message": "Log message",
+            "translation": "Messaggio di log"
+        },
+        {
+            "id": "Text Files (*.txt)|*.txt|All Files (*.*)|*.*",
+            "message": "Text Files (*.txt)|*.txt|All Files (*.*)|*.*",
+            "translation": "File  di testo (*.txt)|*.txt|Tutti i file (*.*)|*.*"
+        },
+        {
+            "id": "Export log to file",
+            "message": "Export log to file",
+            "translation": "Esporta log su file"
+        },
+        {
+            "id": "\u0026About WireGuard…",
+            "message": "\u0026About WireGuard…",
+            "translation": "Inform\u0026azioni su WireGuard"
+        },
+        {
+            "id": "Tunnel Error",
+            "message": "Tunnel Error",
+            "translation": "Errore del tunnel"
+        },
+        {
+            "id": "{ErrMsg}\n\nPlease consult the log for more information.",
+            "message": "{ErrMsg}\n\nPlease consult the log for more information.",
+            "translation": "{ErrMsg}\n\nConsulta il log per ulteriori Informazioni.",
+            "placeholders": [
+                {
+                    "id": "ErrMsg",
+                    "string": "%[1]s",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 1,
+                    "expr": "errMsg"
+                }
+            ]
+        },
+        {
+            "id": "{Title} (out of date)",
+            "message": "{Title} (out of date)",
+            "translation": "{Title} (obsoleto)",
+            "placeholders": [
+                {
+                    "id": "Title",
+                    "string": "%[1]s",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 1,
+                    "expr": "mtw.Title()"
+                }
+            ]
+        },
+        {
+            "id": "WireGuard Detection Error",
+            "message": "WireGuard Detection Error",
+            "translation": "Errore di rilevamento di WireGuard"
+        },
+        {
+            "id": "Unable to wait for WireGuard window to appear: {Err}",
+            "message": "Unable to wait for WireGuard window to appear: {Err}",
+            "translation": "Impossibile attendere la comparsa della finestra di WireGuard",
+            "placeholders": [
+                {
+                    "id": "Err",
+                    "string": "%[1]v",
+                    "type": "error",
+                    "underlyingType": "interface{Error() string}",
+                    "argNum": 1,
+                    "expr": "err"
+                }
+            ]
+        },
+        {
+            "id": "WireGuard: Deactivated",
+            "message": "WireGuard: Deactivated",
+            "translation": "WireGuard: disattivato"
+        },
+        {
+            "id": "Status: Unknown",
+            "message": "Status: Unknown",
+            "translation": "Stato: sconosciuto"
+        },
+        {
+            "id": "Addresses: None",
+            "message": "Addresses: None",
+            "translation": "Indirizzi: nessuno"
+        },
+        {
+            "id": "\u0026Manage tunnels…",
+            "message": "\u0026Manage tunnels…",
+            "translation": "\u0026Gestisci i tunnel…"
+        },
+        {
+            "id": "\u0026Import tunnel(s) from file…",
+            "message": "\u0026Import tunnel(s) from file…",
+            "translation": "\u0026Importa tunnel da file…"
+        },
+        {
+            "id": "E\u0026xit",
+            "message": "E\u0026xit",
+            "translation": "E\u0026sci"
+        },
+        {
+            "id": "WireGuard Tunnel Error",
+            "message": "WireGuard Tunnel Error",
+            "translation": "Errore tunnel di WireGuard"
+        },
+        {
+            "id": "WireGuard: {TextForStateglobalState_true}",
+            "message": "WireGuard: {TextForStateglobalState_true}",
+            "translation": "WireGuard: {TextForStateglobalState_true}",
+            "placeholders": [
+                {
+                    "id": "TextForStateglobalState_true",
+                    "string": "%[1]s",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 1,
+                    "expr": "textForState(globalState, true)"
+                }
+            ]
+        },
+        {
+            "id": "Status: {StateText}",
+            "message": "Status: {StateText}",
+            "translation": "Stato: {StateText}",
+            "placeholders": [
+                {
+                    "id": "StateText",
+                    "string": "%[1]s",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 1,
+                    "expr": "stateText"
+                }
+            ]
+        },
+        {
+            "id": "Addresses: {String}",
+            "message": "Addresses: {String}",
+            "translation": "Indirizzi: {String}",
+            "placeholders": [
+                {
+                    "id": "String",
+                    "string": "%[1]s",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 1,
+                    "expr": "sb.String()"
+                }
+            ]
+        },
+        {
+            "id": "WireGuard Activated",
+            "message": "WireGuard Activated",
+            "translation": "WireGuard attivato"
+        },
+        {
+            "id": "The {Name} tunnel has been activated.",
+            "message": "The {Name} tunnel has been activated.",
+            "translation": "Il tunnel {Name} è stato attivato.",
+            "placeholders": [
+                {
+                    "id": "Name",
+                    "string": "%[1]s",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 1,
+                    "expr": "tunnel.Name"
+                }
+            ]
+        },
+        {
+            "id": "WireGuard Deactivated",
+            "message": "WireGuard Deactivated",
+            "translation": "WireGuard disattivato"
+        },
+        {
+            "id": "The {Name} tunnel has been deactivated.",
+            "message": "The {Name} tunnel has been deactivated.",
+            "translation": "Il tunnel {Name} è stato disattivato.",
+            "placeholders": [
+                {
+                    "id": "Name",
+                    "string": "%[1]s",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 1,
+                    "expr": "tunnel.Name"
+                }
+            ]
+        },
+        {
+            "id": "An Update is Available!",
+            "message": "An Update is Available!",
+            "translation": "Un aggiornamento è disponibile!"
+        },
+        {
+            "id": "WireGuard Update Available",
+            "message": "WireGuard Update Available",
+            "translation": "Aggiornamento di WireGuard disponibile"
+        },
+        {
+            "id": "An update to WireGuard is now available. You are advised to update as soon as possible.",
+            "message": "An update to WireGuard is now available. You are advised to update as soon as possible.",
+            "translation": "Un aggiornamento di WireGuard è disponibile. Ti consigliamo di aggiornare il prima possibile."
+        },
+        {
+            "id": "Tunnels",
+            "message": "Tunnels",
+            "translation": "Tunnel"
+        },
+        {
+            "id": "\u0026Edit",
+            "message": "\u0026Edit",
+            "translation": "\u0026Modifica"
+        },
+        {
+            "id": "Add \u0026empty tunnel…",
+            "message": "Add \u0026empty tunnel…",
+            "translation": "Aggiungi tunn\u0026el vuoto"
+        },
+        {
+            "id": "Add Tunnel",
+            "message": "Add Tunnel",
+            "translation": "Aggiungi tunnel"
+        },
+        {
+            "id": "Remove selected tunnel(s)",
+            "message": "Remove selected tunnel(s)",
+            "translation": "Rimuovi tunnel selezionati"
+        },
+        {
+            "id": "Export all tunnels to zip",
+            "message": "Export all tunnels to zip",
+            "translation": "Esporta tutti i tunnel in zip"
+        },
+        {
+            "id": "\u0026Toggle",
+            "message": "\u0026Toggle",
+            "translation": "Commu\u0026ta"
+        },
+        {
+            "id": "Export all tunnels to \u0026zip…",
+            "message": "Export all tunnels to \u0026zip…",
+            "translation": "Esporta tutti i tunnel in \u0026zip"
+        },
+        {
+            "id": "Edit \u0026selected tunnel…",
+            "message": "Edit \u0026selected tunnel…",
+            "translation": "Modifica il tunnel \u0026selezionato…"
+        },
+        {
+            "id": "\u0026Remove selected tunnel(s)",
+            "message": "\u0026Remove selected tunnel(s)",
+            "translation": "\u0026Rimuovi i tunnel selezionati"
+        },
+        {
+            "id": "Could not import selected configuration: {LastErr}",
+            "message": "Could not import selected configuration: {LastErr}",
+            "translation": "Impossibile importare la configurazione selezionata: {LastErr}",
+            "placeholders": [
+                {
+                    "id": "LastErr",
+                    "string": "%[1]v",
+                    "type": "error",
+                    "underlyingType": "interface{Error() string}",
+                    "argNum": 1,
+                    "expr": "lastErr"
+                }
+            ]
+        },
+        {
+            "id": "Could not enumerate existing tunnels: {LastErr}",
+            "message": "Could not enumerate existing tunnels: {LastErr}",
+            "translation": "Impossibile enumerare i tunnel esistenti: {LastErr}",
+            "placeholders": [
+                {
+                    "id": "LastErr",
+                    "string": "%[1]v",
+                    "type": "error",
+                    "underlyingType": "interface{Error() string}",
+                    "argNum": 1,
+                    "expr": "lastErr"
+                }
+            ]
+        },
+        {
+            "id": "Another tunnel already exists with the name ‘{Name}’",
+            "message": "Another tunnel already exists with the name ‘{Name}’",
+            "translation": "Un altro tunnel esiste già con il nome ‘{Name}‘",
+            "placeholders": [
+                {
+                    "id": "Name",
+                    "string": "%[1]s",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 1,
+                    "expr": "unparsedConfig.Name"
+                }
+            ]
+        },
+        {
+            "id": "Unable to import configuration: {LastErr}",
+            "message": "Unable to import configuration: {LastErr}",
+            "translation": "Impossibile importare la configurazione: {LastErr}",
+            "placeholders": [
+                {
+                    "id": "LastErr",
+                    "string": "%[1]v",
+                    "type": "error",
+                    "underlyingType": "interface{Error() string}",
+                    "argNum": 1,
+                    "expr": "lastErr"
+                }
+            ]
+        },
+        {
+            "id": "Imported tunnels",
+            "message": "Imported tunnels",
+            "translation": "Tunnel importati"
+        },
+        {
+            "id": "Imported {M} tunnels",
+            "message": "Imported {M} tunnels",
+            "translation": {
+                "select": {
+                    "feature": "plural",
+                    "arg": "M",
+                    "cases": {
+                        "one": {
+                            "msg": "{M} tunnel importato"
+                        },
+                        "other": {
+                            "msg": "{M} tunnel importati"
+                        }
+                    }
+                }
+            },
+            "placeholders": [
+                {
+                    "id": "M",
+                    "string": "%[1]d",
+                    "type": "int",
+                    "underlyingType": "int",
+                    "argNum": 1,
+                    "expr": "m"
+                }
+            ]
+        },
+        {
+            "id": "Imported {M} of {N} tunnels",
+            "message": "Imported {M} of {N} tunnels",
+            "translation": {
+                "select": {
+                    "feature": "plural",
+                    "arg": "N",
+                    "cases": {
+                        "one": {
+                            "msg": "{M} de {N} tunnel importato"
+                        },
+                        "other": {
+                            "msg": "{M} de {N} tunnel importati"
+                        }
+                    }
+                }
+            },
+            "placeholders": [
+                {
+                    "id": "M",
+                    "string": "%[1]d",
+                    "type": "int",
+                    "underlyingType": "int",
+                    "argNum": 1,
+                    "expr": "m"
+                },
+                {
+                    "id": "N",
+                    "string": "%[2]d",
+                    "type": "int",
+                    "underlyingType": "int",
+                    "argNum": 2,
+                    "expr": "n"
+                }
+            ]
+        },
+        {
+            "id": "Unable to create tunnel",
+            "message": "Unable to create tunnel",
+            "translation": "Impossibile creare il tunnel"
+        },
+        {
+            "id": "Delete {TunnelCount} tunnels",
+            "message": "Delete {TunnelCount} tunnels",
+            "translation": {
+                "select": {
+                    "feature": "plural",
+                    "arg": "TunnelCount",
+                    "cases": {
+                        "one": {
+                            "msg": "Elimina {TunnelCount} tunnel"
+                        },
+                        "other": {
+                            "msg": "Elimina {TunnelCount} tunnels"
+                        }
+                    }
+                }
+            },
+            "placeholders": [
+                {
+                    "id": "TunnelCount",
+                    "string": "%[1]d",
+                    "type": "int",
+                    "underlyingType": "int",
+                    "argNum": 1,
+                    "expr": "tunnelCount"
+                }
+            ]
+        },
+        {
+            "id": "Are you sure you would like to delete {TunnelCount} tunnels?",
+            "message": "Are you sure you would like to delete {TunnelCount} tunnels?",
+            "translation": {
+                "select": {
+                    "feature": "plural",
+                    "arg": "TunnelCount",
+                    "cases": {
+                        "one": {
+                            "msg": "Sei sicuro di voler eliminare {TunnelCount} tunnel?"
+                        },
+                        "other": {
+                            "msg": "Sei sicuro di voler eliminare {TunnelCount} tunnel?"
+                        }
+                    }
+                }
+            },
+            "placeholders": [
+                {
+                    "id": "TunnelCount",
+                    "string": "%[1]d",
+                    "type": "int",
+                    "underlyingType": "int",
+                    "argNum": 1,
+                    "expr": "tunnelCount"
+                }
+            ]
+        },
+        {
+            "id": "Delete tunnel ‘{TunnelName}’",
+            "message": "Delete tunnel ‘{TunnelName}’",
+            "translation": "Elimina tunnel ‘{TunnelName}‘",
+            "placeholders": [
+                {
+                    "id": "TunnelName",
+                    "string": "%[1]s",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 1,
+                    "expr": "tunnelName"
+                }
+            ]
+        },
+        {
+            "id": "Are you sure you would like to delete tunnel ‘{TunnelName}’?",
+            "message": "Are you sure you would like to delete tunnel ‘{TunnelName}’?",
+            "translation": "Sei sicuro di voler eliminare il tunnel ‘{TunnelName}‘?",
+            "placeholders": [
+                {
+                    "id": "TunnelName",
+                    "string": "%[1]s",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 1,
+                    "expr": "tunnelName"
+                }
+            ]
+        },
+        {
+            "id": "{Question} You cannot undo this action.",
+            "message": "{Question} You cannot undo this action.",
+            "translation": "{Question} Non è possibile annullare questa azione.",
+            "placeholders": [
+                {
+                    "id": "Question",
+                    "string": "%[1]s",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 1,
+                    "expr": "question"
+                }
+            ]
+        },
+        {
+            "id": "Unable to delete tunnel",
+            "message": "Unable to delete tunnel",
+            "translation": "Impossibile eliminare il tunnel"
+        },
+        {
+            "id": "A tunnel was unable to be removed: {Error}",
+            "message": "A tunnel was unable to be removed: {Error}",
+            "translation": "Non è stato possibile rimuovere un tunnel: {Error}",
+            "placeholders": [
+                {
+                    "id": "Error",
+                    "string": "%[1]s",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 1,
+                    "expr": "errors[0].Error()"
+                }
+            ]
+        },
+        {
+            "id": "Unable to delete tunnels",
+            "message": "Unable to delete tunnels",
+            "translation": "Impossibile eliminare i tunnel"
+        },
+        {
+            "id": "{Lenerrors} tunnels were unable to be removed.",
+            "message": "{Lenerrors} tunnels were unable to be removed.",
+            "translation": {
+                "select": {
+                    "feature": "plural",
+                    "arg": "Lenerrors",
+                    "cases": {
+                        "one": {
+                            "msg": "Non è stato possibile eliminare {Lenerrors} tunnel."
+                        },
+                        "other": {
+                            "msg": "Non è stato possibile eliminare {Lenerrors} tunnel."
+                        }
+                    }
+                }
+            },
+            "placeholders": [
+                {
+                    "id": "Lenerrors",
+                    "string": "%[1]d",
+                    "type": "int",
+                    "underlyingType": "int",
+                    "argNum": 1,
+                    "expr": "len(errors)"
+                }
+            ]
+        },
+        {
+            "id": "Configuration Files (*.zip, *.conf)|*.zip;*.conf|All Files (*.*)|*.*",
+            "message": "Configuration Files (*.zip, *.conf)|*.zip;*.conf|All Files (*.*)|*.*",
+            "translation": "File di configurazione (*.zip, *.conf)|*.zip;*.conf|Tutti i file (*.*)|*.*"
+        },
+        {
+            "id": "Import tunnel(s) from file",
+            "message": "Import tunnel(s) from file",
+            "translation": "Importa tunnel da file"
+        },
+        {
+            "id": "Configuration ZIP Files (*.zip)|*.zip",
+            "message": "Configuration ZIP Files (*.zip)|*.zip",
+            "translation": "File di configurazione ZIP (*.zip)|*.zip"
+        },
+        {
+            "id": "Export tunnels to zip",
+            "message": "Export tunnels to zip",
+            "translation": "Esporta tunnel in zip"
+        },
+        {
+            "id": "{Title} (unsigned build, no updates)",
+            "message": "{Title} (unsigned build, no updates)",
+            "translation": "{Title} (versione non firmata, nessun aggiornamento)",
+            "placeholders": [
+                {
+                    "id": "Title",
+                    "string": "%[1]s",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 1,
+                    "expr": "mtw.Title()"
+                }
+            ]
+        },
+        {
+            "id": "Error Exiting WireGuard",
+            "message": "Error Exiting WireGuard",
+            "translation": "Errore durante la chiusura di WireGuard"
+        },
+        {
+            "id": "Unable to exit service due to: {Err}. You may want to stop WireGuard from the service manager.",
+            "message": "Unable to exit service due to: {Err}. You may want to stop WireGuard from the service manager.",
+            "translation": "Impossibile uscire dal servizio a causa di: {Err}. Potresti voler interrompere WireGuard dal gestore dei servizi.",
+            "placeholders": [
+                {
+                    "id": "Err",
+                    "string": "%[1]v",
+                    "type": "error",
+                    "underlyingType": "interface{Error() string}",
+                    "argNum": 1,
+                    "expr": "err"
+                }
+            ]
+        },
+        {
+            "id": "An update to WireGuard is available. It is highly advisable to update without delay.",
+            "message": "An update to WireGuard is available. It is highly advisable to update without delay.",
+            "translation": "Un aggiornamento di WireGuard è disponibile. Ti consigliamo vivamente di aggiornare senza indugio."
+        },
+        {
+            "id": "Status: Waiting for user",
+            "message": "Status: Waiting for user",
+            "translation": "Stato: in attesa dell'utente"
+        },
+        {
+            "id": "Update Now",
+            "message": "Update Now",
+            "translation": "Aggiorna ora"
+        },
+        {
+            "id": "Status: Waiting for updater service",
+            "message": "Status: Waiting for updater service",
+            "translation": "Stato: in attesa del servizio di aggiornamento"
+        },
+        {
+            "id": "Error: {Err}. Please try again.",
+            "message": "Error: {Err}. Please try again.",
+            "translation": "Errore: {Err}. Prova ancora.",
+            "placeholders": [
+                {
+                    "id": "Err",
+                    "string": "%[1]v",
+                    "type": "error",
+                    "underlyingType": "interface{Error() string}",
+                    "argNum": 1,
+                    "expr": "err"
+                }
+            ]
+        },
+        {
+            "id": "Status: Complete!",
+            "message": "Status: Complete!",
+            "translation": "Stato: Completo!"
+        },
+        {
+            "id": "http2: Framer {F}: failed to decode just-written frame",
+            "message": "http2: Framer {F}: failed to decode just-written frame",
+            "translation": "http2: Framer {F}: decodifica del frame appena scritto non riuscita",
+            "placeholders": [
+                {
+                    "id": "F",
+                    "string": "%[1]p",
+                    "type": "*net/http.http2Framer",
+                    "underlyingType": "*net/http.http2Framer",
+                    "argNum": 1,
+                    "expr": "f"
+                }
+            ]
+        },
+        {
+            "id": "http2: Framer {F}: wrote {Http2summarizeFramefr}",
+            "message": "http2: Framer {F}: wrote {Http2summarizeFramefr}",
+            "translation": "http2: Framer {F}: ha scritto {Http2summarizeFramefr}",
+            "placeholders": [
+                {
+                    "id": "F",
+                    "string": "%[1]p",
+                    "type": "*net/http.http2Framer",
+                    "underlyingType": "*net/http.http2Framer",
+                    "argNum": 1,
+                    "expr": "f"
+                },
+                {
+                    "id": "Http2summarizeFramefr",
+                    "string": "%[2]v",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 2,
+                    "expr": "http2summarizeFrame(fr)"
+                }
+            ]
+        },
+        {
+            "id": "http2: Framer {Fr}: read {Http2summarizeFramef}",
+            "message": "http2: Framer {Fr}: read {Http2summarizeFramef}",
+            "translation": "http2: Framer {Fr}: ha letto {Http2summarizeFramef}",
+            "placeholders": [
+                {
+                    "id": "Fr",
+                    "string": "%[1]p",
+                    "type": "*net/http.http2Framer",
+                    "underlyingType": "*net/http.http2Framer",
+                    "argNum": 1,
+                    "expr": "fr"
+                },
+                {
+                    "id": "Http2summarizeFramef",
+                    "string": "%[2]v",
+                    "type": "string",
+                    "underlyingType": "string",
+                    "argNum": 2,
+                    "expr": "http2summarizeFrame(f)"
+                }
+            ]
+        },
+        {
+            "id": "http2: decoded hpack field {HeaderField}",
+            "message": "http2: decoded hpack field {HeaderField}",
+            "translation": "http2: campo hpack {HeaderField} decodificato",
+            "placeholders": [
+                {
+                    "id": "HeaderField",
+                    "string": "%+[1]v",
+                    "type": "vendor/golang.org/x/net/http2/hpack.HeaderField",
+                    "underlyingType": "struct{Name string; Value string; Sensitive bool}",
+                    "argNum": 1,
+                    "expr": "hf"
+                }
+            ]
+        }
+    ]
+}
diff --git a/resources.rc b/resources.rc
index d0bdad62..c1794582 100644
--- a/resources.rc
+++ b/resources.rc
@@ -56,6 +56,13 @@ VERSIONINFO_TEMPLATE(
   "https://www.wireguard.com/"
 )
 
+LANGUAGE LANG_ITALIAN, SUBLANG_DEFAULT
+VERSIONINFO_TEMPLATE(
+  "041004b0", 0x410, 0x4b0,
+  "WireGuard: Tunnel VPN veloce, moderno e sicuro",
+  "https://www.wireguard.com/"
+)
+
 LANGUAGE LANG_JAPANESE, SUBLANG_DEFAULT
 VERSIONINFO_TEMPLATE(
   "041104b0", 0x411, 0x4b0,
-- 
2.26.0

