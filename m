Return-Path: bensammy2@yahoo.co.uk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e17ceaa0
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 23:10:00 +0000 (UTC)
Received: from sonic303-21.consmr.mail.ir2.yahoo.com
 (sonic303-21.consmr.mail.ir2.yahoo.com [77.238.178.202])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 071700d3
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 23:10:00 +0000 (UTC)
Date: Wed, 13 Jun 2018 23:13:54 +0000 (UTC)
From: Ben Edmunds <bensammy2@yahoo.co.uk>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <489114848.8341590.1528931634334@mail.yahoo.com>
In-Reply-To: <CAHmME9oHtrhg=QnYrr0zUQLnLbH7qCiGA=zpWwDbnOnGHsKm3w@mail.gmail.com>
References: <mailman.834.1528911815.2201.wireguard@lists.zx2c4.com>
 <CAHmME9oHtrhg=QnYrr0zUQLnLbH7qCiGA=zpWwDbnOnGHsKm3w@mail.gmail.com>
Subject: Re: Building the android apk on osx (case sensitive)
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_Part_8341589_350415213.1528931634331"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

------=_Part_8341589_350415213.1528931634331
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

 Thanks for that, ive switched the makefile to use gln and it all works now=
.

    On Wednesday, 13 June 2018, 23:08:30 BST, Jason A. Donenfeld <Jason@zx2=
c4.com> wrote: =20
=20
 > ln: illegal option -- r
>
> usage: ln [-Ffhinsv] source_file [target_file]
>
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir
>
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

The makefile uses options from coreutil's ln, which aren't available
on macOS. Use Linux to build the app. If Mac support in the build
system is really important to you and you have something useful you'd
like to contribute, I suppose I can futz with the makefile to use
simpler options to ln. Are you able to use Linux for development?
 =20
------=_Part_8341589_350415213.1528931634331
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head></head><body><div style="font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:13px;"><div style="font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:13px;"><div></div>
        <div><span><span style="font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;">Thanks for that, ive switched the makefile to use gln and it all works now.</span></span><br></div><div><br></div>
        
        </div><div id="ydp622e06d4yahoo_quoted_9698684145" class="ydp622e06d4yahoo_quoted">
            <div style="font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;font-size:13px;color:#26282a;">
                
                <div>
                    On Wednesday, 13 June 2018, 23:08:30 BST, Jason A. Donenfeld &lt;Jason@zx2c4.com&gt; wrote:
                </div>
                <div><br></div>
                <div><br></div>
                <div><div dir="ltr">&gt; ln: illegal option -- r<br></div><div dir="ltr">&gt;<br></div><div dir="ltr">&gt; usage: ln [-Ffhinsv] source_file [target_file]<br></div><div dir="ltr">&gt;<br></div><div dir="ltr">&gt;&nbsp; &nbsp; &nbsp; &nbsp; ln [-Ffhinsv] source_file ... target_dir<br></div><div dir="ltr">&gt;<br></div><div dir="ltr">&gt;&nbsp; &nbsp; &nbsp; &nbsp; link source_file target_file<br></div><div dir="ltr"><br></div><div dir="ltr">The makefile uses options from coreutil's ln, which aren't available<br></div><div dir="ltr">on macOS. Use Linux to build the app. If Mac support in the build<br></div><div dir="ltr">system is really important to you and you have something useful you'd<br></div><div dir="ltr">like to contribute, I suppose I can futz with the makefile to use<br></div><div dir="ltr">simpler options to ln. Are you able to use Linux for development?<br></div></div>
            </div>
        </div></div></body></html>
------=_Part_8341589_350415213.1528931634331--
