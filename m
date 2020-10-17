Return-Path: <SRS0=mzR4=ED=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C46E2C55178
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Oct 2020 00:04:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05A0D2223C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Oct 2020 00:04:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="g9tRkdRy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05A0D2223C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d0e4f062;
	Wed, 28 Oct 2020 00:02:53 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 39d92b6e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 17 Oct 2020 15:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1602947223;
 bh=O5wloyktn7XsFIQlWR1Fmh/XxnxpUkaWNJfBW/rJNNw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=g9tRkdRypfUz3gi7as6p9z9hLgTJtMfU7MH4VmRXtYRngKYm2CeJKqny/XuKIMSEP
 XVMDqIdwtUZH1QbV7utUcoipb0ZG7tiRYUwp0PELMH/2ZvEUJw12F5b3wXg8eN0CAD
 +l52PAmFPyLwxKXF2t7t/ncsBFZFkQDGWCT+z9wQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([92.196.93.109]) by mail.gmx.com
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mt79P-1k9wQ32goL-00tUlY; Sat, 17 Oct 2020 17:01:58 +0200
From: Marc Becker <becm@gmx.de>
To: wireguard@lists.zx2c4.com
Cc: Marc Becker <becm@gmx.de>
Subject: [PATCH wintun v2] installer: do not enforce driver removal
Date: Sat, 17 Oct 2020 17:00:48 +0200
Message-Id: <20201017150048.4701-1-becm@gmx.de>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201016125218.13593-1-becm@gmx.de>
References: <20201016125218.13593-1-becm@gmx.de>
X-Provags-ID: V03:K1:oXrKTTFBc5dgPraPZtOktyFsXevsUgEE+BZr8xfeaRPiTwNBn2N
 DNdOqKSE7MyHqqsURcm7so8R88xIngcMqxbgl/jnkVHjC91i1vqSdvf3rsm02uNQvuAJJ1r
 Tz1NU2DVww7X2o1+B8DFdnLtb126Xthi0J6QxnCI+R5SxYdvwFkjyjclV0Ss+zFbUHqMUT+
 YuiK0miuOu6sMM6UiWo6Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EEEOuNEoFiY=:VpckhiVReKkB5mVxYR7t/f
 W0UTyFTJNExhe3iu3Nuf3PRtI/cYegT5Y0s/IfmP616CdSKhLQk+QGX6kXkIZp+p+PmDBcF6f
 6lM0aZB41EfVvCkSm1AbQWlCrBPn2+NsqkRmRybb5Nv00NbUbDACFcb0NVfebr0VnKRi9tRRP
 yigHYJZmYl2KbNwvNYvmLnE7gM3QiRPcBYXi0XEbfzjvjUV5Ou8WRR+dCnYxKijT6TCRqQngW
 HNx0q1dMBrDQhec4hEoY6ThFOBciNybjiiiEfWMkXyUNneyO1pZy+ZXD9W4y7fka4AqZLsmxw
 LZl3/ac+Tgi2D1YomUG7xkNlKrx+YNbi4uPc8PgoIWMIAWlS88sQ6CCYKIGxj+NPRldUuWeaP
 3ID6xRAlHe72FOc2LNW00por7Y33egvxBA//Oj7PggDul5jgfk8pLe1PMeqjfXTiwqewA1pXu
 H5fwg+JATgQlPhddVESW8jS5N3LYI79VLIhGU679jMtUIpcZtJY44jwO/VdS13rLbBAFc7V1f
 AfKmjm6FV6RUnKgIqjt0vuozQozwITFgrLfwfs3PYtPUad3zGgr0GvoNYGXiboHJSJ9YcbcRj
 JinC7PZNpIGG5TFGM18+Uu+0fkRN67WApqkGSEidSGLKIXfn1AwNi90QPOClQqwTGHc3ODaJN
 hcIV8Qyi8rhVx1ibuivNlNSxMXyQwqP4j0x2TQBA/JD1WBZRhnaGWfS3W2KsT+3XgkLPyXBEF
 qG2GQcew4yKLLvg879bv23C/5P+klHNYzLMyxMe/lG8/wprLVOVwAvsqIMFjCQJLexEWdGRxP
 p5+C1OznxncIXpGFJBtKBFnfKSp99XOwJfK2ewj+PKT2pbeogT5ex8y9Dxe3kZoNx7ekSmSXK
 z78hkUMkpbtmrNW6vXmw==
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
In-use driver will be kept until uninstall or next update.

Signed-off-by: Marc Becker <becm@gmx.de>
=2D--
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

