Return-Path: <SRS0=ZPJq=DX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 107E7C4363A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Oct 2020 13:25:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA1E020848
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Oct 2020 13:25:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="Au+SCWBv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA1E020848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd2cbebc;
	Fri, 16 Oct 2020 13:17:01 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 16696f00
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Oct 2020 12:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1602853084;
 bh=t5IgVsQERpHMul2SodW2hTT2Z2xpOUPqbYVwhAAqXOE=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=Au+SCWBvf+LNjezL4r//EJf4VBjcx2HmF/qAcqtTB7wAamA4igJZuBbnQyPl1vDtn
 7yNcRKyyi4+IfNtUXSUy5BL6X/ApyKx2KcleuNh04ihDQ9ZiYZCg0k8OKrEN2ZagAN
 k7tnXxKUTrz6En+nJAk85k/fskgo/DIOD+7j9wRA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([92.196.20.19]) by mail.gmx.com
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MryT9-1k86dL2QI1-00nzs2 for <wireguard@lists.zx2c4.com>; Fri, 16 Oct 2020
 14:52:58 +0200
From: Marc Becker <becm@gmx.de>
To: wireguard@lists.zx2c4.com
Subject: [PATCH wintun] installer: do not enforce driver removal
Date: Fri, 16 Oct 2020 14:52:18 +0200
Message-Id: <20201016125218.13593-1-becm@gmx.de>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:qrd0lWV81KU62F60Qquh9RffN3Ocdp4LyZsBcBoxB6M9P7BgDGt
 omTYjv0hmzAxTLl7wTO9IjjDOJNxrvxuR4dL736J2FS1HC+OlVDBThSEz68mMZQR7WVbgpj
 OTO1HO/503O+iA+lMd7fsVJlTA3mgJU3l3Nwx/FZfLv/oJw61q10FoG0eyvg3FD3WrDnhfW
 As8zJwPVCAfozxGOD7SPg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:X6QOXhiYvA8=:/WGR3qqhhQuX9bEo2MO6JJ
 7gVN5j+lNxTOtK3Nd7/joBH32ZX6dBIa94JVMglIyKL8H9/sPDJpX9UX1ZoG4OOjEzWkFyQ8v
 3WWSr7TACowDSoTnEdOR4rBzEP6xeJg2beZGrL3uIQaB/p4U/Bo9AbDwObp2w7z0nUAvz6ytF
 8in162fZUoL6MrJXGIPP8U5N1xGWMkO++w0/zzPhEkfe3Sz8O70lejkBLXxH23UvZimlofLTE
 svaQwK3oyIrSfgZq/UQBRXQxYuS6UT9kUPMhr6OFfZOWiPIa7B77GzeqBrsQ4EbujJJLXqJpq
 PjBNvSIWiMwxk7/BjOaJ1H2XXxypG7LGpfvc+JP+6+A/KzFme7xVSh6Nq5s6pf+ASTvp9W0q7
 m3xlLWYSn8+DpAF9h0ANW9iyy86dVmU0qe58wWdDYvZ3/sQtN9tc2a8hOCx2DXHlit/r9dxxK
 LfttdEkWcgbx2UWXJCIunExF6gMk0fWwb1ploFG6dOzdN9BudTFTn1zPyRM4C8+KX9YD0Z+cu
 th6mwvxM9ghZZYvVQACn5C7MaSjn5g3okMSJT56fkHEaRJnJxQbFwnTVOHLoj5DDcvb7+i8Vi
 vjtx3nJl+d8RVAqHYb2w72zo3bKue8euq1tKcTpkqMrJRODBtf9AQcbOmXmpTgolcdDVFJePb
 rd9EIvntWmxKHKIznsTCL53mkBIeISWNL5c/CYlPU4PmdgqsdA8GQltW0E+mfqZ9K6u5PzmEf
 tpXPzj+U3UQIb5mSKQ9jjjkArWspp1Cm5uzJPgAAmKSmk+bag3EeWKMvRrOjkPnyNvatGCpjZ
 EydO8OpMDe518wZ0OttQQw1zMKs7zVYyrCCIuE0KWPWhaHZjcTdM8S+/I2nuvlmPueTkWzmMZ
 84yjeRftqD7Lx3CEcV/w==
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 16 Oct 2020 15:16:50 +0200
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

Persistend network adapters hold locks on installed driver.
Forced removal breaks service/PnP ownership references.

Do not enforce driver removal and make failure non-fatal.
This should have no effect on Uninstall, adapters are deleted in advance.
Tested in OpenVPN TAP MSM (https://github.com/OpenVPN/tap-windows6/pull/13=
5)

Signed-off-by: Marc Becker <becm@gmx.de>
=2D--
 installer/installation.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/installer/installation.c b/installer/installation.c
index cd93ffb..3c6628e 100644
=2D-- a/installer/installation.c
+++ b/installer/installation.c
@@ -345,9 +345,9 @@ static BOOL RemoveWintun(VOID)
         {
             PathStripPath(DriverDetail->InfFileName);
             Logger(LOG_INFO, TEXT("Removing existing driver"));
-            if (!SetupUninstallOEMInf(DriverDetail->InfFileName, SUOI_FOR=
CEDELETE, NULL))
+            if (!SetupUninstallOEMInf(DriverDetail->InfFileName, 0, NULL)=
)
             {
-                PrintError(LOG_ERR, TEXT("Unable to remove existing drive=
r"));
+                PrintError(LOG_WARN, TEXT("Failed to uninstall old driver=
s, probably some are in use by adapters. Continuing."));
                 Ret =3D FALSE;
             }
         }
@@ -601,8 +601,7 @@ BOOL InstallOrUpdate(VOID)
     }
     if (!RemoveWintun())
     {
-        PrintError(LOG_ERR, TEXT("Failed to uninstall old drivers"));
-        goto cleanupAdapters;
+        PrintError(LOG_WARN, TEXT("Failed to uninstall old drivers, proba=
bly some are in use by adapters. Continuing."));
     }
     if (!InstallWintun(!!ExistingAdapters))
     {
=2D-
2.11.0

