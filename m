Return-Path: <SRS0=QZLZ=PK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04311C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 18:30:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65E4E21871
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 18:30:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=jakemoroni.com header.i=@jakemoroni.com header.b="BhBwCgA1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="yiBbrVzp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65E4E21871
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jakemoroni.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 02322e17;
	Wed, 2 Jan 2019 18:27:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ef62843
 for <wireguard@lists.zx2c4.com>;
 Sun, 30 Dec 2018 00:13:25 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 99400155
 for <wireguard@lists.zx2c4.com>;
 Sun, 30 Dec 2018 00:13:24 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 4A1252108A
 for <wireguard@lists.zx2c4.com>; Sat, 29 Dec 2018 19:15:20 -0500 (EST)
Received: from web3 ([10.202.2.213])
 by compute3.internal (MEProxy); Sat, 29 Dec 2018 19:15:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jakemoroni.com;
 h=message-id:from:to:mime-version:content-transfer-encoding
 :content-type:date:subject; s=fm2; bh=pf+TLZNUJ90V45s3bLgXK5MRQh
 TPzVfnqT2H7oY5zTE=; b=BhBwCgA1r/pKrH3CTYBWZLqjtQdPpWEEHJrK6+dCey
 /ApEbMs1cZWiYHJR5+r0KwQamlfoThV61tGjcx4sbcOswMiFUU1a+UN1TKsT3v1R
 42SmImU1+hgDKq1TIxF5wGj0N4ZfWWPBxB0kLkU5qxuxRqZsB7q2jb8DBbYr4LV2
 r5+rX4zPLTQ8O56maVkNIZCCzwFPd3uisfR5hNCd/D217YuQc9Y8CVtKB93hyoeT
 jbPL6bDOWKO9WUdKZHR+WaKpbhbxLUw/pezdNVN3zTQNt+FDA2JvRahockl+YTZn
 w4L3beXqQedg9f15zb/7chp5Z93dYz+YCPXyEh5fQcKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=pf+TLZ
 NUJ90V45s3bLgXK5MRQhTPzVfnqT2H7oY5zTE=; b=yiBbrVzpvzM6P4wY5EMR56
 o3/lBW8r9rjeh/Pdg7lcYsZMmHe93IZrriAXP626RZoa3umgVB9aKTzC7AQYDCd3
 JoSOWZpejLV4+sUzuIk02vYWRu3DFA5UUrNJPTuPEn1GikX4LdwTSRtYQ16YDxzR
 n7wrW0dsPtItGddRrTQGHm9i2KOs6qxqm0OCfyOXGMPyCwI9Y78xaop4GefoVjvM
 SVWDWle9svQW32XX7rc/ASpSlBP9OLy6Y1Na5hAGz7S7IDRP07z9QqSv5aPedo+B
 Zxuh/0Ut9Nk/K1KUIGlrJnDMhKMjYN8b24dOyzwi7W3M7cPVfklrMfEGuz0t+IZA
 ==
X-ME-Sender: <xms:Fw4oXIg_TS82SenPVgqT4UFg2be14sO1WKVU1RWzS8VRfxBdTaKZeA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrtdelgddvudculddtuddrgedtkedrtddtmd
 cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefkhffvggfgtgfofffusehtjeertd
 ertdejnecuhfhrohhmpedflfgrtghosgcuufdrucfoohhrohhnihdfuceomhgrihhlsehj
 rghkvghmohhrohhnihdrtghomheqnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghilh
 esjhgrkhgvmhhorhhonhhirdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:Fw4oXNUpA84b4PX2PBO0kvd6nBzl5JVonczMdRZyMsXfugZ3bA_cBA>
 <xmx:Fw4oXC03SeRgKr4tNDIA3YoP-KvaLs-tLUIA6rvC9QlZuVVzIv58vA>
 <xmx:Fw4oXLGLzrar-8SWHIB3mTmMF_7K09xvjdFVROB4QZlPWggyb9y_tQ>
 <xmx:GA4oXF8Ee4SuhMwYSPQvY5y2fhA87XKMRE9QGiRt-Ci3kOVb5s45vQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 873939E564; Sat, 29 Dec 2018 19:15:19 -0500 (EST)
Message-Id: <1546128919.1294828.1620911976.12CFA382@webmail.messagingengine.com>
From: "Jacob S. Moroni" <mail@jakemoroni.com>
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
X-Mailer: MessagingEngine.com Webmail Interface - ajax-2f590f9a
Date: Sat, 29 Dec 2018 19:15:19 -0500
Subject: WireGuard iOS Client Issue
X-Mailman-Approved-At: Wed, 02 Jan 2019 19:27:55 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello,

I'm experiencing a small issue with the WireGuard iOS client (beta, from
the App Store), but I'm not really sure if the issue is with the WireGuard
client or iOS itself.

Sorry if this is verbose; it's kind of cumbersome to explain.

Basically, what I found is that if there's, for example, a website being
hosted on the same IP as the VPN server, any access to the site (on the
client) will fail while connected to the VPN. What's interesting is that it
always fails while using the "always on" mode, but _sometimes_ works if
using "on demand" mode.

I'm no iOS developer, but a cursory search leads me to believe that
the two ways of handling VPNs on iOS are fundamentally different.

For example, when using "on demand" mode, certain Apple services
will bypass the VPN, but this will not occur if using "always on" mode.

I have absolutely no idea how the routing works on iOS, but my best
guess is that maybe any accesses to the same IP as the VPN server
are handled explicitly outside of the tunnel and this is somehow breaking
things if you try to access the server by any means other than the VPN
client?

My setup:

- Linux server behind NAT with ports 80, 443, and UDP 51820 forwarded.
- WireGuard server running on Linux server.
- Web server also running on same Linux server.
- Hairpin route on the router to allow devices on the LAN to access
  the website via it's public IP.
- Masquerade rule and IP forwarding enabled on the Linux server to
  allow WireGuard clients to access the LAN and Internet.
- iPhone 8 (T-Mo) running the latest WireGuard client app from the App Store.
- "On Demand" option disabled.

What works:

- When VPN is disabled and the phone is on LTE, I can access the website
  via its public IP without issue.
- When VPN is disabled and the phone is on LAN, I can access the website
  via both its public and private LAN IP.
- I can connect to the VPN server without issue both from LTE and from
  LAN.
- When VPN is enabled, I can access any public IP through the VPN from
  both LAN and LTE (except the server's, sort of...).
- When VPN is enabled, I can access the website from the server's LAN IP.

The issue:

- When VPN is enabled, I can't access the website from the server's
  public IP.

My tests:

- I ran Wireshark on the server's wg0 interface while attempting to
  ping various IPs from the iPhone while it was connected to the VPN.
- I was able to ping _any_ IP from the iPhone without issue.
- I can see the ICMP messages on Wireshark for every IP that I
  ping _except_ for when I ping the server's public IP.

So, the fact that pinging any IP worked, and I can see them all
in Wireshark except for when I ping the server's IP leads me to
believe that those messages are being routed outside of the tunnel,
which itself seems kind of obvious, but doesn't explain why accesses
to the website don't work.

Thoughts?

As a side note, apart from this issue, the WireGuard iOS client has been
working very well. I'm using a mixture of T-Mobile LTE and WiFi, and I haven't
had any issues switching back and forth.

Also, WiFi calling works through the VPN, which might seem obvious, but was
impressive to me since WiFi calling barely works on a regular LAN WiFi connection...

Thanks,
-- 
  Jacob S. Moroni
  mail@jakemoroni.com
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
