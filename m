Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DADCA6002
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 11:15:36 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 929bb458;
	Mon, 5 Oct 2026 06:59:57 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 3f8ca76b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Jul 2026 13:22:51 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-493f4638f4aso6569755e9.3
 for <wireguard@lists.zx2c4.com>; Fri, 10 Jul 2026 06:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783689771; x=1784294571; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hmMUv9IkQdKQukMNST2FZZNC/oJnV5kNNQRmRw3yevk=;
 b=fUu0e72Q4WywTbQiHuZg5j31q+867aYGleJ5X1ZK6IBMr+MVZcbWEiKYlD3qRuecMV
 yEV6+vKmEc0tnzFlFh305JJ++wikWU2Rj6TaUj3/sc2k5rt2PD6AhrRhrO45R4ut6iqE
 2tV68ZUJEoX0dGYubtuf7tAxl4OgW4U9eHAMSInI81+u5HHN6dyjzYsTNuJ7qHePgd/1
 vJF9/OT8AwxVwg9kCsjxoRf21fFByV4rKPMPu7i7uT9nCseg+GLvSAx6fihn19DXmUo8
 7elohG1W4gwbNRnGC6DNoqTLhh2zRPSEkAgsThD3DKGGs6dkHtUxn09hMoJylBAFy+np
 lNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783689771; x=1784294571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hmMUv9IkQdKQukMNST2FZZNC/oJnV5kNNQRmRw3yevk=;
 b=ENTBjAeSuLPv+10xcT46oTHUedHKCAACbu+TZnNDzxtoKTiSMD1AIm83M+E8zMnYcC
 fANFNgadzjPffwJwsrzlyGJMttcA3BuIWJ7V7xqzIi2M8uWfSsHneFRwVsED3MGn+yPz
 HHsYmeczlvjiSbeHPnyGp3rsZkcUbvzEWZ9CYXXnxzQ+O3sARDxoyuntlE0IdCOi2ODU
 2Cb5rhwTPLD5J+jn8di5EqblJiVdXsKbmrdladjWPv9n6I6MHGxop7RR6iYdAic0LyxO
 FohnAs8pnUfQ3qw27Fert2JcStz1WtT8I8blatcAoaAoUwLwYzYQXHvvSsDG5v0PKq8L
 or1w==
X-Gm-Message-State: AOJu0YztCoz2IDeMlz3p1aMu3/ATT39lsNmxppacDytdShuboKQxxdjG
 YALGgApsO0ALSyu4/J7HsCZj0bznW0TI+p+gNO41I/74VVf1FGITRtTVDIOW7dNl
X-Gm-Gg: AfdE7clECt//1J7tYxOYOgBuPowU7FqY3H0b/WXzH36+CvkSlMIo+g1fkT14VRlA0e6
 nlIGPfa7yHDC8BEKmc8p7OFjerDX6SLWDBucwyNDIY9/wBjgabR8JEpSN/A3naJysnl9/o/C775
 nJUkiEwhvgjxO0cIJ159kWevlcDvQkutqCJKBzMKk1+8nsykxpha2LuRO6rF0E2E22zeMCB8uC1
 8lrOZu5JNMiG51c9phpR7URuiqwJJjxvu/oehQdB3+JyAK41DdrvQjh4XtQb43Vxo82D8qYHbkO
 6H5O2OUOOyLRau/vspV9MtqnFLi5GlWbWyAiF5RLoN+pGUaj9MPiqjuXSqKLu7nX7NlhxrS7CT7
 EyezW3/wd2ZHvSVzwgOyoERco+7jCmOxJEBI02ruxBUp8TgJwDOB9vU8krLVtvcdIsJyihgmn6F
 7jWaM7Q8Asag2zalpHujbcUSt1/AFRZ0NCSSbIChr3WRxN6ZhjSg==
X-Received: by 2002:a05:6000:4810:b0:467:f84c:4ca0 with SMTP id
 ffacd0b85a97d-47df07618c6mr13028362f8f.22.1783689770496; 
 Fri, 10 Jul 2026 06:22:50 -0700 (PDT)
Received: from localhost.localdomain ([79.118.195.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039bcdasm62653868f8f.21.2026.07.10.06.22.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Jul 2026 06:22:49 -0700 (PDT)
From: Razvan Cremenescu <razvan.cremenescu@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, Razvan Cremenescu <razvan.cremenescu@gmail.com>
Subject: [PATCH wireguard-apple 3/7] WireGuardKit: attach each adapter to its
 own utun device
Date: Fri, 10 Jul 2026 16:22:35 +0300
Message-ID: <20260710132242.39814-4-razvan.cremenescu@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260710132242.39814-1-razvan.cremenescu@gmail.com>
References: <20260710132242.39814-1-razvan.cremenescu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:59:44 +0000
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

The adapter located its tunnel device by scanning the process's file
descriptors and taking the first utun control socket found. With a
single tunnel per extension process that was always the right one, but
macOS runs multiple simultaneous tunnel sessions in one extension
process: the second adapter would attach to the first tunnel's utun,
leaving its own device without a reader. The second tunnel then passed
no traffic at all, while the first suffered from two backends
competing for the same descriptor.

Collect all utun control sockets instead, exclude the ones already
claimed by other adapters in the process, and prefer the device that
already carries this tunnel's addresses, which
setTunnelNetworkSettings has assigned by the time the backend starts.
The claim is released if the backend fails to start, on stop, and on
deinit.

This makes simultaneous tunnels actually pass traffic on macOS.

Signed-off-by: Razvan Cremenescu <razvan.cremenescu@gmail.com>
---
 Sources/WireGuardKit/WireGuardAdapter.swift | 110 ++++++++++++++++++--
 1 file changed, 103 insertions(+), 7 deletions(-)

diff --git a/Sources/WireGuardKit/WireGuardAdapter.swift b/Sources/WireGuardKit/WireGuardAdapter.swift
index f7be19b..ba49ec7 100644
--- a/Sources/WireGuardKit/WireGuardAdapter.swift
+++ b/Sources/WireGuardKit/WireGuardAdapter.swift
@@ -56,8 +56,26 @@ public class WireGuardAdapter {
     /// Adapter state.
     private var state: State = .stopped
 
+    /// Tunnel device file descriptors claimed by the adapters in this process.
+    /// When multiple tunnels run in a single extension process, each adapter
+    /// must attach to its own utun device rather than to the first one found.
+    private static var claimedTunnelFileDescriptors = Set<Int32>()
+    private static let claimedTunnelFileDescriptorsLock = NSLock()
+
+    /// The utun file descriptor claimed by this adapter, if any.
+    private var claimedTunnelFileDescriptor: Int32?
+
     /// Tunnel device file descriptor.
     private var tunnelFileDescriptor: Int32? {
+        if let claimedTunnelFileDescriptor = claimedTunnelFileDescriptor {
+            return claimedTunnelFileDescriptor
+        }
+        return utunFileDescriptors.first
+    }
+
+    /// File descriptors of all utun devices opened by this process.
+    private var utunFileDescriptors: [Int32] {
+        var fileDescriptors = [Int32]()
         var ctlInfo = ctl_info()
         withUnsafeMutablePointer(to: &ctlInfo.ctl_name) {
             $0.withMemoryRebound(to: CChar.self, capacity: MemoryLayout.size(ofValue: $0.pointee)) {
@@ -83,10 +101,78 @@ public class WireGuardAdapter {
                 }
             }
             if addr.sc_id == ctlInfo.ctl_id {
-                return fd
+                fileDescriptors.append(fd)
             }
         }
-        return nil
+        return fileDescriptors
+    }
+
+    /// Claim the utun device belonging to this adapter's tunnel.
+    /// By the time the backend is started, `setTunnelNetworkSettings` has
+    /// already assigned this tunnel's addresses to its utun device, so among
+    /// the unclaimed devices prefer the one carrying one of our addresses.
+    private func claimTunnelFileDescriptor(for tunnelConfiguration: TunnelConfiguration) -> Int32? {
+        if let claimedTunnelFileDescriptor = claimedTunnelFileDescriptor {
+            return claimedTunnelFileDescriptor
+        }
+        Self.claimedTunnelFileDescriptorsLock.lock()
+        defer { Self.claimedTunnelFileDescriptorsLock.unlock() }
+        let candidates = utunFileDescriptors.filter { !Self.claimedTunnelFileDescriptors.contains($0) }
+        let matching = candidates.first { fd in
+            guard let interfaceName = Self.interfaceName(forTunnelFileDescriptor: fd) else { return false }
+            return Self.interface(interfaceName, hasAnyAddressOf: tunnelConfiguration.interface.addresses)
+        }
+        guard let fileDescriptor = matching ?? candidates.first else { return nil }
+        Self.claimedTunnelFileDescriptors.insert(fileDescriptor)
+        claimedTunnelFileDescriptor = fileDescriptor
+        return fileDescriptor
+    }
+
+    /// Release the utun device claimed by this adapter.
+    private func releaseTunnelFileDescriptor() {
+        Self.claimedTunnelFileDescriptorsLock.lock()
+        defer { Self.claimedTunnelFileDescriptorsLock.unlock() }
+        if let fileDescriptor = claimedTunnelFileDescriptor {
+            Self.claimedTunnelFileDescriptors.remove(fileDescriptor)
+            claimedTunnelFileDescriptor = nil
+        }
+    }
+
+    /// Returns true if the network interface carries at least one of the given addresses.
+    private class func interface(_ interfaceName: String, hasAnyAddressOf addresses: [IPAddressRange]) -> Bool {
+        var interfaceAddresses: UnsafeMutablePointer<ifaddrs>?
+        guard getifaddrs(&interfaceAddresses) == 0 else { return false }
+        defer { freeifaddrs(interfaceAddresses) }
+
+        let addressStrings = addresses.map { "\($0.address)" }
+        var cursor = interfaceAddresses
+        while let ifaddr = cursor?.pointee {
+            cursor = ifaddr.ifa_next
+            guard let ifaAddr = ifaddr.ifa_addr, String(cString: ifaddr.ifa_name) == interfaceName else {
+                continue
+            }
+            var addressString: String?
+            switch Int32(ifaAddr.pointee.sa_family) {
+            case AF_INET:
+                var sin = UnsafeRawPointer(ifaAddr).assumingMemoryBound(to: sockaddr_in.self).pointee
+                var buffer = [CChar](repeating: 0, count: Int(INET_ADDRSTRLEN))
+                if inet_ntop(AF_INET, &sin.sin_addr, &buffer, socklen_t(INET_ADDRSTRLEN)) != nil {
+                    addressString = String(cString: buffer)
+                }
+            case AF_INET6:
+                var sin6 = UnsafeRawPointer(ifaAddr).assumingMemoryBound(to: sockaddr_in6.self).pointee
+                var buffer = [CChar](repeating: 0, count: Int(INET6_ADDRSTRLEN))
+                if inet_ntop(AF_INET6, &sin6.sin6_addr, &buffer, socklen_t(INET6_ADDRSTRLEN)) != nil {
+                    addressString = String(cString: buffer)
+                }
+            default:
+                break
+            }
+            if let addressString = addressString, addressStrings.contains(addressString) {
+                return true
+            }
+        }
+        return false
     }
 
     /// Returns a WireGuard version.
@@ -101,7 +187,11 @@ public class WireGuardAdapter {
     /// - Returns: String.
     public var interfaceName: String? {
         guard let tunnelFileDescriptor = self.tunnelFileDescriptor else { return nil }
+        return Self.interfaceName(forTunnelFileDescriptor: tunnelFileDescriptor)
+    }
 
+    /// Returns the interface name of a utun device file descriptor, or nil on error.
+    private class func interfaceName(forTunnelFileDescriptor tunnelFileDescriptor: Int32) -> String? {
         var buffer = [UInt8](repeating: 0, count: Int(IFNAMSIZ))
 
         return buffer.withUnsafeMutableBufferPointer { mutableBufferPointer in
@@ -148,6 +238,8 @@ public class WireGuardAdapter {
         if case .started(let handle, _) = self.state {
             wgTurnOff(handle)
         }
+
+        releaseTunnelFileDescriptor()
     }
 
     // MARK: - Public methods
@@ -195,7 +287,7 @@ public class WireGuardAdapter {
                 self.logEndpointResolutionResults(resolutionResults)
 
                 self.state = .started(
-                    try self.startWireGuardBackend(wgConfig: wgConfig),
+                    try self.startWireGuardBackend(wgConfig: wgConfig, tunnelConfiguration: tunnelConfiguration),
                     settingsGenerator
                 )
                 self.networkMonitor = networkMonitor
@@ -228,6 +320,7 @@ public class WireGuardAdapter {
             self.networkMonitor?.cancel()
             self.networkMonitor = nil
 
+            self.releaseTunnelFileDescriptor()
             self.state = .stopped
 
             completionHandler(nil)
@@ -365,16 +458,19 @@ public class WireGuardAdapter {
     }
 
     /// Start WireGuard backend.
-    /// - Parameter wgConfig: WireGuard configuration
+    /// - Parameters:
+    ///   - wgConfig: WireGuard configuration
+    ///   - tunnelConfiguration: tunnel configuration
     /// - Throws: an error of type `WireGuardAdapterError`
     /// - Returns: tunnel handle
-    private func startWireGuardBackend(wgConfig: String) throws -> Int32 {
-        guard let tunnelFileDescriptor = self.tunnelFileDescriptor else {
+    private func startWireGuardBackend(wgConfig: String, tunnelConfiguration: TunnelConfiguration) throws -> Int32 {
+        guard let tunnelFileDescriptor = self.claimTunnelFileDescriptor(for: tunnelConfiguration) else {
             throw WireGuardAdapterError.cannotLocateTunnelFileDescriptor
         }
 
         let handle = wgTurnOn(wgConfig, tunnelFileDescriptor)
         if handle < 0 {
+            releaseTunnelFileDescriptor()
             throw WireGuardAdapterError.startWireGuardBackend(handle)
         }
         #if os(iOS)
@@ -449,7 +545,7 @@ public class WireGuardAdapter {
                 self.logEndpointResolutionResults(resolutionResults)
 
                 self.state = .started(
-                    try self.startWireGuardBackend(wgConfig: wgConfig),
+                    try self.startWireGuardBackend(wgConfig: wgConfig, tunnelConfiguration: settingsGenerator.tunnelConfiguration),
                     settingsGenerator
                 )
             } catch {
-- 
2.50.1 (Apple Git-155)

