Return-Path: <SRS0=23NU=3L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0685DC33CBA
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Jan 2020 19:48:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8138B2465A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Jan 2020 19:48:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=squyres.com header.i=@squyres.com header.b="qYziMh+5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8138B2465A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=squyres.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a19c853;
	Wed, 22 Jan 2020 19:48:13 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ec96e64
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Jan 2020 02:44:29 +0000 (UTC)
Received: from squyres.com (squyres.com [64.253.106.170])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 392bfeaf
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Jan 2020 02:44:29 +0000 (UTC)
X-Debug-Header: memoryhole.net squyres.com
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=squyres.com; h=
 mime-version:references:in-reply-to:from:date:message-id:subject
 :to:cc:content-type; s=default; bh=fI7C/tghL8kbRhwYSyECEWix9Zs=; b=
 qYziMh+569nCIxwwXf2qJji9J15OB7a8p8je7aybSz58BD45lDG7QXMulEJFZvt6
 GVpRQNVeqPwT+WFXQaXfYqMuVTc2qs31l09sIPnR8s9V6MLlHzjYkAMEgHzBNzod
 AfkK6twaEC+j+KlQd1DS7593AxqmPYk592PKes7j+1E=
Received: (qmail 20168 invoked by uid 64020); 16 Jan 2020 02:44:27 -0000
Received: from unknown (HELO mail-wm1-f44.google.com) (jeff@209.85.128.44) by 
 squyres.com with ESMTPSA (AES128-SHA encrypted, authenticated); 16 
 Jan 2020 02:44:27 -0000
Received: by mail-wm1-f44.google.com with SMTP id 20so2144575wmj.4
 for <wireguard@lists.zx2c4.com>; Wed, 15 Jan 2020 18:44:27 -0800 (PST)
X-Gm-Message-State: APjAAAVYOmjcjfbEdm6d9i089aZw/uYYB9a8uejxBVreCH7XXEsHlC4S
 lFuzFIS6VJlZlOPd3yCqLupD2QcZDSLadrGSE4Y=
X-Google-Smtp-Source: APXvYqzzDnMsgzetQ/kImw01EMw80WVdfP9rBU2bkCv2fMcTTbQUFJ/70F55dyosMLX2QGMb092Rqd/n2F7sP46qdao=
X-Received: by 2002:a05:600c:2c2:: with SMTP id
 2mr3349114wmn.155.1579142667191; 
 Wed, 15 Jan 2020 18:44:27 -0800 (PST)
MIME-Version: 1.0
References: <CAOmeisV22+6uKgX0ja+i4gnGWo5fUWhk6Je9PiFvf7itcY+3uQ@mail.gmail.com>
 <CAO_nJAa-RFk29B8_qzTJZFA62p3qCPEYXqQHn_-5FXC6YiSM-A@mail.gmail.com>
In-Reply-To: <CAO_nJAa-RFk29B8_qzTJZFA62p3qCPEYXqQHn_-5FXC6YiSM-A@mail.gmail.com>
From: Jeff Squyres <jeff@squyres.com>
Date: Wed, 15 Jan 2020 21:44:15 -0500
X-Gmail-Original-Message-ID: <CAOmeisW6gwU39APXKnfRHPW95-AaooFw-YmAamVQk9fHwE0k6Q@mail.gmail.com>
Message-ID: <CAOmeisW6gwU39APXKnfRHPW95-AaooFw-YmAamVQk9fHwE0k6Q@mail.gmail.com>
Subject: Re: Problem with iOS WireGuard client
To: John <graysky@archlinux.us>
Content-Type: multipart/mixed; boundary="000000000000baceae059c38cdcf"
X-Mailman-Approved-At: Wed, 22 Jan 2020 20:48:09 +0100
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--000000000000baceae059c38cdcf
Content-Type: multipart/alternative; boundary="000000000000baceac059c38cdcd"

--000000000000baceac059c38cdcd
Content-Type: text/plain; charset="UTF-8"

Yes, your problem sounds quite similar to mine.  However, I'm running into
this issue on several different networks -- both wifi and cellular.  To be
clear: I haven't found a pattern of networks where this does / doesn't
happen.

Details of my config:

   - I'm running on an iPhone 8+; I've experienced this problem on both iOS
   12.x and 13.x.
   - I used Algo to setup a VPN endpoint on a new Digital Ocean droplet (
   https://github.com/trailofbits/algo), and installed the Wireguard iOS
   app (v0.0.20191015 (15) / 0.0.20190909) on my iPhone 8+.
   - My Droplet is in the Digital Ocean datacenter in North Bergen, NJ.
   - I have the iOS Wireguard client set for "on-demand activation" on both
   Cellular and Wi-Fi (Any SSID).
   - When this problem occurs, I find that going into iOS Settings --> VPN
   and toggling the VPN off (which then immediately toggles back on, because
   of the Wireguard "on-demand" settings) fixes the problem.  I do not need to
   go to Airplane mode or otherwise disconnect from / reconnect to the current
   network.
   - I have not found a pattern for when this happens / when this does not
   happen:
      - Sometimes it happens when I switch from network A to network B, but
      other times -- when switching from the same network A to B -- it doesn't
      happen.
      - Sometimes when I wake up in the morning (when my phone has been
      charging on wifi all night), when I first pick it up in the
morning, it is
      in this state.
      - It also happens sometimes when it's been sitting idle on my desk
      next to me for a while -- i.e., it's been on the same network for an
      extended period of time.
      - The only common thing that I have noticed is that it does not
      happen in the middle of interactive use.  If it's working, it
stays working
      / traffic keeps flowing for the duration of my interactive use.
      Specifically: I have only ever found it in this state right
after unlocking
      my phone to use it (usually after it has been sitting with the screen
      locked or off for some period of time).
   - If you wait long enough, sometimes the failed handshakes resolve
   themselves (see below).  That usually takes many minutes (about 4 minutes
   in the screencast, below).  I usually don't have that kind of patience, and
   just toggle the VPN on/off, which always seems to fix the problem
   immediately.

 Here's a sorta-long screencast showing when this happened back on 11/27
<https://youtu.be/9188GaszaLw>.  The behavior is the same today / in late
Jan 2020; I just recorded this back when this started.  Here's some notable
points in the video:

   1. The beginning shows that everything appears to be connected.
   2. At 0:22, I go into WG to show the current log, and you see the failed
   handshake messages.
   3. At 0:56, you see me try to load the zx2c4 "what's my IP?" page, and
   it hangs.
   4. At 1:38, you see me go back into WG and you can see all the failed
   handshake messages scroll by.
   5. Suddenly, at 3:53, the handshake succeeds, and now traffic appears to
   be flowing properly.
      - Note that nothing changed in my networking connectivity during that
      time, to my knowledge.  I had 3-4 bars on AT&T.
   6. After that (around 4:39), you can also see the IPv6 / IPv4 flip.  The
   recording keeps going for a while, but you can probably skip the rest.

Right after I finished the screencast, I saved the WG logs -- see
attached.  You can see all the handshake failures towards the end.

Is there any more information that I can provide to help diagnose this
issue?

On Wed, Jan 15, 2020 at 1:47 PM John <graysky@archlinux.us> wrote:

> Your issue sounds similar to mine linked below.  Do you find this
> endless failed handshakes to be when you're connected to any network
> or just a specific one?  I routinely connect to 4 networks in my
> travels and only 1 of them causes the problem.
>
> Link to my post:
> https://lists.zx2c4.com/pipermail/wireguard/2020-January/004858.html
>
> On Wed, Jan 15, 2020 at 1:31 PM Jeff Squyres <jeff@squyres.com> wrote:
> >
> > Over the past ~2 months, I have been experiencing an intermittent
> problem with the iOS WireGuard client: sometimes the WireGuard client gets
> into a loop of endlessly-failing handshakes, which therefore stops all
> traffic.  If I disconnect/reconnect the WireGuard tunnel, the handshakes
> succeed, and traffic starts flowing normally again.
> >
> > This happens multiple times a day.  It has been happening with multiple
> versions of iOS starting with 12.x, and now with 13.x.  WireGuard for iOS
> version 0.0.20191015(15), Go Backend 0.0.2019.0909.
> >
> > I can send more details (logs, screenshots / screencast, etc.), but
> first: is this the right list to ask questions about the iOS client?  If
> not, can someone point me in the right direction?
> >
> > Additionally, another oddity: when my Wireguard tunnel is connected
> properly and I visit whoer.net or zx2c4.com/ip, sometimes I see my
> WireGuard endpoint's IPv6 address, and sometimes I see my WireGuard
> endpoint's IPv4 address.  This happens regardless of what network my iOS
> device (i.e., my phone) is on.  Sometimes when the IPv6 address is shown
> and I refresh the page a few times (over the span of a few seconds), it
> switches to show the endpoint's IPv4 address.
> >
> > Thanks!
> >
> > --
> > {+} Jeff Squyres
> > _______________________________________________
> > WireGuard mailing list
> > WireGuard@lists.zx2c4.com
> > https://lists.zx2c4.com/mailman/listinfo/wireguard
>
>

-- 
{+} Jeff Squyres

--000000000000baceac059c38cdcd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif;font-size:small;color:#000000">Yes, your problem sounds =
quite similar to mine.=C2=A0 However, I&#39;m running into this issue on se=
veral different networks -- both wifi and cellular.=C2=A0 To be clear: I ha=
ven&#39;t found a pattern of networks where this does / doesn&#39;t happen.=
</div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,san=
s-serif;font-size:small;color:#000000"><br></div><div class=3D"gmail_defaul=
t" style=3D"font-family:arial,helvetica,sans-serif;font-size:small;color:#0=
00000">Details of my config:</div><div class=3D"gmail_default" style=3D"fon=
t-family:arial,helvetica,sans-serif;font-size:small;color:#000000"><ul><li>=
<div class=3D"gmail_default">I&#39;m running on an iPhone 8+; I&#39;ve expe=
rienced this problem on both iOS 12.x and 13.x.</div><div class=3D"gmail_de=
fault"></div></li><li>I used Algo to setup a VPN endpoint on a new Digital =
Ocean droplet (<a href=3D"https://github.com/trailofbits/algo" target=3D"_b=
lank" style=3D"font-family:Arial,Helvetica,sans-serif">https://github.com/t=
railofbits/algo</a>), and installed the=C2=A0Wireguard=C2=A0iOS app (v0.0.2=
0191015 (15) / 0.0.20190909) on my iPhone 8+.<br></li><ul><li>My Droplet is=
 in the Digital Ocean datacenter in North Bergen, NJ.</li></ul><li>I have t=
he iOS Wireguard=C2=A0client set for &quot;on-demand activation&quot; on bo=
th Cellular and Wi-Fi (Any SSID).</li><li>When this problem occurs, I find =
that going into iOS Settings --&gt; VPN and toggling the VPN off (which the=
n immediately toggles back on, because of the Wireguard &quot;on-demand&quo=
t; settings) fixes the problem.=C2=A0 I do not need to go to Airplane mode =
or otherwise disconnect from / reconnect to the current network.</li><li>I =
have not found a pattern for when this happens / when this does not happen:=
</li><ul><li>Sometimes it happens when I switch from network A to network B=
, but other times -- when switching from the same network A to B -- it does=
n&#39;t happen.</li><li>Sometimes when I wake up in the morning (when my ph=
one has been charging on wifi all night), when I first pick it up in the mo=
rning, it is in this state.</li><li>It also happens sometimes when it&#39;s=
 been sitting idle on my desk next to me for a while -- i.e., it&#39;s been=
 on the same network for an extended period of time.</li><li>The only commo=
n thing that I have noticed is that it does not happen in the middle of int=
eractive use.=C2=A0 If it&#39;s working, it stays working / traffic keeps f=
lowing for the duration of my interactive use.=C2=A0 Specifically: I have o=
nly ever found it in this state right after unlocking my phone to use it (u=
sually after it has been sitting with the screen locked or off for some per=
iod of time).</li></ul><li>If you wait long enough, sometimes the failed ha=
ndshakes resolve themselves (see below).=C2=A0 That usually takes many minu=
tes (about 4 minutes in the screencast, below).=C2=A0 I usually don&#39;t h=
ave that kind of patience, and just toggle the VPN on/off, which always see=
ms to fix the problem immediately.</li></ul><div><div>=C2=A0<a href=3D"http=
s://youtu.be/9188GaszaLw" target=3D"_blank">Here&#39;s a sorta-long screenc=
ast showing when this happened back on 11/27</a>.=C2=A0 The behavior is the=
 same today / in late Jan 2020; I just recorded this back when this started=
.=C2=A0 Here&#39;s some notable points in the video:</div><div><ol><li styl=
e=3D"margin-left:15px">The beginning shows that everything appears to be co=
nnected.</li><li style=3D"margin-left:15px">At 0:22, I go into WG to show t=
he current log, and you see the failed handshake messages.</li><li style=3D=
"margin-left:15px">At 0:56, you see me try to load the zx2c4 &quot;what&#39=
;s my IP?&quot; page, and it hangs.</li><li style=3D"margin-left:15px">At 1=
:38, you see me go back into WG and you can see all the failed handshake me=
ssages scroll by.</li><li style=3D"margin-left:15px">Suddenly, at 3:53, the=
 handshake succeeds, and now traffic appears to be flowing properly.</li><u=
l><li style=3D"margin-left:15px">Note that nothing changed in my networking=
 connectivity during that time, to my knowledge.=C2=A0 I had 3-4 bars on AT=
&amp;T.</li></ul><li style=3D"margin-left:15px">After that (around 4:39), y=
ou can also see the IPv6 / IPv4 flip.=C2=A0 The recording keeps going for a=
 while, but you can probably skip the rest.</li></ol><div>Right after I fin=
ished the screencast, I saved the WG logs -- see attached.=C2=A0 You can se=
e all the handshake failures towards the end.</div></div></div><div><br></d=
iv><div>Is there any more information that I can provide to help diagnose t=
his issue?</div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Wed, Jan 15, 2020 at 1:47 PM John &lt;<a href=3D"m=
ailto:graysky@archlinux.us" target=3D"_blank">graysky@archlinux.us</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Your issu=
e sounds similar to mine linked below.=C2=A0 Do you find this<br>
endless failed handshakes to be when you&#39;re connected to any network<br=
>
or just a specific one?=C2=A0 I routinely connect to 4 networks in my<br>
travels and only 1 of them causes the problem.<br>
<br>
Link to my post:<br>
<a href=3D"https://lists.zx2c4.com/pipermail/wireguard/2020-January/004858.=
html" rel=3D"noreferrer" target=3D"_blank">https://lists.zx2c4.com/pipermai=
l/wireguard/2020-January/004858.html</a><br>
<br>
On Wed, Jan 15, 2020 at 1:31 PM Jeff Squyres &lt;<a href=3D"mailto:jeff@squ=
yres.com" target=3D"_blank">jeff@squyres.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Over the past ~2 months, I have been experiencing an intermittent prob=
lem with the iOS WireGuard client: sometimes the WireGuard client gets into=
 a loop of endlessly-failing handshakes, which therefore stops all traffic.=
=C2=A0 If I disconnect/reconnect the WireGuard tunnel, the handshakes succe=
ed, and traffic starts flowing normally again.<br>
&gt;<br>
&gt; This happens multiple times a day.=C2=A0 It has been happening with mu=
ltiple versions of iOS starting with 12.x, and now with 13.x.=C2=A0 WireGua=
rd for iOS version 0.0.20191015(15), Go Backend 0.0.2019.0909.<br>
&gt;<br>
&gt; I can send more details (logs, screenshots / screencast, etc.), but fi=
rst: is this the right list to ask questions about the iOS client?=C2=A0 If=
 not, can someone point me in the right direction?<br>
&gt;<br>
&gt; Additionally, another oddity: when my Wireguard tunnel is connected pr=
operly and I visit <a href=3D"http://whoer.net" rel=3D"noreferrer" target=
=3D"_blank">whoer.net</a> or <a href=3D"http://zx2c4.com/ip" rel=3D"norefer=
rer" target=3D"_blank">zx2c4.com/ip</a>, sometimes I see my WireGuard endpo=
int&#39;s IPv6 address, and sometimes I see my WireGuard endpoint&#39;s IPv=
4 address.=C2=A0 This happens regardless of what network my iOS device (i.e=
., my phone) is on.=C2=A0 Sometimes when the IPv6 address is shown and I re=
fresh the page a few times (over the span of a few seconds), it switches to=
 show the endpoint&#39;s IPv4 address.<br>
&gt;<br>
&gt; Thanks!<br>
&gt;<br>
&gt; --<br>
&gt; {+} Jeff Squyres<br>
&gt; _______________________________________________<br>
&gt; WireGuard mailing list<br>
&gt; <a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGua=
rd@lists.zx2c4.com</a><br>
&gt; <a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"=
noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wire=
guard</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">{+} Jeff Squyres</div></div>

--000000000000baceac059c38cdcd--

--000000000000baceae059c38cdcf
Content-Type: application/x-bzip2; 
	name="wireguard-log-2019-11-27T200624Z.txt.bz2"
Content-Disposition: attachment; 
	filename="wireguard-log-2019-11-27T200624Z.txt.bz2"
Content-Transfer-Encoding: base64
Content-ID: <f_k5g49kib0>
X-Attachment-Id: f_k5g49kib0

QlpoOTFBWSZTWU8hqKQAYaLf0UAQQOd/+Sfl/wq/7//gQAABABAAYEq4AAdqgEgA8CD6YCdUKV9a
SBUlV3tcAB6G9muN4Fcevey7ds7ZR0OmWekt0AAKVDdeteB6KKKjdJwdUFAoVnEwAABwY6d0UCio
DD7joEgh7x3VFClIDvo99ffECSQisewHIAJAAAziABQBQgpA+DQkAICAECAACkKCADU8QClJKRkZ
BoaGEGgAyGQNBFPyMRKpVNGAATAAAAAAAxHpUlQZGagGmAEyGQ0xMmaAAk0iIVRTIATRgAAIYTTA
ABSlAjSaJPCTU2UT1PImBPUBjKeSPFGgiQgVJoqNGRhAAaZGCGg0AH19LmnR6PNef+mp/HT8+jUz
/MtNrUqtpWpU1bStQDRqAaNAA1LbStStW0rUA0agGjUy5abWpWlbStSpO2lamXLTa1ANGoBo1ANG
ollyK0K1KnzmLjjbw1ObeN44N4agGjUA0agGjUA0agGjUy40szHabWpXbStVtK22tQDRqAaNQDRq
p221qZctNrUA0agGjUZAwagGjUrdtK1ANGoBo0ADUy4lmZHaFalaVtK1ANGoBo1ANGogNGoaTRqc
uG+OOLw1KraVqZctNrUA0agGjQANQDRqV20rUy5abWoBo1ANGoBo1MuZz8cacNAA1gYDQANct5cu
XI5cmoBo1OE1bStStu2laABqAaNTLkVoVqpNW21qZctNrUA0agGjUA0alVtK1KnbStQDRqPLiWZi
eZjWZkLbC2wtstsLbC2hbSW2W2XuOY0kgkSklbb8EjCLDTLDTL80y2mXlxzLjmXG1W1tVtcmXHDL
jgZcamEkmy21DbDbahmGmYDaCbKRLCVLXK4ZllzHMyy220LaFzHJmUltlzHDMsLaW0uY5mXczAtp
bbbLVststoW2XccMy20LbbbaW2FrlcMuOBlxyZccJh+O4GWktoW22hbYW0tsLaW0tttltLaW0LaW
2S2hbZbQtoW2FtJbSW0C220lttttl3HIZlC1bbbbcxwy425bZarlcmY5WtczKWqtlttVVttuY4Y0
PJILMTzwK3VoycyXngQtottBNltYtJIJzFWeEuZUz4L0kTKmfDR57t3F34ML2y+qkVVUzzMM/LmG
WltLaW0tpbSrffd89hTvaW0tpUVve73oV5VVVVVVVVVVVVf8fwJUk/D58Ny/jmfrf2wkPoSQCH/n
/0oiqqqqqiKqKiIqoqKqqqqqqiIiqqIioiKqqqqqqqqqqqqqIqqqqiqiqiKiKqqqqqqqqqqqqqqq
qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqjCBD9c/SJJIQPzxVMypWZJWZRGZRDummi
Jh7hT8JWlLbLJTJ6fqiYKYRPpxU7kU1FNJFZKwlWEUyFVyKaCmgpkU0FIOBTr96e5QenrsJyn9t0
9op9kU7cinKp2FOaE6KD6oB+AEhYSWkMBAYxkiwVARRBFSIIQYMiySIIqIgqJBkWQiqqqqqiqqqM
kFBIxZIsFQEUQRUiCEGDIpJEEVEQVEgwWIAkgTCAKERF2oCfACmKqLckkkkkkVVVVVVVVVVVVVVV
VVVVVVR9AkOQkZAIUkhSQkD+tCdKpwKeMqE4Ip8OJVOkriUwU+9I/RUupE6ETzIp0T9IpyKdSJqR
POhOVeO8U8BTj49E0FPMLfKKz6vSVCZKeFL9nx8/l8vp+n4/4888888888/tlQnHMPflUyU2FO8B
LgAHcAHYifeKbpE26bZnU27O+Y1YdFH0PzDdE/Ibm/NnfX5xZ43r18zIHy/FectA6yPPRqM40qrv
uM5yz20goURcARGgrUN0oaYrxkJlTqZJIt6fhV4T63V+eXtfAgQdxM6LlbUmOMu5OVACJFEB2qkm
QLmMIGtEGqLmEnicyttMZ4jPM+M07yfJ1NV+SWXjOZegSD3bkACM+OSeM7b9zbfrwura3pp15g+L
xqmnmIa0p46xcxd4rqzfYEgCYGU8uYvxh8+fF8WmD96QLqKlSSWKECdJrxyk73Si8LRCwYHmvWYi
GfFzyg5d49wwe2p9yrNNMN8mp7u4YCFdGZ3uN7nlpqL6nXFPFQF0NTk5AzEA/bd6oqK9UFpevX7a
ObASKX7jwr35Tzg1YcxpXcfOnx7xs7tKBDNgDqB2Y67Qfq4OaOWdpCrWPlMAGc98VMxfij24TrPT
vvOfXQd3a7mIigVrS2YPmxMOKmWihRVeibK8SSdrwozIXrlbfXrgacTSu8zF2lFDw33lqLEfXtvs
azzSzPK2yceNeJfTE9NnTZFOEK9d4NoiHPvJpLw0Bkws9JpTvpAtxGQJD2XLmQIkMlpiEAg83Kjz
8G8Q++s85nmXx2pSKG30fWYZrBesOWZ6Uowc5dS9PK9nuPFT1e0nyun0CsfrTPDZ8aUvK2qJPqc9
sxmcpV9Tvlnz1yrngHh568UZ34N4up6iwtvuVWxNT36nIp7mG6G9799kxBnnaqimAfDMe2mG1t2z
y/GabzLHohvEok2QEvQFVwLEOCICo2jooQMFF+GXOdyhrDUW+Q7O+nTLqffY4Izr6v11QycYp6yQ
GSRiFbhZmiMiEY87xOKw5Dydv0bQZ89FCxaF4JBAyMjESYQKDkUVQkgGmCnhQ9RyBxD3w4Z3zh77
k+ufDxRWeL10XmfF+9pr1M98zgJrCOMlTLuK9aOm5BixtyBklqxBhNE+8Fl9pWHupv3MPR78Wjvr
H5LqO5liwizknIm0KKaBzxJozQIYJ0TdwEUmznbWHQ+o01vvuZb6zBKhdp3v3mzdeNnLa0436Kum
esPmqmC8SJ9ZEw7rymAgnRL66wzNTKKKdKVIhcKoyGYZMHVSGDNLRE0TbLXWppPrJZcZFhPwAs+t
979umtzW+7+xytampU+0zJ2Tn3d1yDD52q6k63IyZ2m9sLbULlD06bl/eHgAI4nKc586xeVsFiK6
TyxR9zibzNcSTklGCQeUKuZWRT6C+3ZrfAAAAAcb6pYkgb3RJo9y0Vjrqv4ADwHzJhd9HOPjAPtV
mTyoqpOCjkQCCbN5WfbgWmcKjJG/bfN1BnIiF8PD3gNyKKmtqQaELxEDXO/fXyyt42FuEDvJcDXH
I2g7yawUyVOw6OKBlx3tcyTX3h4eGXqkXA6LPCLY65Vc53PpgbmblVG5kQoxx5WEJIjUIyoj2Ny3
TmO6cVWTGZhVHq6HZjJp1LEfAe8AMQ0y7PtzWDSCS9thARXRswPqRkTMESWRVXNcW7mB2Ddt2L61
lqTNj73h6wPAeBAHvdriyIgQejJgDjXiST9ePxzqj4Dl+KeV94Um74fTcmVgXZuzsQ7B4YkFCu+H
ve993LvhtwaboRj9tIYQZ8g4swogiC5pP0tfC0PkdnKOS7lud254VC3ixfw94AfCcVVwPT9NFSCF
EffLPog1MnNQrMyMYQlY6N8vXpBkr1drmIEKp611nbwKlu/js9nb1ZvfPkFF+YqEgIKSCopEyoxM
WJlGWJYwYyLGOV73gNx1+WYPny4RUfn4Td08SfrLKWOS2KdNClRNxJ8jcq6V5+LdFtyIYgSZzh+e
AfMUIJBCAkVjFSHM36/p3K126waIlwd/KMfSqEPYxXMCMiJeuVkNTtSLEIdIN6lDtquutxigzdjZ
FqgOw0mT+2i8m0DdBZ23l89S9rxdbVKxT56xtxqy3jDp82xZbeZt0Zh3lVrCLuZVFG62y8qcBBOJ
FOEh2pwSFIFCZVwSyHyQ0ihkwFQslmiUHlhUwtMiFgLJjsTA2aFhmEHQwowEQyJUmiSzJphRgg6h
iMwuRgiFE1g3bTCfkCBD8s/NYsRiyKIxYsFiMUFEZhAAANOni4TEKXMkmeobNphuQmpLdNRGxFYF
iRaE6RKTCJcLrBLMUqjIjRtGAkzLDiuqmK7pvG6YbzCxQSfEEg+H7n7g8AOg+ofpMZmfqv2+/abn
us86NBiBhFnwkk+s+6sycoBzqYwiIm8QKrjcYYW7mN71VgUZeKT0KJsv8HvwgAkeAJHmYYZTBksZ
ZYTM658QAarw936HD9X34umDN1fwdqF+XNK0CR+tXu5WR7BWDBVIvl16sr2WQqXteMSX3dN2nhjP
c+Lm+T6inzAYQQkQkAkSMUJE8T4E+APgA4oUzWvR9H335c31Hr2NtdrFkz03pyoxsgxE8U52ITIG
zFZ2X4jt4KZw77hXL5k2SbPlT5gkgsCCsgwUZiMGEwZYWYZispdnbciF/XI/BPPj6zl/g2PAtCrd
ZO4vXCAy9wfijqdiwZKyZuOz2ekwdywiTxFcx2SnbPXvXfEzKWZKsMSzFkVizJiHgr+N2PwYeIqv
wV88rHdQJD1gat/FdBclV1FO7xHIWXsDjRA7krCFmDi7RbIrYs7e9WUa98d7Xqz5PlIECISBGIBG
AswYZmTKxBmDMqTN9Kft1XvB9PfbqXuMflyJmPyP1SSfcuu926QSu+Rir6afRDiHsVZzNKqQ0dcz
UMK0tnvaMx4pO9MqspZGKMyS7+Hft27aa85u/JiAB7wZAc1NjqHgAPYUfjpVTlSPykoo4ppCuhG9
1QplgunWwOSyhLGZsDru8zyute5rxZnw9+H3h4fnqqc+n8+p99A/DwI3qv5w/SmQILFWGLFEVHuU
856I+aQ0Lw9tguR0VEbUxf3gB+HwE/Cyfnwj6MfypL5eAAHvnDn81mgiKHVGt9DXRBAehbEhxmbF
JaeUK9zXWJmN+AHvD80AAAAAIAej4B7q0wT7fvvkxVZdTsswiEZMR+PzIR072u9yTMzPXzKM1Xr5
LNQv3D5RF/rBBPpyLBItfPwHvAD8IgozUaqNS/z4ncmMiP17yUFSLZ/XTLoQa2odsszt4+nCcBhK
4y52rIy+BeEbupBOb2bUlHOGE3GOcLznudA9gW8K7dObXd1KlehSaa7Wc465wy7QUyy7w7FmHaBI
vStLFi4dUxGZazbfc1nJ0uVMwTQdbKIctLINtNdNMLMDFdWUDTDVmWGRcwKS0wQyCVppGICW8EYz
YyuAzTmkMIVMINwLdCaLNES8KwwctKF0JUQlAxrKYSjoCn1Ub+4ABhzhJ3tCb1e8kRk4lQeGl0Nu
XCibmZg7aFRi8WIsm5gMKOCwEzWBuWnNHhoimUjjqlMkJcIQar4Renyq/V3II3QvfEfygAAAAAha
vrRJ/ZP8zY65Y9VvZrrk7O6DmbXb3/1aNXkTjzH04jKfXWE3Nd2oEDwHh+Ae94fTET9IeS8K6Lz4
0Q7zWLiBtifuy+ubA3qTnUHUqIFYTsZip52OsuSJM7Mi0za6BKjCDJz7wHhoIA91SPtMcRhD+jQ8
oZ2qBK2EhmVeB0gsycnYcU9foyft64MmefDsjhJ2YjZOoOtqgpFfAAACOcZcXm4iMN/YdmPvSR0+
10wUfORXSIcSrJmzfTa3LtHNG9K4TEm32LPveA9SLX3c/gKnvu2FQZ9owq6bs3EXpn6FmVtc4BtW
5xk4MxMnSj29pJc2LB6NBgZRz4e97rahLTR5jdijWRghkR8SnE7NKqPg7xzDLGnQri4mI1PzlXH2
DTEiuQw+G5tdGNsdggGjGtkkfDw8Pqi/qWuiJPqzvvp3UyOYQwJO1jpPs5296LQWJCDbiofRGJ43
dZEQt6cefD+2AAAAACPD1PFn4rWb9FkGPoYaq9erMgWtrBEUV+RqhwKVgiVUQtQWqbvpS4dXOtyO
+94D3snfvj8/qX4KQsKHovxFVARsWh9nSDNeXU7juEdVfZzjrsUMn0GYdH0A70VWDKELAhpqamee
Zh+HgACpV/Czsnq+mwYPx9uSwYgHU75hnIqlbYdivxWiI+e7zMQ0nwKiyhwltEyqenNc/ADwA2eV
3WQ5OmiVuK3hW7mXYCzFD7WTuR5YoXebp7QZcw/cNS3cNY2ReyyoLtmmxNxMgxwDOp9oo7gBnYtt
XRKHaKBV9g4DpnFgO1s4DjDSLuLDO1Y+eXpVs9lZdWhe64efXPqlaVgmgilkBsMvZYY6ooSyqFcC
cmQqm7AnLzgGzaHGTTEwMgW2ThUpdERTIoaiU20A6yhLUIRHDVlaU4gWmusY0OGGmR7he7TdxTu6
5hqK4aKK0NQI5ZlrmNDkA0m5tiJOcoZSyG1whx0y7Xic25sCSQTWMM0Eg3rWi9PyJf1nzvZj9MJ2
Ef67pDvVF3+s5u8A8B4OhlvT1nneobbmZ7UIrNWY4rpcYchwV5Obc/e973rV2MzcqYutPosW8Y76
MDXqXCqxTWSoObNA630aqex2SbkFS8zAIyrnpk1WGp+HgPD5n32Yfsk1DxjmOO5afsOxr9ZxPbMu
jOn6HOt1FDDNI3Swb0LKQzLMHlsfeAAHzr7rnMqxhyPykULwXCfwFpmZ+JDFxuex+ndgemu05iAP
TRakZsDuqpn4e8OngoGuA9nGo61HDJmvUXCgqzEXJteEnzuTGfW2FmC7PznNo89nXAopLNXCH97w
AHyifvo+EuaApLbM9vggPxKP1j0E5Pembp8dhuSLuwtdiuo+8B72xG3vcWaNP6oo34YPpv6VK9NK
CMSk9G61ciiC8yKvmNMHyEN6bPXVbTXGKqh8PD3s9fLctT93Fkg3kwX9GsRjgUzLkgrBJq1SzXCx
SuMA092iBxscOHve4L6p7VClmnifG5rOz7VPbvRXu7dyWcInpLooiUgeRg7OE30bavmPgAB3sJmb
vlFD4iupg/fehveyxHNMmSInRfG11Xg8ADHEK0La7fdeJa9dkkXj5Bd6UDwmc+8PBbG67OQlq+dz
OZiyhdRacMx2N4Np7RKI3qiVIqsrGgLWzeWVtHVz7cBvKbBm7M3cw8YXdEFDqZoXcPx1ptnuFvqh
kc3qLsQSrYdgGi+vsMrrVwPkOb0DO0PG+NgWpFiDRQ+gWJZELAUDEnGSpDiRZON4WEYmhlgYxJVD
bF1BuAtwSEEYwP+RBT90EE+14JyuQOxWsJZWX2V5BQKaJkRBpZQFTeUzJWLJ3MluwUVRmsLmJlKV
hGBybNzTJ+QAn5OGfqVtxuuP0ctbH7K1xplTPYc5x01FkXHMvBkIw47VUodTvo9W4JmfvAeAuDuZ
216Mobc25Y+nfpiZeRS8RPWKR2Q25GxErJ7g0R1qbVao6JcUo2o5GFEZuhQouvve8BKjOfKNxzzi
5nsRF5NvWpo16B8LXdoVVu2FvBTsp5nk+kMmekuCA+4ZtrvYAdCG0JpMcfveHiuj3QtvKBjuj6m+
0XBqcny1r1aWastqjlaa8K8vLKLZVPnT7z1iMXvU6GQ/gAPciPMjvkMle3EdlkGyT4g+V2I66w79
bzouBzutkUkLBY7WGlGRWTEDciWqarVE8LxzythQU4wS5d7NcCqVt/e94DeduTZlIb0TtV7rQsi7
WmPt7MFeJy+apsWRR9nBM3yAZqMcqphmQZtZg7uMBTe1AdOe7kJkoizWcu+Gdo9hxl/jwAdfWR9W
vSvrL40kBIWq2Pq17Gc8unaXul3nNLeINl5Y0zW4d6KF8V7TqszfVlKJbFDOltU4UNUHqMV94e8B
g6kkvuQtHWBH1MdMXmVByV5/ZSzFlrMZhTd/Sr1QSFd12jJiMpqqZFeprRx2jWqJ6Ov4eAGS9KG9
9ktzLIVeESn8g/gvjRqlyqI8ql5XY5JeF4AuN1O3kBnP2Wp0v3nQ0VjXUulbFV8B73lP08ljztpr
5a4ukNI2MaOlNeR8tCu17ClEQERV14zR3WWfsrlUF4Ojd6djynomzD+AHhESOWYOlS5rN6KMiclD
MDiNRsSXmxF+xYa1NnXWbmBWLLcArWr65WLFcw2Ja01w6+6nuRbuvrGEIROog5r3JINstKMwwDMj
QZ1Zqyo3fee36UCQ2S9hQKFlgdeIetjoOsDZlOJWWNSGnKTZgQrCAkocxs1AyxKCAkcoSlXGWRIE
DUSkykhqluKjIDUQqAVFUMZcU+RUjULkM2Ze4UmrKTRmA0uEWlwtyEvDCmlMOR1xpRkvM22NhUUG
JDhuY4ZnGm4TjMOGQzFpNutAQJM+AI+H5JMSyrBf0fF/fiGSJDfUyQTF1hyNK+Qgcei3cpN7jmPF
LDAPEWZh5AqqoyDF1Fz8AABvOtg1gz6udZJf0Zo1UGNrqFjHlwDe68Oyy43sSTcmwKsyoYbuk9+8
AAPVv32ZtRGv4/GjAQ1fc0DexJGHoyrRv73h4DOpS7z6kIGn7EaKVK8QJtfKfkJw81iY26lbl5eC
q1UalVvWOTqKp2G7XLN51W6XxzGcv4Ae+Ak/HTO/R9E/ffZ0igarnkI6pjNqQrG1S0LuiB0u608q
LrNJ3Juhu0rojtSR+8Pe+sjbKDJXxYfTC+hqqBBB6FEfUS4yR2wDMZOfR70BQWJubUnIjoVjokLQ
aqE3LXYOcduzlT8PeAEwR307Fr5qRZAoiA7qp2F74K0XpCinpmp+6J0xcMON2o0wZqT7BOpDoiuy
itQcxaOSiDE91fD3h4d8MtCavY+yogZcFTM/fZzcDkkSoDHQMtpyp7h0zmdljhVezbnPh73gO4Am
D98vjMPqE+0TtL5Zt2Q2/nl4uYIYi5TU7bDzb3r6sE8lwhshZ8B73uv6e+smqPoOzPUROfH6IIod
MbAtUhINdxkY9bjOoOSm3c5LRlYI5yxTZ+A97s1FV1fYN66C+6EorueWMYQubxzyEm93imgWMt+C
npjvfe0XIZYVOyhftVzbVWlg8uXe3X+KqpyrfPMMWZzXs9WpjIeykE+m1tdXdszqkOqrFrH3J8Mt
7E7+3K5mhdlFX2mtks1oYqZ3BwHewYM1XHjjxTN3pLlbOvFpq0zCh1ROInVy0lJfPnbm87ly88Oe
YGBBOz4o4SCMggkJPWBokEZAboYXUtMdmiUpveTV04GWVygyulk3jYbRkOMwwWVUgVjqRsL+wgp9
dWCCYVsnLBsphoTy5kKKCwpwqUx26kN4cN0wd3dOPN5CUWUZxIpdwXLkTDDYJB8iXAPveEeIIj9K
FxEA1yT+WT+RuDEB80r++bo5pvWD1PlfCb22HFQ8sOKSxdmf7ir6q5m1jtcuSEaXOYb8StOfsB4D
w/NB+x3F/VRM53A/bUs1u8ImtluypI6VVxzdZZra5hZ1vNAHvDu6XGL2ElkQUkiLcuSZgFdZZ94o
LmKN88C5lkqXWI5VkSRx8aRtv1xLqUDIJBNzeZvAubfflxhFvh4ADy+4ER8tNu2BZ+Rk7cKqk1iA
t29j4p6S0NSD7JnaGnJYysbzZu5uJYJqCN630WmcOJtHijZAOLSBFTHRVDCkrS9BZA7Jk9jszfcJ
zF3HFsvv+YA94d8KXfcp+SFTL90hTakVL8TFrUu+XhUFX2RrC8sk1HO6cd6pnp54S2vax3Ox2ih4
ZLp8eDYZeZ5zZRpDJQkoY9vH3Pu0dO7OO3uxzfZFPHHWfTtp+vV7cysWuDajlcHUtHW76dJylEsO
U+iLIkZEqIvkYjxxVBL0Xk9qHXlqH7Wj6xA9VaL5qXFsK3roiKyNTnYQzWd1RIjqTaVbDwjBKwnj
yP1j68d2OzO1dU92fJ47fPgBK5q98Ixqh8VNNubFeTF2SrDzd2Z3iDDViR4vKzdFjPEpFXlNIUvL
KES9la+dtoA3oXGEi8QYTcCPriNE2Rf2O8sBHTi2XFSx7DWDcvdSmZjkL8W8vQr4UaNcAhYF3sps
zTl2Vx4T4SSTp2ogNH4vKTFKYrGZdCLaJNhdJOC41r7NTIoi863vi537ftve+T2UGJRErZMklLHm
6GTnAmbQZtBljZHN02clLNBmHpwAAAPy553wwBRwnMKbgk2KqbIUhkBME3Z5dYCZwzNgNVaYoLpB
GpqPI9VSVmq5WISSuuiFUKkggQJDQYBA7HY+J99CyfXhJtfTUTWQhl2YRgiefRLEwnvV00XEHump
1Seo9LqgRsOZzkqab7kzUOy/Zc0u1LmDczOG0xENy1XZLPR6o8kGCTxB3xyh7PVMoWmeoiqidizT
lBSFCLBdH0kXWRXn2Xvj6uMZunL6sHaCTBuztJ9XZpSLErrNimy60bmHuixEochrNPtuIEPRTIiQ
xkU6NQcGdWDt53MSjFc7zqF9O6ak7iBQ00Q4486kXiEHw5PYCIwPHhkmDPdGSNM9QpqHop7pEGHk
E7TzLu8CduzgM1SL8sr0UFaEIJK72+gJXmgFjez1g1y6r7d7V6ubuUd3UtKrxwNz3ueCvdSxPgeg
8CQehiemoQ2HnWw+xrNTw0sihL5cb7sCaFZuBBiGRR4Qoet7IanOOUJi1rmOXbjh9Tp0DQ7E+PH2
0jZQ822tqtlKmajt7Dtk57uF4hW5p4XI43Mbm3o3OqxPWo5xfTTjIqqjci92NsXvUztPob7tR4+u
HlkTt9M9ij2DLuSOwhlt37OUzpufE3DN02wiOM11Yo70uUdpcposPLmLNZ2EzOoXwG5tPKZ6Ive0
fYMlrgFg3XcmXAtay9VDjMX1tWyCTDhIzMddLhrt4HXqc9O5ytmBzng9YTUqwSwgmiIUgCHNwMIY
ZwFmrYYZZ7+N4cp0LksgKWifQJAE83RTmGmGaekxhMrhNDFYc15CZhy5uUxwy2UDmlN1EFegPyCM
MwB6FBPk417X0HyOGEhXxUdLApC/UEkvor6Vi7xNXE69j2Xz4vZRrc01fTsPZPSx2DScz9MRGW8H
PBzdT8vjg87xVY+KY68AQ7I8+LynJpUfveDDPWBap8Y2remaiCJ9qC5RHVNXtE0fD3tHXiyK6wPA
eDkrls7lzolRwqItM1BsGxFtOoN3TppS9qpMYLbMYUZ1IhQWYjrwMy1yee09Vv1C9rzlh1nNpjb3
tcBXdWhaJEOT6j4Wl6p9GXZqMXuUKToxyNW6Cs0eHvACgfVAgiI0u65VteRKvGR2Zc3qDOR1VVYD
b8dRPi4Zm5EKgHFK3MsdcEkUlpFEkkcg7jxLdzsCKqIo8IEPVdgSIZt16VfqaQxrlCq991dSErrm
dodv2wWFeFbTUnp4uGknggvnto4htIcQIQTI7kGaME2KfuPZJY1bM8GY2JyLHV2mWs6OwY8F7Utl
al59sz7M6/kKGD3PpcE3uhXLmpgksVuN6c7umy4fPQk8eDsu5q+yaucRxSFgcE4WOQwjDJsiwfWW
/Cr5JL3HfLPIbB2KGwIMzK6mjZPbO6z5du4H3dXF4PcljTvT0ypsrpOBve2x3yIoL26tCs4Pe3kK
17m73gz6RYclYp4bWk1lERLAaAlZNpbQFuPZ21uCwuzlfA5c6oL7scKTgNrOaC3sW7K0APb00zBT
xcFtrON7BfZtHOUGnRZq+fVow6mGdx1svOCuwlJY7Y9undbmtrKPJ3Viumr1rXvVq8yXd67zOAou
ySKhJN0KxkpxYI1sislZEaWaE50VBQkx0FApcQR1GabtEYJEFagCaii6g1ADAiOmKWEQzKCgykti
SCBUOz5xAAAKwhFN8wFJk8MhxGKYziODymnChZlw04cYEVVwr0t1F16o2xYmhKxLVEtWam1OHOGm
jmXcpPIEgCB1hzTpmZUGKdFfRE6CrqkJUtXUBkj5WorXBFr7dbzJVx12ZFqA9fa2a8c1mLstu6NY
exyxpvYQN31+mrkmyPNlSOmbvZS5LOXTejsnyVA9hrkD4e66IbzEttYpadZ3Bzu1Ig8WU97dyxcI
GVBA5oPF4CCMVQgTAevcJi63ig7upyoznxx7CW4OWOC6dCOU7x4xj6nIkjrJvI6M7d03thwdj2F6
EpVdyy6t5o0i13HBeRrFvi5QxvKOscrpDjfUbyWdNQhc1bjzaAXKyAjHWwcuIjacnIbcKFW6TUJ3
EWI42DkQZVuGHUJw33sBwzy7ySsfLN50VgubaFYz8NNSJUU73zmiitynueNDAHhjP17SHabGicy4
6A9rnqVlyBxwOFy7c5XenJRe6uvBu2MnNnkfYa0aFnV55caIemZGo1ovPau95t9pWmLqdWd4lCHu
xcF7PS6CZJT1MePCoBLuqELxyDJLku/SYsDHV00yoWA9EDw94ARbvry7BcTUXs232vMxze6uJG1W
JHz636piuuvdTfEFJ85zHXSvEoiD2aMumRhr1VFPguFXnT4D3gAuHSvRMdAm4qXfHN1aim6IiEM1
BHoxYe1SFF6vE+bpnLr0V+Hhjhe73qMq3Vx++T88squOk4oyOaUKzgeWrdonJhvpgkG1cRZ3pdLV
pljHtHYwMU5Xdb2JE/N7bEJVjBe7cXomLGbeuooAxhuI2wY0xnTBE1p58dNK2s2mb7ZZMVpDWO6W
sdvuW/K8O6Q8gknWQRCyIQYWziQwGE4UgsFgGZophKvLDEhxIc01uQtCwsyG4Bw2UDbSWbTc0Asa
hRIhaCSP3D84Aprn03XLhX0rKzXT6lD+HseXPxr01YfaYIJgrkw+iedIihhu7MR3Hcl9DwFqt1hq
soTUAbXVbwnNKxoPsoJnTT7abvdquHW84Y+UxqNdK3QDpmI/cF2WdNbXZilT6SattXct9RvPh2XC
Tu4MYD67OOS4tceYyLHbhBs4iZNl1mtqtq60PqicW8lecYg7WOJnjEeJm5OG0pyYq3rJmb2ACmxe
mGwsMYXrUwKyitgW9O1s7GRP7Ljs8jhJiCS8x1pTyJlrnEyMraEDC4iHagHLN2svQzOCsJZr1vZd
66fXnQFGnUmrXZrhWmocQK23zEbWktqOdvaM7jWhzKdhkcz9kp722iqyZLfbkVuDtzaENW+LRF5i
k7i+TgSIN5kVucIyuVgXw7jt7t6o8AXWg8tbmDtR3X2W3l50dLGLxnDu21QKJfHNjWvLGALvlojc
g6ryas0d0s2ES3JAU7dZHjRW5XdxGFmo6beYsLQkw907NYm4liVG9ZEfDtMDW3CJ2JS7aaOhyTci
dp3vZ2932rFhod2ddd18OWCblWt2wz3HeC7eGly9Nrep9AsrVTVkE9cSD75w7y2lr7RTid9arKcO
VF3WxnQ5G23nHI2azG86cplWN0HBNCTDaxI6shUr0K3CaNM7BzNqI15YRQnLu7g2bZA3JbutSJy2
tewZGOGPcdGgWHwe6xm1Z7NdiPbfAZ1NoPqg4u6Ij1vZpeAVbrBtNRu2NxhgZVzemd9uDOLyC8w0
ZSAnJvFiEhdXtl31iml2zZC5e9krIJmUX1A7qFHWrp1lrVjWx6ev7HyJpp3tAtzaBgnKuq9zC9mV
tTqu4TL0itg109GnJQu+6naJlWSYi8KzlxvdqIwHD1miweFxpS8ZgzewLBDv2MDq6xT3Ns5txvdH
FGgZdIjLe27LTBMOisGjeO5sp7MJ2cjuztkoQ5Uwxzjj2hAk+yzHazlnCupEXofQUsvHgGHL69wa
M2+IGO4U+jlZjK3Gb5ZmLN9lex+e+M7GKNLBteSYGsXuEI7UbVQDNQ1C+LrNOjry9eXV7omgPTqm
YDwU7ilmhpZH1bJypDeFbkh6AF4bszaHUXRC19WYOyIX1dnDrV8+1TJu5tDM7SrBNHbuKQuzXZav
ddtbnDBUoPdEaxCGsGmPe6SgDuR9dbG82HejFSWzjBCtC4tyjUi4cz418HwcnjO69fd7z4/l8ApF
AT+IEFPkEEwT6cPg8JRdJ8Pvg0DVNHQgSGzHs03SgV4YaLB92YHBIKGCYaqXu8heHAOJyeadORJR
CxA/ElYSiQ7MA+Ghpg/PoyG01KGDJyQRKCQoiD1o28ESoh0NIGsvYMME93BI8VGSR9Ramt8OSXqd
DqgUxRfO9nihId9rIJZYQLZXnlyuhdXoSjbuvXIpoILbp7s3nCrnGPA6StQ4YJCKY8DJ0tgcKggU
YYQvrJpqiocv2uFitNENnsOeE8VVBoTpC+13igaCxO5ZEIbK9W7J0Nh0MCTokV4UJQmQlHN8ZAk1
zRmitO3wVugoTcIRXkRsirTd3HdQrQnuaib5OJiC1CRAvncKNc2Jzx2g8Ha1co5jV6eheb8F6EhD
CrPeQmkIdUA0bwtmzxXEMfZ3vijZrSpRvjwoTB6wE8EJbFDjbfgyad+73s2W9JJGKeDQShd1m3tE
svYe7yQ5aHQs146ztaBSUHHoUTbfS9+tLCBB713A0HL4JUUJqb2hBLm9AoTfTlBOZhbWp3Ka4boE
9XOzhXDzCitBHnL5LAyNUh3PMTOG3KqzhDfJs75sPSebargVvhWjuq2VdFt4Z7BKIM5QYFKrSDvO
2JxhCnw2HQhcO+rqhHQlKd8pwIKaiJxipV9wMBSZmzO8JQCbOFVbTUW8PBjtNAvWCSTVDUCQKXn1
DRV4kLshSHPF0hfhwPYw0yZmw46jyo8bC7qaeeIhRXvGzHll8J4hrLDm9lpgS73nfaTL3BLhkww4
Ynfaww9xWBIYHmHnpNPHA13ZWUQ3rleYydo3NQonoTrwOZ7RVnTro2aJe2feb2XgPHwMsucMgYrw
QhRJ8nweeNGhTOTdcwaUvs0oifDIZt9xRgZzs50LmXk0TJ3dmRnUxOHcYns0fWfe1M7xoeS02E9m
JSVDNTfUTKdC3nQoho/Zvpw6e6I2Y99iYWe8mrKxwMu9QhTxTrfYcyGncFhRWSdvFe0QcSD754d7
h2cm1lcNkPQpqdp03cIadcwx0FCuhbJDB8B7E1uK6jhwM0F3rXsU7ytRAB0J0OS8DO5Xitbu+K4p
WrU7CVjE3wLdm/eJrl1Urfe9HdFsvgZzbKcCmmoTkR93wlia5QlHIpc4EBmUBooG9s44Jd0hObB4
xU4wS2eQhRx6Sq94dqFQHmHMC8fEXdPntaqFQx1yHiR4a3wYRP4fORPtlQn2hT7vegaRT8pUJ/Sq
qq1ol/IKYRT85UJxVVVf7imoDIp+yFN/oIp9cqE3RRdRTIVX/FVVVkVLpKhMFIPdemCgsFAWLBQU
iILBYLFgk6/fVVVfWKfvoT/OhP3Cn+FCf2pvATtFfwlf0InUTaE98JzRVfvlaqpX/fUU2T7lTKIP
sFP6ininZFNopx/qSTj/RILFBVUiMiwESLFIoIiikUWRJCAosBVgqySLIOC8hTbsmVSv50J+AmnZ
NRTBIsoTQUwoT7CKaKmtSwUxSJpQmEmZEsimJgpkh0pGFVaYKa0J5QpvyKaqDeFV+ZE3FNBTwxUU
8PyRmSYxMsKzKxkmZZZFmKZgyUnkoPuT7RTFTJXqRTRVVtK+YU1VStZVPZOCJunUinjQnonzpoRT
8SFb1LgU8mWMsZYywxGIxGIxGIxGIxGIxGIxGIxGIxGIxGIxGIxGIxGIxGIxGIxGIxGIxGIxGIxG
IxGIxGIxGIxGIxGIxGIxGIxGIxGIxGIxGIxGIxGIxGIxGIxGIxGIxGIxGIxGIxGIxGIxAkHwCdpV
NUyVqJ6inkRNBTmKd1UriSpPESLkU39Yp+uqesNiJ0/nCq1FNSJuqle7oK9RTWSpNBTybUpfCV7+
0BPcqdRTeU9E+oU9aE4hOBTcU7imwp4yvgK0SkmStPaKeQp6UJxRVbSFaCmULVVV3VOZXyFOMFOp
E4Ip74p0IpqJ+Ep5kU8U2FNU7AHpkZlmGGUyzFVgKsjEigsFBYKsjIiCKiIxEVUQWJEGCMUYigCy
KosFWKIxYosQYgIjFRVGCKLBSKxBgLFBGIxYijGKIqsVRgoiKrFIsGKxEFFQEWKgKKsiMMzDDFmY
zWJp1VVf8imSVqqS8H5CnaE2oTYU5ImonxFPNVVpE6CnAp85FPmVSsIV8vROaVXSiq4VStUCZCed
CepE+Kp1FOKVV+MqE+aV0krERbZJJ2wU0imb6AfQKaupFNSJkU2FNEiNalpRVaETUoXFCbCmiAmw
piqrVU3hTZKWwptKL8fMVV2FPGV4oi3CllUNUpbFU5FPOlV5qnQU+JFO/TkU95VXWAnzwnuVSuIp
/IU/VE3qnUkMkqT6FTqKfBKX8fZFPYUxN/DxhMkBfrFPEU3FPOhPCqoeGSnApynoROKVX6ZW4pu3
RT2IunlkaxTvQm2sSGwk6fgiiikVRRQUUWKpmRMSl4JpUtxTBE4FOKKrj2dBTkVXPRFNMKpjXGYq
qiqqoqqKqrBVFVVVYRUVVEVVBVVUSKqqoqqoqoqoqqowVVFREVVVVUgEgopEEBGf6/mEkLICb0J8
ROqKaqncU8CJoJD8DqKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK
KKKKKKKKKKKKKKKKKKKKKKKzGYzGYzGYzfYT4Cnj5Cu4pspJyRToKaRMkkwUyKeJJPIiclU/jKd6
l7dBTp1FNqVXUifn3FNKQfIU4TzKpain7iKeUrsVA1ZSV/9KhOBP0RNkLmlVhE/9lQnsReMJ/eVC
f3lQn1yoT/8XckU4UJBPIaik
--000000000000baceae059c38cdcf
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--000000000000baceae059c38cdcf--
