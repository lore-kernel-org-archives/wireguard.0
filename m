Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBFFEF06E1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Feb 2026 17:13:23 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 59108ef7;
	Sun, 8 Feb 2026 17:10:34 +0000 (UTC)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b5ee829c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 1 Jan 2026 19:37:01 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-37fcec29834so99030791fa.0
 for <wireguard@lists.zx2c4.com>; Thu, 01 Jan 2026 11:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767296220; x=1767901020; darn=lists.zx2c4.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cUPpVLkBPMXGoiuNbXetOJzdk8onkGU7mXksu1apeVg=;
 b=h2+PVWLP7PwZOXeN31rTtvqtMgvpWSSB8gZmF9H2OjMIpYTKjjsbk7kUUDILTkhuOL
 1Napph9T03Y2cDVFJ07FZ3seBI77B+cIq1VcsfPrJ45/StYFvk6HIpBYNFT52MN6htK+
 kLUg+zOgaCBRpH48UBiai82oldVBfxI+W7kpwEBfl5nNIK3x3xL9utdwfqvj5UwsbK4G
 HfUI8iO2IFl3b7ca6Lc1DgR56NJfdrMfQNdLCius0yR/oZSHgH66/G95p6jbWC5vrJQh
 WPek522bM4ExHvC+SGJyqxPknspwNmyiggYHXrexxeWpH2rO5zYc+cr6oyVm/B3oJyWT
 ZWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767296220; x=1767901020;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cUPpVLkBPMXGoiuNbXetOJzdk8onkGU7mXksu1apeVg=;
 b=CJ7NNztNPDym5huI144FjcyL+3fwbUGsQrsB8uKHgpDN6Af3WUOdRbXRT3fLFtkptl
 yG+Uwufh/qRQJ0SFixssjJzQbWtnQZcRVIFHKpbOLVu5FXD232Vi+HAJR/pXWFp/6qqt
 78BjhbNDafm3gWUwvrj2cx98nGfb67imJIRt8m38EsHQvy+D7EF7kTeb5LnODNltEash
 GzMVqetsmIiSnJzjRxy5od4StN7/NPpfyj3fDictec5P7c6/b/3i9CS9frvh66zp9VLu
 WsOf41ufeudoupt2Mzt8n/24O1v/zcqS0jKnHeh1S5mXKjOxec8mvFAv1qk0mcCT9EnR
 sPkA==
X-Gm-Message-State: AOJu0YyfOtn4evvYHpnJW0UfQPEYJFKk+OTZUrOyQ+PC9SkyoBMVDvQa
 25GSE7Ar5PIM0Wfae8XiTXE17mPv0JoSEPwYKq6E/nZWr3FVxBROn26xY1bgPgr53zH1hsJPN2N
 bLkKAp041D9+a74OtXEgvPAT36oFsVGQAak29
X-Gm-Gg: AY/fxX5VOrRBQZo/9FFPLlfJsWQShtU4Pe4EjbKLZGBSxZFTvE8dg6X5jvHlSFqWtGG
 CStT+jtFu6DSYU8Dem5ljkSO1ySbxsGmHjU3SMOPl+ECnA4cpmjY9V8dnke7OvUNO56D/ciKu9s
 HT7Gzc3STVzSnVXRs7iDnRVe6GcdLlDXgcD+GT11yrrQDEwrXUVNHlfSidxjQDEqGJnolccGdW0
 dqsdu+ZuzHhR4u7U3RBch6UBQ5p64slkEG9+EDdEjpZcgP3QTLCOzEjrultnS5ezB2V1m8=
X-Google-Smtp-Source: AGHT+IEFYn0GHZUkILm8Vm3WS201g3expm61TKdHTcMROqvDzNnVLGfBjLOyuACJFnE7U3rZi8Ss2shws7SQLsrym9s=
X-Received: by 2002:a2e:bc07:0:b0:37b:aafa:5af6 with SMTP id
 38308e7fff4ca-381215a0df0mr110810601fa.16.1767296220048; Thu, 01 Jan 2026
 11:37:00 -0800 (PST)
MIME-Version: 1.0
From: Bryant Eadon <bryant.eadon@gmail.com>
Date: Thu, 1 Jan 2026 11:36:48 -0800
X-Gm-Features: AQt7F2p7AA7OcD5SSEP-MgtRByk5ZqFElRvUDEsDN_2GCa3BTS9_cisLKvO6LTM
Message-ID: <CANDT8hHFj9z9vTraCFhJkebaydggZcD_8WA14Ta9aV3BH8-tkg@mail.gmail.com>
Subject: [wireguard-apple] macOS: link-local multicast (mDNS) bypasses tunnel
 despite AllowedIPs = ::/0
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
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

Hello,

I'd like to report a privacy concern with the macOS WireGuard GUI app
where link-local multicast traffic egresses the physical interface
even when the tunnel is configured to capture all traffic.

Environment:
- macOS 14.x (Sonoma)
- WireGuard for macOS (App Store, current version is 1.0.16)
- Full-tunnel configuration

Client configuration:

  [Interface]
  PrivateKey = <redacted>
  Address = 10.10.91.2/32, fd96:e7c9:fb3f:91::2/128
  DNS = 10.10.0.1, fd96:e7c9:fb3f::1

  [Peer]
  PublicKey = <redacted>
  Endpoint = <redacted>:51820
  AllowedIPs = 0.0.0.0/0, ::/0
  PersistentKeepalive = 25

Observed behavior:

With the tunnel active, packet capture on the physical interface (en0)
shows mDNS queries being transmitted outside the tunnel:

- IPv4 mDNS to 224.0.0.251:5353
- IPv6 mDNS to ff02::fb:5353

Services observed leaking include _googlecast._tcp.local,
_airplay._tcp.local, _spotify-connect._tcp.local, and
_companion-link._tcp.local.

Meanwhile, "curl -4 ifconfig.me" correctly returns the VPN exit IP,
confirming the tunnel is functional for unicast traffic.

Privacy implications:

Users configuring AllowedIPs = 0.0.0.0/0, ::/0 reasonably expect all
traffic to traverse the tunnel. However, link-local multicast reveals:

1. The client's presence on the local network
2. The client's link-local IPv4/IPv6 addresses
3. Services the client is attempting to discover
4. Device fingerprinting via mDNS query patterns

This is particularly relevant when using WireGuard on untrusted
networks (hotels, cafes, airports) where the privacy expectation is
highest.

Root cause (suspected):

macOS's mDNSResponder (probably?) binds directly to interfaces and
uses link-local
multicast addresses (224.0.0.0/24, ff02::/16) which are special-cased
by the network stack and don't follow the routing table. Since
WireGuard is a Layer 3 tunnel, it cannot capture Layer 2 multicast
without explicit firewall rules.

A workaround does not appear to be available in the GUI app.

On Linux or with wg-quick, this could be mitigated via PostUp rules:

  PostUp = iptables -I OUTPUT -o %i -d 224.0.0.0/24 -j DROP
  PostUp = ip6tables -I OUTPUT -o %i -d ff02::/16 -j DROP

Or on macOS with pf:

  block drop quick on en0 proto udp from any to 224.0.0.251 port 5353
  block drop quick on en0 proto udp from any to ff02::fb port 5353

However, the macOS GUI app does not support PostUp/PostDown hooks,
leaving users without a native solution.

Request/Questions:

1. Is this behavior considered expected given WireGuard's Layer 3 design?
2. Would the macOS app consider adding an option to block link-local
   multicast on non-tunnel interfaces when a full-tunnel configuration
   is active?
3. Alternatively, could PostUp/PostDown support be added to the macOS
   GUI app?
4. Would the macOS app consider routing the multicast traffic ?
5. Is there other missing traffic which is NOT handled by the IPV4 /
IPV6 config line :  "0.0.0.0/0" and/or "::/0" ?

I have pcap files available if useful for analysis.


Thank you,
Bryant
