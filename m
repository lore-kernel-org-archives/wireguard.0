Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC31EF06E9
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Feb 2026 18:13:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 876ae158;
	Sun, 8 Feb 2026 17:10:48 +0000 (UTC)
Received: from mail.stormshield.eu (mail.stormshield.eu [91.212.116.25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 28e0af78
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 2 Feb 2026 14:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stormshield.eu;
 s=signer3; t=1770042962; h=From:Subject:Date:Message-ID:To:Cc
 :MIME-Version:Content-Type:Content-Transfer-Encoding; bh=ct19DQstTSgAkl94
 6l4tLj2bWNq7dmrdACPmkdI9kZo=; b=yki+IEWC4RxbpWiGi5FE5kK/c6XOYFBnJ1zrchuX9
 g+trHR25X8Rp8On5ehKeI1UZHo7/OpLxWyzGONXBw5Q6P0nElQUhna3srlSDrrM8kPtANNohZ
 X1Gn8x/o4GDGvfrgMUaL8DDmEBE5JE23cw34txifI/kS7ZyLvbxjnHMBhr2ZO/OZORHl9xToD
 wQwV+CbWY+XyC4aVk2LNek8HBX8CkYvaiBPe23DWrC8PYzA7F7si3vrIGOB2wLwgbscP8Hoh+
 AkAy+CnVDtVBplWVRxPKC6r4Jew6O1C8j1Mx8YbLjJUlAPMMhCr7CBCq8BnTuCYuCbog3LyFO
 IkRfaA9LA==;
From: Jean-Alexandre CHRONE <Jean-Alexandre.CHRONE@stormshield.eu>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
CC: Jean-Alexandre CHRONE <Jean-Alexandre.CHRONE@stormshield.eu>
Subject: [PATCH] api: use mutex when removing instance on close adapter
Thread-Topic: [PATCH] api: use mutex when removing instance on close adapter
Thread-Index: AdyUURyQPtPZzF+zT3OzBGeUYupgWQ==
Date: Mon, 2 Feb 2026 14:36:00 +0000
Message-ID: <7ef930c54a4b4aa5bd3ecd9cf01fe12a@stormshield.eu>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-DKIM-Signer: DkimX (v3.70.370)
X-Mailman-Approved-At: Sun, 08 Feb 2026 17:10:11 +0000
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

From 298267d3ead7110880a5dc0f5d0e8822600d30c0 Mon Sep 17 00:00:00 2001
From: "jean-alexandre.chrone" <jean-alexandre.chrone@stormshield.eu>
Date: Mon, 2 Feb 2026 15:24:12 +0100
Subject: [PATCH] api: use mutex when removing instance on close adapter

on successive create and close there might be some error logged
---
 api/adapter.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/api/adapter.c b/api/adapter.c
index 0dd8c42..042645c 100644
--- a/api/adapter.c
+++ b/api/adapter.c
@@ -158,7 +158,8 @@ VOID AdapterCleanupOrphanedDevices(VOID)
             continue;
         }
         ULONG Status, Code;
-        if (CM_Get_DevNode_Status(&Status, &Code, DevInfoData.DevInst, 0) =
=3D=3D CR_SUCCESS && !(Status & DN_HAS_PROBLEM))
+        CONFIGRET Ret =3D CM_Get_DevNode_Status(&Status, &Code, DevInfoDat=
a.DevInst, 0);
+        if ((Ret =3D=3D CR_SUCCESS && !(Status & DN_HAS_PROBLEM)) || Ret =
=3D=3D CR_NO_SUCH_DEVNODE)
             continue;
=20
         DEVPROPTYPE PropType;
@@ -195,8 +196,16 @@ WintunCloseAdapter(WINTUN_ADAPTER *Adapter)
         SwDeviceClose(Adapter->SwDevice);
     if (Adapter->DevInfo)
     {
+        HANDLE DeviceInstallationMutex =3D NamespaceTakeDeviceInstallation=
Mutex();
+        if (DeviceInstallationMutex =3D=3D NULL)
+            LOG_LAST_ERROR(L"Failed to take device installation mutex");
+
         if (!AdapterRemoveInstance(Adapter->DevInfo, &Adapter->DevInfoData=
))
             LOG_LAST_ERROR(L"Failed to remove adapter when closing");
+
+        if (DeviceInstallationMutex !=3D NULL)
+            NamespaceReleaseMutex(DeviceInstallationMutex);
+
         SetupDiDestroyDeviceInfoList(Adapter->DevInfo);
     }
     Free(Adapter);
--=20
2.52.0.windows.1

