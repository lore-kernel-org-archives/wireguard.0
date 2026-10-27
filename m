Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BEA606A31A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Oct 2026 19:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=l5RaMJaF
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 38ba0b61;
	Tue, 27 Oct 2026 19:53:27 +0000 (UTC)
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 2da6be87
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Oct 2026 19:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail2; t=1793130804; x=1793390004;
 bh=Swjlpc2sUOhFz5jL/urVuQnRv7tsm4CQW62FkP1A1j8=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=l5RaMJaFwpah7M0Ao9mJcXkwmAuF6n0AeEXhFJ17a24fbdYn7DbQoX3GycvEX50U1
 LyrPJGoddEBUwTWmc8/z54OTUacxfXSoNU5JBRGliNr9sRedrL9RLMuckPbAcr8vtE
 1M4zuQNieRzUalnrOoUw8DD7eRtYFZ35EW0bEGil1JUcFR2VtxrAFtQxetxLllnGaP
 OZqF+GgBLGep78NcX5uM5ij75/2hp4N+TTSAUJXeOQpGU9+yOX5StxbfClq62+I5+s
 dvAYyJ7LfGS+iI8JfR5ACt9ClxiZZxAS4KO3BT40i9Y5Ys/NO/G6p6PjmvdHc4Zwgy
 mILTPXYEy97fA==
Date: Tue, 27 Oct 2026 19:53:20 +0000
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: John <therealgraysky@proton.me>
Subject: [PATCH] wireguard-apple: skip bump keepalive when local source is
 unchanged
Message-ID: <td4woLomZIZwR883bnvy_IeKSIPaiUjFJPe23JvyUxF-Cg77isf4LT4NH8IFtIURHm053LGIr5JBVe1Hzge-CFl2m0-ZNeM4XCnD4_eidZ4=@proton.me>
Feedback-ID: 47473199:user:proton
X-Pm-Message-ID: ef3dfbca601d543cac8603d22bd2de6211568249
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="b1=_Y5GTO6zBHUXCW9fJb5oSMuVvZuXWlIisTEXLk52hY"
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--b1=_Y5GTO6zBHUXCW9fJb5oSMuVvZuXWlIisTEXLk52hY
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This is a proposed fix for the battery drain I reported here:

  https://lists.zx2c4.com/pipermail/wireguard/2026-October/009758.html

The results below are from running with the patch applied for about a day o=
n the iPhone 16 Pro from the original report (iOS 27.0.1, IPv6-only cellula=
r with DNS64, On-Demand on, no PersistentKeepalive on either end).

Upstream master does not build and launch with the iOS 27 SDK, so the test =
build also carried my own equivalent of Loren McQuade's fixes (sys/types.h =
include, UIScene lifecycle), written before I saw his series:

  https://lists.zx2c4.com/pipermail/wireguard/2026-October/009755.html

Two corrections to the speculation in my first post.
1. The rebind itself is likely not the problem: BindUpdate reopens on the s=
ame port and sends nothing. The cost was the keepalive wgBumpSockets sends =
after every rebind. Each one goes through keepKeyFreshSending, which starts=
 a new handshake once the keypair is older than REKEY_AFTER_TIME, so with a=
n update every few seconds an idle tunnel never went quiet. That, not the r=
ebinding, is where the extra handshakes and retries came from.

2. I also did not use the dedup I suggested. An update with the same status=
 and interface list can still carry a new address or NAT64 prefix, and skip=
ping it would leave a stale endpoint or dead socket. Instead, the attached =
patch keeps the rebind on every update but only sends the keepalive when th=
e local source address toward a peer changes (UDP connect route lookup, no =
packet sent), on the first bump, or when the lookup fails.

Battery: WireGuard is at 10% of battery usage after ~11 hours of being on c=
ellular, down from the ~20% in the original report.

From the in-app log (the last ~4 hours, 3.5h of tunnel uptime), per hour of=
 tunnel uptime:

                          before   after
  path updates               239      53
  keepalives sent            236      12
  handshake initiations       42      21
  handshake retries           23      17

Of 190 rebinds, only 2 sent a keepalive, both on real Wi-Fi/cellular switch=
es, and the route lookup returned the physical interface address rather tha=
n the tunnel's, so roaming still works.

The repeated path updates are still there but they now cost only CPU. I hav=
e no iOS 26 comparison, so I can't say whether this is new in iOS 27.

--b1=_Y5GTO6zBHUXCW9fJb5oSMuVvZuXWlIisTEXLk52hY
Content-Type: text/x-patch; name=WireGuardKitGo-skip-bump-keepalive-when-local-source.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=WireGuardKitGo-skip-bump-keepalive-when-local-source.patch

RnJvbSBiOGNmZmUyYWNjOWNmZTc3NGJlNTFhY2ZiYTRiZWM2MGE5YmVlOTNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKb2huIEF1ZGlhIDx0aGVyZWFsZ3JheXNreUBwcm90b24ubWU+
CkRhdGU6IFN1biwgMjUgT2N0IDIwMjYgMTM6MTc6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBX
aXJlR3VhcmRLaXRHbzogc2tpcCBidW1wIGtlZXBhbGl2ZSB3aGVuIGxvY2FsIHNvdXJjZSBpcwog
dW5jaGFuZ2VkCgpPbiBpT1MgMjcsIHBhdGggdXBkYXRlcyB3aXRoIHRoZSBzYW1lIHN0YXR1cyBh
bmQgaW50ZXJmYWNlcyBhcnJpdmUKZXZlcnkgZmV3IHNlY29uZHMuIEVhY2ggb25lIHNlbnQgYSBr
ZWVwYWxpdmUsIHdoaWNoIGtlZXBzIHRoZSByYWRpbwphd2FrZSBhbmQsIG9uY2UgdGhlIGtleXBh
aXIgcGFzc2VzIFJFS0VZX0FGVEVSX1RJTUUsIHN0YXJ0cyBhIG5ldwpoYW5kc2hha2UsIHNvIGFu
IGlkbGUgdHVubmVsIG5ldmVyIGdvZXMgcXVpZXQuCgpTdGlsbCByZWJpbmQgb24gZXZlcnkgdXBk
YXRlLCBidXQgb25seSBzZW5kIHRoZSBrZWVwYWxpdmUgd2hlbiB0aGUKbG9jYWwgc291cmNlIGFk
ZHJlc3MgZm9yIGEgcGVlciBlbmRwb2ludCBjaGFuZ2VzLCBvbiB0aGUgZmlyc3QgYnVtcCwKb3Ig
d2hlbiB0aGUgbG9va3VwIGZhaWxzLCBzbyByb2FtaW5nIHN0aWxsIG5vdGlmaWVzIHRoZSBwZWVy
LgoKU2lnbmVkLW9mZi1ieTogSm9obiBBdWRpYSA8dGhlcmVhbGdyYXlza3lAcHJvdG9uLm1lPgot
LS0KIFNvdXJjZXMvV2lyZUd1YXJkS2l0R28vYXBpLWFwcGxlLmdvIHwgNTQgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvU291cmNlcy9XaXJlR3VhcmRLaXRHby9hcGktYXBwbGUu
Z28gYi9Tb3VyY2VzL1dpcmVHdWFyZEtpdEdvL2FwaS1hcHBsZS5nbwppbmRleCA1ZDI0OTgyYWM1
YjcuLjY1YzcxYTMwNDNkMSAxMDA2NDQKLS0tIGEvU291cmNlcy9XaXJlR3VhcmRLaXRHby9hcGkt
YXBwbGUuZ28KKysrIGIvU291cmNlcy9XaXJlR3VhcmRLaXRHby9hcGktYXBwbGUuZ28KQEAgLTE2
LDExICsxNiwxNCBAQCBpbXBvcnQgIkMiCiBpbXBvcnQgKAogCSJmbXQiCiAJIm1hdGgiCisJIm5l
dCIKIAkib3MiCiAJIm9zL3NpZ25hbCIKIAkicnVudGltZSIKIAkicnVudGltZS9kZWJ1ZyIKKwki
c29ydCIKIAkic3RyaW5ncyIKKwkic3luYyIKIAkidGltZSIKIAkidW5zYWZlIgogCkBAIC01OCw2
ICs2MSw0MiBAQCB0eXBlIHR1bm5lbEhhbmRsZSBzdHJ1Y3QgewogCiB2YXIgdHVubmVsSGFuZGxl
cyA9IG1ha2UobWFwW2ludDMyXXR1bm5lbEhhbmRsZSkKIAordmFyICgKKwlsYXN0U291cmNlc011
IHN5bmMuTXV0ZXgKKwlsYXN0U291cmNlcyAgID0gbWFrZShtYXBbaW50MzJdc3RyaW5nKQorKQor
CisvLyBsb2NhbFNvdXJjZXMgcmV0dXJucyBlYWNoIHBlZXIgZW5kcG9pbnQgcGFpcmVkIHdpdGgg
dGhlIGxvY2FsIGFkZHJlc3MgdGhlIE9TCisvLyB3b3VsZCB1c2UgdG8gcmVhY2ggaXQuIEEgVURQ
IGNvbm5lY3Qgb25seSBwZXJmb3JtcyBhIHJvdXRlIGxvb2t1cDsgbm90aGluZyBpcworLy8gc2Vu
dC4KK2Z1bmMgbG9jYWxTb3VyY2VzKGRldiAqZGV2aWNlLkRldmljZSkgc3RyaW5nIHsKKwljZmcs
IGVyciA6PSBkZXYuSXBjR2V0KCkKKwlpZiBlcnIgIT0gbmlsIHsKKwkJcmV0dXJuICIiCisJfQor
CXZhciBzcmNzIFtdc3RyaW5nCisJZm9yIF8sIGxpbmUgOj0gcmFuZ2Ugc3RyaW5ncy5TcGxpdChj
ZmcsICJcbiIpIHsKKwkJaWYgIXN0cmluZ3MuSGFzUHJlZml4KGxpbmUsICJlbmRwb2ludD0iKSB7
CisJCQljb250aW51ZQorCQl9CisJCWVuZHBvaW50IDo9IHN0cmluZ3MuVHJpbVByZWZpeChsaW5l
LCAiZW5kcG9pbnQ9IikKKwkJcmFkZHIsIGVyciA6PSBuZXQuUmVzb2x2ZVVEUEFkZHIoInVkcCIs
IGVuZHBvaW50KQorCQlpZiBlcnIgIT0gbmlsIHsKKwkJCWNvbnRpbnVlCisJCX0KKwkJYywgZXJy
IDo9IG5ldC5EaWFsVURQKCJ1ZHAiLCBuaWwsIHJhZGRyKQorCQlpZiBlcnIgIT0gbmlsIHsKKwkJ
CWNvbnRpbnVlCisJCX0KKwkJaWYgbGFkZHIsIG9rIDo9IGMuTG9jYWxBZGRyKCkuKCpuZXQuVURQ
QWRkcik7IG9rIHsKKwkJCXNyY3MgPSBhcHBlbmQoc3JjcywgZW5kcG9pbnQrIj4iK2xhZGRyLklQ
LlN0cmluZygpKQorCQl9CisJCWMuQ2xvc2UoKQorCX0KKwlzb3J0LlN0cmluZ3Moc3JjcykKKwly
ZXR1cm4gc3RyaW5ncy5Kb2luKHNyY3MsICIsIikKK30KKwogZnVuYyBpbml0KCkgewogCXNpZ25h
bHMgOj0gbWFrZShjaGFuIG9zLlNpZ25hbCkKIAlzaWduYWwuTm90aWZ5KHNpZ25hbHMsIHVuaXgu
U0lHVVNSMikKQEAgLTE0MCw2ICsxNzksOSBAQCBmdW5jIHdnVHVybk9mZih0dW5uZWxIYW5kbGUg
aW50MzIpIHsKIAkJcmV0dXJuCiAJfQogCWRlbGV0ZSh0dW5uZWxIYW5kbGVzLCB0dW5uZWxIYW5k
bGUpCisJbGFzdFNvdXJjZXNNdS5Mb2NrKCkKKwlkZWxldGUobGFzdFNvdXJjZXMsIHR1bm5lbEhh
bmRsZSkKKwlsYXN0U291cmNlc011LlVubG9jaygpCiAJZGV2LkNsb3NlKCkKIH0KIApAQCAtMTgz
LDcgKzIyNSwxNyBAQCBmdW5jIHdnQnVtcFNvY2tldHModHVubmVsSGFuZGxlIGludDMyKSB7CiAJ
CWZvciBpIDo9IDA7IGkgPCAxMDsgaSsrIHsKIAkJCWVyciA6PSBkZXYuQmluZFVwZGF0ZSgpCiAJ
CQlpZiBlcnIgPT0gbmlsIHsKLQkJCQlkZXYuU2VuZEtlZXBhbGl2ZXNUb1BlZXJzV2l0aEN1cnJl
bnRLZXlwYWlyKCkKKwkJCQlzcmMgOj0gbG9jYWxTb3VyY2VzKGRldi5EZXZpY2UpCisJCQkJbGFz
dFNvdXJjZXNNdS5Mb2NrKCkKKwkJCQljaGFuZ2VkIDo9IHNyYyA9PSAiIiB8fCBzcmMgIT0gbGFz
dFNvdXJjZXNbdHVubmVsSGFuZGxlXQorCQkJCWxhc3RTb3VyY2VzW3R1bm5lbEhhbmRsZV0gPSBz
cmMKKwkJCQlsYXN0U291cmNlc011LlVubG9jaygpCisJCQkJaWYgY2hhbmdlZCB7CisJCQkJCWRl
di5WZXJib3NlZigiTG9jYWwgc291cmNlIGFkZHJlc3NlcyBjaGFuZ2VkIHRvICVxLCBzZW5kaW5n
IGtlZXBhbGl2ZSIsIHNyYykKKwkJCQkJZGV2LlNlbmRLZWVwYWxpdmVzVG9QZWVyc1dpdGhDdXJy
ZW50S2V5cGFpcigpCisJCQkJfSBlbHNlIHsKKwkJCQkJZGV2LlZlcmJvc2VmKCJMb2NhbCBzb3Vy
Y2UgYWRkcmVzcyB1bmNoYW5nZWQsIHNraXBwaW5nIGtlZXBhbGl2ZSIpCisJCQkJfQogCQkJCXJl
dHVybgogCQkJfQogCQkJZGV2LkVycm9yZigiVW5hYmxlIHRvIHVwZGF0ZSBiaW5kLCB0cnkgJWQ6
ICV2IiwgaSsxLCBlcnIpCi0tIAoyLjU2LjAKCg==

--b1=_Y5GTO6zBHUXCW9fJb5oSMuVvZuXWlIisTEXLk52hY--

