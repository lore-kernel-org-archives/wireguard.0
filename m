Return-Path: logcabin@fastmail.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a0b75f0
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Aug 2018 10:20:46 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 344a8d0e
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Aug 2018 10:20:46 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 575032202A
 for <wireguard@lists.zx2c4.com>; Wed, 29 Aug 2018 06:34:32 -0400 (EDT)
Message-Id: <1535538871.3336587.1489871408.04CE192C@webmail.messagingengine.com>
From: logcabin@fastmail.net
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="_----------=_153553887133365872"
Date: Wed, 29 Aug 2018 06:34:31 -0400
References: <0f7abb29-d6d3-d211-c174-2748b318182f@boothlabs.me>
 <CAOypoo437UHxE9LJZE3em73NFfKN5kPh7GNKt_=_6oznqYELzw@mail.gmail.com>
Subject: Re: [PATCH ARM] Compile on Raspberry Pi
In-Reply-To: <CAOypoo437UHxE9LJZE3em73NFfKN5kPh7GNKt_=_6oznqYELzw@mail.gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.

--_----------=_153553887133365872
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"

I've been building wg on an rpi b3 for quite some time and have never
seen this error. This is with Raspbian Stretch. Maybe compiler related?

On Wed, Aug 29, 2018, at 3:07 AM, Emeka wrote:
> I was able to build on rpi b3 (board 2710 ) some months ago... and I
> didn't encounter this . Can I see the  steps you followed?> 
> Regards, Janus 
> 
> On Wed, Aug 29, 2018, 5:05 AM Francis Booth
> <boothf@boothlabs.me> wrote:>> Attempting to build Wireguard on a Raspberry Pi will result in an
>> assembly error>>     Error: immediate expression requires a # prefix -- `moveq r5,1'>> (the full build error log can be found here:
>> https://pastebin.com/CKTXwGyG)>> Appending # to the values and telling ARM to treat them as literals
>> solves the issue.>> I was able to test this patch out on my own Raspberry Pi 3B+ and can
>> confirm the resulting build is successfully able to build, create the
>> wg0 interface, generate a private key, connect to a peer, and send
>> encrypted messages back and forth.>> justw and revel assisted in providing the fix via the Wireguard irc
>> channel.>>


>> curve25519: arm: Compile on Raspi  diff --git a/src/crypto/curve25519-
>> arm.S b/src/crypto/curve25519-arm.S index cb40c24..f9d50e9 100644 ---
>> a/src/crypto/curve25519-arm.S +++ b/src/crypto/curve25519-arm.S @@
>> -1554,35 +1554,35 @@ ENTRY(curve25519_neon)  movw  r4, 0  movw  r5, 2
>> cmp  r1, #1 - moveq  r5, 1 + moveq  r5, #1  addeq  r2, r3, #336
>> addeq  r4, r3, #48  cmp  r1, #2 - moveq  r5, 1 + moveq  r5, #1  addeq
>> r2, r3, #48  cmp  r1, #3 - moveq  r5, 5 + moveq  r5, #5  addeq  r4,
>> r3, #336  cmp  r1, #4 - moveq  r5, 10 + moveq  r5, #10  cmp  r1, #5 -
>> moveq  r5, 20 + moveq  r5, #20  cmp  r1, #6 - moveq  r5, 10 + moveq
>> r5, #10  addeq  r2, r3, #336  addeq  r4, r3, #336  cmp  r1, #7 -
>> moveq  r5, 50 + moveq  r5, #50  cmp  r1, #8 - moveq  r5, 100 + moveq
>> r5, #100  cmp  r1, #9 - moveq  r5, 50 + moveq  r5, #50  addeq  r2,
>> r3, #336  cmp  r1, #10 - moveq  r5, 5 + moveq  r5, #5  addeq  r2, r3,
>> #48  cmp  r1, #11 - moveq  r5, 0 + moveq  r5, #0  addeq  r2, r3, #96
>> add  r6, r3, #144  add  r7, r3, #288>> _______________________________________________
>>  WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
> _________________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard


--_----------=_153553887133365872
Content-Transfer-Encoding: 7bit
Content-Type: text/html; charset="utf-8"

<!DOCTYPE html>
<html>
<head>
<title></title>
<style type="text/css">p.MsoNormal,p.MsoNoSpacing{margin:0}</style>
</head>
<body><div style="font-family:Arial;">I've been building wg on an rpi b3 for quite some time and have never seen this error. This is with Raspbian Stretch. Maybe compiler related?<br></div>
<div><br></div>
<div><br></div>
<div>On Wed, Aug 29, 2018, at 3:07 AM, Emeka wrote:<br></div>
<blockquote type="cite"><div><div style="font-family:Arial;">I was able to build on rpi b3 (board 2710 ) some months ago... and I didn't encounter this . Can I see the&nbsp; steps you followed?<br></div>
<div><br></div>
<div>Regards, Janus&nbsp;<br></div>
</div>
<div style="font-family:Arial;"><br></div>
<div defang_data-gmailquote="yes"><div dir="ltr">On Wed, Aug 29, 2018, 5:05 AM Francis Booth &lt;<a href="mailto:boothf@boothlabs.me">boothf@boothlabs.me</a>&gt; wrote:<br></div>
<blockquote defang_data-gmailquote="yes" style="margin-top:0px;margin-right:0px;margin-bottom:0px;margin-left:0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204, 204, 204);padding-left:1ex;"><div bgcolor="#FFFFFF"><p>Attempting to build Wireguard on a Raspberry Pi will result in an
      assembly error <br></p><p>&nbsp;&nbsp;&nbsp; Error: immediate expression requires a # prefix -- `moveq
      r5,1'<br></p><p>(the full build error log can be found here: <a href="https://pastebin.com/CKTXwGyG">https://pastebin.com/CKTXwGyG</a>)<br></p><p>Appending # to the values and telling ARM to treat them as
      literals solves the issue.<br></p><p>I was able to test this patch out on my own Raspberry Pi 3B+ and
      can confirm the resulting build is successfully able to build,
      create the wg0 interface, generate a private key, connect to a
      peer, and send encrypted messages back and forth.<br></p><p>justw and revel assisted in providing the fix via the Wireguard
      irc channel.<br></p><p><br></p><pre style="color:rgb(0, 0, 0);font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;word-spacing:0px;text-decoration-style:initial;text-decoration-color:initial;">curve25519: arm: Compile on Raspi

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
 	add		r7, r3, #288<br></pre></div>
<div style="font-family:Arial;">_______________________________________________<br></div>
<div style="font-family:Arial;"> WireGuard mailing list<br></div>
<div style="font-family:Arial;"> <a href="mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a><br></div>
<div style="font-family:Arial;"> <a href="https://lists.zx2c4.com/mailman/listinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard</a><br></div>
</blockquote></div>
<div><u>_______________________________________________</u><br></div>
<div>WireGuard mailing list<br></div>
<div><a href="mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a><br></div>
<div><a href="https://lists.zx2c4.com/mailman/listinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard</a><br></div>
</blockquote><div style="font-family:Arial;"><br></div>
</body>
</html>

--_----------=_153553887133365872--
