Return-Path: emekamicro@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5bd146ef
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Aug 2018 06:54:09 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3723d1f9
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Aug 2018 06:54:09 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id x26-v6so3414759lfi.7
 for <wireguard@lists.zx2c4.com>; Wed, 29 Aug 2018 00:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <0f7abb29-d6d3-d211-c174-2748b318182f@boothlabs.me>
In-Reply-To: <0f7abb29-d6d3-d211-c174-2748b318182f@boothlabs.me>
From: Emeka <emekamicro@gmail.com>
Date: Wed, 29 Aug 2018 08:07:40 +0100
Message-ID: <CAOypoo437UHxE9LJZE3em73NFfKN5kPh7GNKt_=_6oznqYELzw@mail.gmail.com>
Subject: Re: [PATCH ARM] Compile on Raspberry Pi
To: Francis Booth <boothf@boothlabs.me>
Content-Type: multipart/alternative; boundary="000000000000fe840f05748d9d53"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000fe840f05748d9d53
Content-Type: text/plain; charset="UTF-8"

I was able to build on rpi b3 (board 2710 ) some months ago... and I didn't
encounter this . Can I see the  steps you followed?

Regards, Janus

On Wed, Aug 29, 2018, 5:05 AM Francis Booth <boothf@boothlabs.me> wrote:

> Attempting to build Wireguard on a Raspberry Pi will result in an assembly
> error
>
>     Error: immediate expression requires a # prefix -- `moveq r5,1'
>
> (the full build error log can be found here: https://pastebin.com/CKTXwGyG
> )
>
> Appending # to the values and telling ARM to treat them as literals solves
> the issue.
>
> I was able to test this patch out on my own Raspberry Pi 3B+ and can
> confirm the resulting build is successfully able to build, create the wg0
> interface, generate a private key, connect to a peer, and send encrypted
> messages back and forth.
>
> justw and revel assisted in providing the fix via the Wireguard irc
> channel.
>
>
> curve25519: arm: Compile on Raspi
>
> diff --git a/src/crypto/curve25519-arm.S b/src/crypto/curve25519-arm.S
> index cb40c24..f9d50e9 100644
> --- a/src/crypto/curve25519-arm.S
> +++ b/src/crypto/curve25519-arm.S
> @@ -1554,35 +1554,35 @@ ENTRY(curve25519_neon)
>  	movw		r4, 0
>  	movw		r5, 2
>  	cmp		r1, #1
> -	moveq		r5, 1
> +	moveq		r5, #1
>  	addeq		r2, r3, #336
>  	addeq		r4, r3, #48
>  	cmp		r1, #2
> -	moveq		r5, 1
> +	moveq		r5, #1
>  	addeq		r2, r3, #48
>  	cmp		r1, #3
> -	moveq		r5, 5
> +	moveq		r5, #5
>  	addeq		r4, r3, #336
>  	cmp		r1, #4
> -	moveq		r5, 10
> +	moveq		r5, #10
>  	cmp		r1, #5
> -	moveq		r5, 20
> +	moveq		r5, #20
>  	cmp		r1, #6
> -	moveq		r5, 10
> +	moveq		r5, #10
>  	addeq		r2, r3, #336
>  	addeq		r4, r3, #336
>  	cmp		r1, #7
> -	moveq		r5, 50
> +	moveq		r5, #50
>  	cmp		r1, #8
> -	moveq		r5, 100
> +	moveq		r5, #100
>  	cmp		r1, #9
> -	moveq		r5, 50
> +	moveq		r5, #50
>  	addeq		r2, r3, #336
>  	cmp		r1, #10
> -	moveq		r5, 5
> +	moveq		r5, #5
>  	addeq		r2, r3, #48
>  	cmp		r1, #11
> -	moveq		r5, 0
> +	moveq		r5, #0
>  	addeq		r2, r3, #96
>  	add		r6, r3, #144
>  	add		r7, r3, #288
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000fe840f05748d9d53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I was able to build on rpi b3 (board 2710 ) some months a=
go... and I didn&#39;t encounter this . Can I see the=C2=A0 steps you follo=
wed?<div dir=3D"auto"><br></div><div dir=3D"auto">Regards, Janus=C2=A0</div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Aug 29, 2018=
, 5:05 AM Francis Booth &lt;<a href=3D"mailto:boothf@boothlabs.me">boothf@b=
oothlabs.me</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20

   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>Attempting to build Wireguard on a Raspberry Pi will result in an
      assembly error <br>
    </p>
    <p>=C2=A0=C2=A0=C2=A0 Error: immediate expression requires a # prefix -=
- `moveq
      r5,1&#39;</p>
    <p>(the full build error log can be found here:
      <a class=3D"m_777972590414573895moz-txt-link-freetext" href=3D"https:=
//pastebin.com/CKTXwGyG" target=3D"_blank" rel=3D"noreferrer">https://paste=
bin.com/CKTXwGyG</a>)<br>
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
    <pre style=3D"color:rgb(0,0,0);font-style:normal;font-variant-ligatures=
:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text=
-align:start;text-indent:0px;text-transform:none;word-spacing:0px;text-deco=
ration-style:initial;text-decoration-color:initial">curve25519: arm: Compil=
e on Raspi

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
  </div>

_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div>

--000000000000fe840f05748d9d53--
