Return-Path: lists@lonnie.abelbeck.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 522dc528
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Nov 2017 20:26:58 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9516dbce
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Nov 2017 20:26:58 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id F19B511662
 for <wireguard@lists.zx2c4.com>; Thu, 16 Nov 2017 15:31:21 -0500 (EST)
Received: from macpro.priv.abelbeck.com (wsip-70-165-110-240.om.om.cox.net
 [70.165.110.240])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id A92D21165B
 for <wireguard@lists.zx2c4.com>; Thu, 16 Nov 2017 15:31:21 -0500 (EST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Subject: Request: Optional "Comment" [Peer] entry
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <CAHmME9qvePERJzuUKXz+nMgd9rH2G9T2EkTbyfPO+8oonR+KoQ@mail.gmail.com>
Date: Thu, 16 Nov 2017 14:31:20 -0600
Message-Id: <7777F2EF-1D1B-4403-91C6-FB4A36C92CC5@lonnie.abelbeck.com>
References: <1510826689.1349863.1174432192.27EE87E6@webmail.messagingengine.com>
 <CAHmME9qvePERJzuUKXz+nMgd9rH2G9T2EkTbyfPO+8oonR+KoQ@mail.gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I have a suggestion, feature request ...

With several peers, the output of "wg show" is difficult to visually =
identify the peers at a quick glance.

How about an optional "Comment =3D " entry for the [Peer] section.

For Example:
--
[Peer]
PublicKey =3D UMJMPFVTzjmzr7SJMQ7k+Z+3Pr1aq4w+5chtUny6Akg=3D
Endpoint =3D [fda6:66b2:b74a:50::3]:51820
AllowedIPs =3D 10.4.0.2/32
Comment =3D pbx3 - Jetway NF9HG-2930
--

For each peer in "wg show" with a "Comment =3D " defined ...
--
peer: HIgo9xNzJMWLKASShiTqIybxZ0U3wGLiUeJ1PKf8ykw=3D
  endpoint: [fda6:662b:b74a:50::3]:51820
  allowed ips: 10.4.0.2/32
  latest handshake: 3 seconds ago
  transfer: 376 B received, 680 B sent
  comment: pbx3 - Jetway NF9HG-2930
--

If others like this idea, should the comment be displayed first, last, =
etc. ?

Truncating the comment string to 64 characters would be fine.  Or even =
32 chars.

Thoughts ?

Lonnie
