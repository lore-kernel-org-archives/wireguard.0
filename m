Return-Path: <SRS0=mzR4=ED=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3006CC55179
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Oct 2020 00:04:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAF112223C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Oct 2020 00:04:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="Q+O/WMsl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAF112223C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ecbbae68;
	Wed, 28 Oct 2020 00:02:54 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a5f11a34
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 Oct 2020 19:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1603308761;
 bh=k2fZdqh/l8raT5mIdo0SrDDphjQGd1qKLLOW9HCb7/g=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=Q+O/WMslEy6xf4p2jjz6bX9Fcc5Ij/0VYaOKaRixglvuKwl3rnBxKcrhEFJB5vsWE
 Ak6QWSDGAtl1crNUSJer+PMAaR0aWI4GmX9EQidkPBw2N1w41vpIBHVg2J2Z7yPOnI
 d2gFVs9lWUSPdjbnbYX4n2ypnInSZAuQWa5q993s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([92.196.79.124]) by mail.gmx.com
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MnJhO-1k5v6I37Ey-00jLN3 for <wireguard@lists.zx2c4.com>; Wed, 21 Oct 2020
 21:27:34 +0200
From: Marc Becker <becm@gmx.de>
To: wireguard@lists.zx2c4.com
Subject: [PATCH wintun v2] installer: do not enforce driver removal
Date: Wed, 21 Oct 2020 21:27:01 +0200
Message-Id: <20201021192701.23402-1-becm@gmx.de>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201016125218.13593-1-becm@gmx.de>
References: <20201016125218.13593-1-becm@gmx.de>
X-Provags-ID: V03:K1:XtAjzjteXS0hT1bG/dlQJZu5Ryrwl+3x4ojBB7ryecO+v6Zny7d
 gec4W37axew7MEzXVb+7ZDGf8X06Mx9RB98+lV+jiT4Y3dvnQ44kJksyWLpUUM4iOOFdhH6
 hiwhj1Z7bW4SYo2JR2x82kS/wa/YBJwQhPUqFF96PYTW8Z6Xs6qeg6UIVf3NvLN7eumXA1Y
 3HkX4OxJIBubhwJ7vPbew==
X-UI-Out-Filterresults: notjunk:1;V03:K0:60AFeXtvUyA=:kIf/E3k5K97dSOPR5O0nyP
 oekK+tIoKG7/x9YNEt7HX7dIjPDCspWzzungYrx4XfeH6dxqhFru2Wxt6RowsOyyrXaUydaqW
 yMRVhtTbaWQXLwgtgL9bKU3VBIvooLRBH/o7arHLYpu1v66QmfHjJ7hcAD/ISIc6aj5VTzy5+
 eowSx7scdKpKYzwgLVsltmZo6wrv82uE2pQOHkUdV1P4NVdO1nRpJIZ7/LaQPr6Z/RCywkYtv
 B8cIl2dxLROHCL6Es032dQkt4AuinfQa8F4Swhmlqz10vbKsphyq5RairwGrLYg8GXb2mYQX7
 8sGN8BpvlnCdrabzioGgcCB7dufiMllS2Ivc+zpY12Ll4H4KTNzMgrTSpyA1V3V+YOdvvtOIh
 4IaAolrD0t+C3OuOhrSiOXAi5YKsXL7fGU8eFNjUjrQkfNj13VdYwW0VEc97YhfM28kbmOWOu
 8GX3+YMEHiP5/e6LkSvMnH/vIiUbKDyUdHNc6BFiLoiUmA9+f1ugtxjnlkWVRg3hH4LE5tXbo
 OKtBYu9uTYuZ7lA+s2GoXwQePJJju5aeWeJRpDP/huwuTpEpS7ISNvrK+6HIV50oiydgwhqVP
 TFY7AUBKP9ghUK1gEY0rpX0C9Gbzdb8hM5HzZa9kyXryvo6auZfThCuIEt5UvgmHpD49tis7i
 f8CriCOVbhIXbT7pf5EYfPQx5wm//wCQ7vRMu6We3DA9SDP1gNybeWr3+FHeKRoDkJ9hq1bYl
 UNneYv3pGQ4eXTOt2np8bbEN4QU3guT6DjIXIFkKm5c1hnwmmlle2dcsU0+E+pdlNTvKIfZ6G
 s+l+GAu5wwyuGgonsvJTw/rpnasmKfP5ZnzjyDd3NMX1NHd7ufg58Wf0Ll0xSGn7SvLRn1vUe
 1uMPKaS1iGNGNlM3FI2w==
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 28 Oct 2020 01:02:50 +0100
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
Old driver is removed by regular disk cleanup or next MSM operation.

Signed-off-by: Marc Becker <becm@gmx.de>
=2D--
Does not change UninstallOEM result error message.

Patch (now correctly) mirrors https://github.com/OpenVPN/tap-windows6/pull=
/135
Effects discussed in https://github.com/OpenVPN/tap-windows6/issues/129

 installer/installation.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/installer/installation.c b/installer/installation.c
index cd93ffb..9c7992c 100644
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
+                PrintError(LOG_WARN, TEXT("Unable to remove existing driv=
er"));
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

