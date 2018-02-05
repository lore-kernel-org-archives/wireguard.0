Return-Path: justin@altheamesh.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f1ba640f
 for <wireguard@lists.zx2c4.com>; Mon, 5 Feb 2018 20:54:21 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e0862d4e
 for <wireguard@lists.zx2c4.com>; Mon, 5 Feb 2018 20:54:21 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 1ACF620E06
 for <wireguard@lists.zx2c4.com>; Mon,  5 Feb 2018 16:00:07 -0500 (EST)
Message-Id: <1517864406.3150045.1260465240.2EC06D52@webmail.messagingengine.com>
From: Justin Kilpatrick <justin@altheamesh.com>
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Subject: [WireGuard] Nesting WireGuard tunnels
Date: Mon, 05 Feb 2018 16:00:06 -0500
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I won't bore you with the details but I'm working on a project where nesting Wireguard tunnels is an attractive solution to a thorny problem. 

It looks like this. 

A <--Tunnel A on port 51821--> B <--Tunnel B on port 51820--> C 

Where A is sending packets addressed to the internal endpoint of  Tunnel B on port 51821 and B forwards them along. 

I see the correct packets come out of the Tunnel B interface at the destination, but they never seem to go into the Tunnel A endpoint on Device C. If I had to make a guess I'd say that since WireGuard is in-kernel it will never listen on devices that aren't physical nics. 

For the short term I've solved this problem by having Device C use a keepalive to Device A, which has only a single tunnel. The NAT traversal code then figures out how to navigate the nested tunnels on Device C to form a bi-directional connection.

My questions are. 

1) Is capability for nesting a feature that the community is interested in?
2) Can it be implemented in a sane way?
3) If the above two points are true, I'd appreciate some pointers about how to get started on a patch.  

-- 
  Justin Kilpatrick
  justin@altheamesh.com
