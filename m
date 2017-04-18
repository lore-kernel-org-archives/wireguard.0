Return-Path: crasm@wireguard.1.email.vczf.io
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f342562b
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Apr 2017 01:31:22 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6efee452
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Apr 2017 01:31:22 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 1188720A44
 for <wireguard@lists.zx2c4.com>; Mon, 17 Apr 2017 21:39:06 -0400 (EDT)
Message-Id: <1492479545.1458773.947454608.1D3BD4D5@webmail.messagingengine.com>
From: crasm@wireguard.1.email.vczf.io
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Subject: Java userspace test (contrib/external-tests/java)
Date: Mon, 17 Apr 2017 21:39:05 -0400
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

I've written an initial attempt for a java userspace test in
[contrib/external-tests/java][], but am currently not getting any
response back from my own wireguard server or the demo server. 

[contrib/external-tests/java]:
https://github.com/crasm/WireGuard/blob/master/contrib/external-tests/java/src/main/java/wireguard/Main.java

I'm fairly sure the problem is in my code, but I'm not sure how to
debug. Is there anyone who would be willing to take a look at this and
compare it to the other external tests?
