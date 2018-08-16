Return-Path: gang.zhao.42@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2137375c
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Aug 2018 08:52:23 +0000 (UTC)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 61186e5b
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Aug 2018 08:52:22 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id z8-v6so1762391pgu.8
 for <wireguard@lists.zx2c4.com>; Thu, 16 Aug 2018 02:04:29 -0700 (PDT)
Return-Path: <gang.zhao.42@gmail.com>
Received: from localhost.localdomain (li1548-248.members.linode.com.
 [139.162.68.248])
 by smtp.gmail.com with ESMTPSA id o10-v6sm44970742pfk.76.2018.08.16.02.04.26
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 16 Aug 2018 02:04:28 -0700 (PDT)
From: Zhao Gang <gang.zhao.42@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH android v2] config: fix wrong Peer endpoint string format
Date: Thu, 16 Aug 2018 17:04:18 +0800
Message-Id: <1c3f3fc48022f584d994b7b8479c6ff82ed7f960.1534396070.git.gang.zhao.42@gmail.com>
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

When a tunnel is running, saving the tunnel's config with an IPv6 address endpoint like [::1234]:42 would result in the wrong format ::1234:42. This patch fixes it.

For endpoints with an IPv6 address(e.g. [::1234]:42). Since the default endpoint InetSocketAddress is created unresolved, getEndpointString() returns "[::1234]:42" (InetSocketAddress.getHostString() returns the literal hostname). After the endpoint is resolved, getEndpointString() returns "::1234:42" (InetSocketAddress.getHostString() returns the IPv6 address without the square brackets). This inconsistent return values caused the above mentioned bug.

With this patch, function getEndpointString would return the right format string whether the endpoint is resolved or not. Also changed the function getResolvedEndpointString to call getEndpointString instead of making the string itself.

Reported-by: Peter Gervai <grin@grin.hu>
Signed-off-by: Zhao Gang <gang.zhao.42@gmail.com>
---
 app/src/main/java/com/wireguard/config/Peer.java | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/app/src/main/java/com/wireguard/config/Peer.java b/app/src/main/java/com/wireguard/config/Peer.java
index 49c8b70..40b77ff 100644
--- a/app/src/main/java/com/wireguard/config/Peer.java
+++ b/app/src/main/java/com/wireguard/config/Peer.java
@@ -15,7 +15,6 @@ import android.support.annotation.Nullable;
 import com.android.databinding.library.baseAdapters.BR;
 import com.wireguard.crypto.KeyEncoding;
 
-import java.net.Inet6Address;
 import java.net.InetSocketAddress;
 import java.net.URI;
 import java.net.URISyntaxException;
@@ -71,7 +70,11 @@ public class Peer {
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
@@ -102,13 +105,8 @@ public class Peer {
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
