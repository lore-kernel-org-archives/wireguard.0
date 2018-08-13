Return-Path: gang.zhao.42@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8d90071
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Aug 2018 15:01:07 +0000 (UTC)
Received: from mail-pl0-x242.google.com (mail-pl0-x242.google.com
 [IPv6:2607:f8b0:400e:c01::242])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7f3c510b
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Aug 2018 15:01:07 +0000 (UTC)
Received: by mail-pl0-x242.google.com with SMTP id ba4-v6so7003590plb.11
 for <wireguard@lists.zx2c4.com>; Mon, 13 Aug 2018 08:12:53 -0700 (PDT)
Return-Path: <gang.zhao.42@gmail.com>
Received: from localhost.localdomain (li409-196.members.linode.com.
 [106.187.89.196])
 by smtp.gmail.com with ESMTPSA id s16-v6sm20806670pfm.114.2018.08.13.08.12.50
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 13 Aug 2018 08:12:51 -0700 (PDT)
From: Zhao Gang <gang.zhao.42@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH android] config: fix wrong Peer endpoint string format
Date: Mon, 13 Aug 2018 23:12:42 +0800
Message-Id: <1ddd5012b4e54c6381079ceab335576fcc530c60.1534172353.git.gang.zhao.42@gmail.com>
In-Reply-To: <CAAWNVq8Cpsqyd66fObKNDYsK9sDE8b1YhEYaz-ZFTujvYeqOcw@mail.gmail.com>
References: <CAAWNVq8Cpsqyd66fObKNDYsK9sDE8b1YhEYaz-ZFTujvYeqOcw@mail.gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

When a tunnel is running, saving the tunnel's config with an IPv6 address endpoint like [::1]:42 would result in the wrong format ::1:42. This patch fixes it.

For endpoints with an IPv6 address(e.g. [::1]:42). Since the default endpoint InetSocketAddress is created unresolved, getEndpointString() returns "[::1]:42" (InetSocketAddress.getHostString() returns the literal hostname). After the endpoint is resolved, getEndpointString() returns "::1:42" (InetSocketAddress.getHostString() returns the IPv6 address without the square brackets). This inconsistent return values caused the above mentioned bug.

With this patch, function getEndpointString would return the right format string whether the endpoint is resolved or not. Also changed the function getResolvedEndpointString to call getEndpointString instead of making the string itself.

Signed-off-by: Zhao Gang <gang.zhao.42@gmail.com>
---
 app/src/main/java/com/wireguard/config/Peer.java | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/app/src/main/java/com/wireguard/config/Peer.java b/app/src/main/java/com/wireguard/config/Peer.java
index 49c8b70..4c8703c 100644
--- a/app/src/main/java/com/wireguard/config/Peer.java
+++ b/app/src/main/java/com/wireguard/config/Peer.java
@@ -71,7 +71,11 @@ public class Peer {
     private String getEndpointString() {
         if (endpoint == null)
             return null;
-        return String.format("%s:%d", endpoint.getHostString(), endpoint.getPort());
+
+        if (endpoint.getHostString().contains(":") && !endpoint.getHostString().contains("["))
+            return String.format("[%s]:%d", endpoint.getHostString(), endpoint.getPort());
+        else
+            return String.format("%s:%d", endpoint.getHostString(), endpoint.getPort());
     }
 
     public int getPersistentKeepalive() {
@@ -102,13 +106,8 @@ public class Peer {
             endpoint = new InetSocketAddress(endpoint.getHostString(), endpoint.getPort());
         if (endpoint.isUnresolved())
             throw new UnknownHostException(endpoint.getHostString());
-        if (endpoint.getAddress() instanceof Inet6Address)
-            return String.format("[%s]:%d",
-                    endpoint.getAddress().getHostAddress(),
-                    endpoint.getPort());
-        return String.format("%s:%d",
-                endpoint.getAddress().getHostAddress(),
-                endpoint.getPort());
+
+        return getEndpointString();
     }
 
     public void parse(final String line) {
-- 
2.18.0
