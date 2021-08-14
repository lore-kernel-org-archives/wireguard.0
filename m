Return-Path: <SRS0=uw9z=NF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77BA3C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 14 Aug 2021 05:14:15 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF0C460F51
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 14 Aug 2021 05:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF0C460F51
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44fae96c;
	Sat, 14 Aug 2021 05:14:12 +0000 (UTC)
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4b00c6cd
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Aug 2021 05:14:08 +0000 (UTC)
Date: Sat, 14 Aug 2021 05:13:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=protonmail; t=1628918047;
 bh=gLsGNe5vEeRjt9Tl6d/tmwnUp9DHVxgCYg2WDqEvJsA=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=T9QQTU1wG2YmUrkVxIG8t0uW+Gm3Gl+SPgDiHlFPYhRRrx9gTwfiNlW1rsAQ+dT7M
 LV0EPAGlJ2AQTC5fT/4FncAbtV3XDCmjw6KAwtr+EUiQ98qC4XzwYjWM0QA8nDzRw8
 2puXcFJY04RFEZ+3BiJFQfX9uNlSXH3DILcAZLWI=
To: wireguard@lists.zx2c4.com
From: dotneutron <dotneutron@protonmail.ch>
Cc: Jason@zx2c4.com, Neutron <dotneutron@protonmail.ch>
Subject: [PATCH] embeddable-dll-service: csharp: fix peer endpoint bug
Message-ID: <20210814051340.485-1-dotneutron@protonmail.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: dotneutron <dotneutron@protonmail.ch>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

ADDRESS_FAMILY is a typedef for USHORT. ioctlPeer->Endpoint.si_family
evaluates to 1882324994 instead of AF_INET when enum ADDRESS_FAMILY
inherits from UInt32 instead of ushort/UInt16.

IPAddress#NetworkToHostOrder does not have an overload for ushort and
int is chosen instead. This does not play well - e.g.,
NetworkToHostOrder(28722) evaluates to 846200832. An extension method
is proposed to solve this issue.

Signed-off-by: Neutron <dotneutron@protonmail.ch>
---
 .../csharp/Extensions/NumberExtensions.cs          | 14 ++++++++++++++
 embeddable-dll-service/csharp/TunnelDll/Driver.cs  |  9 +++++----
 embeddable-dll-service/csharp/TunnelDll/Win32.cs   |  2 +-
 3 files changed, 20 insertions(+), 5 deletions(-)
 create mode 100644 embeddable-dll-service/csharp/Extensions/NumberExtensio=
ns.cs

diff --git a/embeddable-dll-service/csharp/Extensions/NumberExtensions.cs b=
/embeddable-dll-service/csharp/Extensions/NumberExtensions.cs
new file mode 100644
index 00000000..dfa2f981
--- /dev/null
+++ b/embeddable-dll-service/csharp/Extensions/NumberExtensions.cs
@@ -0,0 +1,14 @@
+=EF=BB=BFusing System;
+
+namespace DemoUI.Extensions
+{
+    public static class NumberExtensions
+    {
+        public static ushort ConvertFromNetworkToHostOrder(this ushort val=
ue)
+        {
+            var bytes =3D BitConverter.GetBytes(value);
+            Array.Reverse(bytes);
+            return BitConverter.ToUInt16(bytes);
+        }
+    }
+}
diff --git a/embeddable-dll-service/csharp/TunnelDll/Driver.cs b/embeddable=
-dll-service/csharp/TunnelDll/Driver.cs
index 857d6a63..d630c6df 100644
--- a/embeddable-dll-service/csharp/TunnelDll/Driver.cs
+++ b/embeddable-dll-service/csharp/TunnelDll/Driver.cs
@@ -7,6 +7,7 @@ using System;
 using System.ComponentModel;
 using System.Net;
 using System.Runtime.InteropServices;
+using DemoUI.Extensions;

 namespace Tunnel
 {
@@ -73,14 +74,14 @@ namespace Tunnel
                             if (ioctlPeer->Endpoint.si_family =3D=3D Win32=
.ADDRESS_FAMILY.AF_INET)
                             {
                                 var ip =3D new byte[4];
-                                Marshal.Copy((IntPtr)ioctlPeer->Endpoint.I=
pv4.sin_addr.bytes, ip, 0, 4);
-                                peer.Endpoint =3D new IPEndPoint(new IPAdd=
ress(ip), IPAddress.NetworkToHostOrder(ioctlPeer->Endpoint.Ipv4.sin_port));
+                                Marshal.Copy((IntPtr)ioctlPeer->Endpoint.I=
pv4.sin_addr.bytes, ip, 0, ip.Length);
+                                peer.Endpoint =3D new IPEndPoint(new IPAdd=
ress(ip), ioctlPeer->Endpoint.Ipv4.sin_port.ConvertFromNetworkToHostOrder()=
);
                             }
                             else if (ioctlPeer->Endpoint.si_family =3D=3D =
Win32.ADDRESS_FAMILY.AF_INET6)
                             {
                                 var ip =3D new byte[16];
-                                Marshal.Copy((IntPtr)ioctlPeer->Endpoint.I=
pv6.sin6_addr.bytes, ip, 0, 16);
-                                peer.Endpoint =3D new IPEndPoint(new IPAdd=
ress(ip), IPAddress.NetworkToHostOrder(ioctlPeer->Endpoint.Ipv6.sin6_port))=
;
+                                Marshal.Copy((IntPtr)ioctlPeer->Endpoint.I=
pv6.sin6_addr.bytes, ip, 0, ip.Length);
+                                peer.Endpoint =3D new IPEndPoint(new IPAdd=
ress(ip), ioctlPeer->Endpoint.Ipv6.sin6_port.ConvertFromNetworkToHostOrder(=
));
                             }
                         }
                         peer.TxBytes =3D ioctlPeer->TxBytes;
diff --git a/embeddable-dll-service/csharp/TunnelDll/Win32.cs b/embeddable-=
dll-service/csharp/TunnelDll/Win32.cs
index 4987fe8f..b4084ccf 100644
--- a/embeddable-dll-service/csharp/TunnelDll/Win32.cs
+++ b/embeddable-dll-service/csharp/TunnelDll/Win32.cs
@@ -180,7 +180,7 @@ namespace Tunnel
             public ADDRESS_FAMILY si_family;
         }

-        public enum ADDRESS_FAMILY : UInt32
+        public enum ADDRESS_FAMILY : UInt16
         {
             AF_UNSPEC =3D 0,
             AF_INET =3D 2,
--
2.32.0.windows.2


