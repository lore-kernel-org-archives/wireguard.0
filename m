Return-Path: boothf@boothlabs.me
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 633e0cb6
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Aug 2018 22:08:18 +0000 (UTC)
Received: from ip-172-26-1-254.ec2.internal
 (ec2-35-153-75-12.compute-1.amazonaws.com [35.153.75.12])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae4995ae
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Aug 2018 22:08:18 +0000 (UTC)
Received: from [10.16.0.2] (cpe-67-248-39-56.nycap.res.rr.com [67.248.39.56])
 by ip-172-26-1-254.ec2.internal (Postfix) with ESMTPSA id E3554BB8A2
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Aug 2018 18:22:00 -0400 (EDT)
To: wireguard@lists.zx2c4.com
From: Francis Booth <boothf@boothlabs.me>
Subject: [PATCH ARM] Compile on Raspberry Pi
Message-ID: <0f7abb29-d6d3-d211-c174-2748b318182f@boothlabs.me>
Date: Tue, 28 Aug 2018 18:22:00 -0400
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------DA858D5E455D591645C4C71D"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------DA858D5E455D591645C4C71D
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Attempting to build Wireguard on a Raspberry Pi will result in an
assembly error

=C2=A0=C2=A0=C2=A0 Error: immediate expression requires a # prefix -- `mo=
veq r5,1'

(the full build error log can be found here: https://pastebin.com/CKTXwGy=
G)

Appending # to the values and telling ARM to treat them as literals
solves the issue.

I was able to test this patch out on my own Raspberry Pi 3B+ and can
confirm the resulting build is successfully able to build, create the
wg0 interface, generate a private key, connect to a peer, and send
encrypted messages back and forth.

justw and revel assisted in providing the fix via the Wireguard irc chann=
el.


curve25519: arm: Compile on Raspi

diff --git a/src/crypto/curve25519-arm.S b/src/crypto/curve25519-arm.S
index cb40c24..f9d50e9 100644
--- a/src/crypto/curve25519-arm.S
+++ b/src/crypto/curve25519-arm.S
@@ -1554,35 +1554,35 @@ ENTRY(curve25519_neon)
 	movw		r4, 0
 	movw		r5, 2
 	cmp		r1, #1
-	moveq		r5, 1
+	moveq		r5, #1
 	addeq		r2, r3, #336
 	addeq		r4, r3, #48
 	cmp		r1, #2
-	moveq		r5, 1
+	moveq		r5, #1
 	addeq		r2, r3, #48
 	cmp		r1, #3
-	moveq		r5, 5
+	moveq		r5, #5
 	addeq		r4, r3, #336
 	cmp		r1, #4
-	moveq		r5, 10
+	moveq		r5, #10
 	cmp		r1, #5
-	moveq		r5, 20
+	moveq		r5, #20
 	cmp		r1, #6
-	moveq		r5, 10
+	moveq		r5, #10
 	addeq		r2, r3, #336
 	addeq		r4, r3, #336
 	cmp		r1, #7
-	moveq		r5, 50
+	moveq		r5, #50
 	cmp		r1, #8
-	moveq		r5, 100
+	moveq		r5, #100
 	cmp		r1, #9
-	moveq		r5, 50
+	moveq		r5, #50
 	addeq		r2, r3, #336
 	cmp		r1, #10
-	moveq		r5, 5
+	moveq		r5, #5
 	addeq		r2, r3, #48
 	cmp		r1, #11
-	moveq		r5, 0
+	moveq		r5, #0
 	addeq		r2, r3, #96
 	add		r6, r3, #144
 	add		r7, r3, #288


--------------DA858D5E455D591645C4C71D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Attempting to build Wireguard on a Raspberry Pi will result in an
      assembly error <br>
    </p>
    <p>    Error: immediate expression requires a # prefix -- `moveq
      r5,1'</p>
    <p>(the full build error log can be found here:
      <a class="moz-txt-link-freetext" href="https://pastebin.com/CKTXwGyG">https://pastebin.com/CKTXwGyG</a>)<br>
    </p>
    <p>Appending # to the values and telling ARM to treat them as
      literals solves the issue.</p>
    <p>I was able to test this patch out on my own Raspberry Pi 3B+ and
      can confirm the resulting build is successfully able to build,
      create the wg0 interface, generate a private key, connect to a
      peer, and send encrypted messages back and forth.</p>
    <p>justw and revel assisted in providing the fix via the Wireguard
      irc channel.<br>
    </p>
    <p><br>
    </p>
    <pre style="color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">curve25519: arm: Compile on Raspi

diff --git a/src/crypto/curve25519-arm.S b/src/crypto/curve25519-arm.S
index cb40c24..f9d50e9 100644
--- a/src/crypto/curve25519-arm.S
+++ b/src/crypto/curve25519-arm.S
@@ -1554,35 +1554,35 @@ ENTRY(curve25519_neon)
 	movw		r4, 0
 	movw		r5, 2
 	cmp		r1, #1
-	moveq		r5, 1
+	moveq		r5, #1
 	addeq		r2, r3, #336
 	addeq		r4, r3, #48
 	cmp		r1, #2
-	moveq		r5, 1
+	moveq		r5, #1
 	addeq		r2, r3, #48
 	cmp		r1, #3
-	moveq		r5, 5
+	moveq		r5, #5
 	addeq		r4, r3, #336
 	cmp		r1, #4
-	moveq		r5, 10
+	moveq		r5, #10
 	cmp		r1, #5
-	moveq		r5, 20
+	moveq		r5, #20
 	cmp		r1, #6
-	moveq		r5, 10
+	moveq		r5, #10
 	addeq		r2, r3, #336
 	addeq		r4, r3, #336
 	cmp		r1, #7
-	moveq		r5, 50
+	moveq		r5, #50
 	cmp		r1, #8
-	moveq		r5, 100
+	moveq		r5, #100
 	cmp		r1, #9
-	moveq		r5, 50
+	moveq		r5, #50
 	addeq		r2, r3, #336
 	cmp		r1, #10
-	moveq		r5, 5
+	moveq		r5, #5
 	addeq		r2, r3, #48
 	cmp		r1, #11
-	moveq		r5, 0
+	moveq		r5, #0
 	addeq		r2, r3, #96
 	add		r6, r3, #144
 	add		r7, r3, #288</pre>
  </body>
</html>

--------------DA858D5E455D591645C4C71D--
