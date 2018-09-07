Return-Path: leeloored@gmx.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a34d5479
 for <wireguard@lists.zx2c4.com>; Fri, 7 Sep 2018 16:12:35 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e73f42d
 for <wireguard@lists.zx2c4.com>; Fri, 7 Sep 2018 16:12:34 +0000 (UTC)
Received: from gandalf.arda.local ([87.54.210.6]) by mail.gmx.com (mrgmx002
 [212.227.17.184]) with ESMTPSA (Nemesis) id 0Ldq55-1fXSke3X0t-00j0fh for
 <wireguard@lists.zx2c4.com>; Fri, 07 Sep 2018 18:12:55 +0200
Date: Fri, 7 Sep 2018 18:12:54 +0200
From: Kent Friis <leeloored@gmx.com>
To: wireguard@lists.zx2c4.com
Subject: wireguard-go bug with IPv6-less kernels
Message-Id: <20180907181254.54accc2784d47d048aa3320f@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I've been setting up wireguard-go on an old Linux kernel (no module),
and hit a bug with ipv6-less kernels. The create6() function returns 0
as the port number when an error occurs, so even though CreateBind
checks for EAFNOSUPPORT, it still ends up with port getting set to zero,
resulting in a random port.

I solved it by returning port instead of zero - as far as I can see
this shouldn't break anything, as CreateBind will return 0 anyway on
errors other than EAFNOSUPPORT.

I did not check whether the same bug exists in conn_default.go

- Kent

--- conn_linux.go.old	2018-09-05 23:11:19.407372785 +0200
+++ conn_linux.go	2018-09-07 16:58:28.971914271 +0200
@@ -335,7 +335,7 @@
 	)
 
 	if err != nil {
-		return -1, 0, err
+		return -1, port, err
 	}
 
 	addr := unix.SockaddrInet4{
@@ -366,7 +366,7 @@
 		return unix.Bind(fd, &addr)
 	}(); err != nil {
 		unix.Close(fd)
-		return -1, 0, err
+		return -1, port, err
 	}
 
 	return fd, uint16(addr.Port), err
@@ -383,7 +383,7 @@
 	)
 
 	if err != nil {
-		return -1, 0, err
+		return -1, port, err
 	}
 
 	// set sockopts and bind
@@ -425,7 +425,7 @@
 
 	}(); err != nil {
 		unix.Close(fd)
-		return -1, 0, err
+		return -1, port, err
 	}
 
 	return fd, uint16(addr.Port), err
