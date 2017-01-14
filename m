Return-Path: jens@viisauksena.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb086951
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Jan 2017 20:46:08 +0000 (UTC)
Received: from viisauksena.de (v32412.1blu.de [178.254.39.111])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56608603
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Jan 2017 20:46:08 +0000 (UTC)
Subject: Re: limitations
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAOnWvx_BCaSO3i=319vCUjKuXG6E+8ReGsFGFFVgJLsdyb4RGg@mail.gmail.com>
From: jens <jens@viisauksena.de>
Message-ID: <8e7bd349-31ba-9893-b1b6-b69a1b4ff385@viisauksena.de>
Date: Sat, 14 Jan 2017 21:55:15 +0100
MIME-Version: 1.0
In-Reply-To: <CAOnWvx_BCaSO3i=319vCUjKuXG6E+8ReGsFGFFVgJLsdyb4RGg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------1F9947BA64D5D2FEF7D77DB2"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------1F9947BA64D5D2FEF7D77DB2
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

UDP is used for the connection between 2 wireguard instances .. using of
the tunnel itself is done with the wg0 interface, which is "normal"
Interface (layer3) - of cause you cannot do layer 2 (ethernet based) stuf=
f.
(but i do actually some tests with gretap tunnel on top of wireguard (to
use batman-adv) - which works fine so far)

Wireguard can be compiled and is then loaded as kernel module, so its
easy to unload the module and load another one. But unloading the module
will drop all tunnel for that time, and they have tobe restored
afterwards - which is fine , since the tunnel is mainly stateless

just my simple insight (which may wrong or over simplyfied)

jens

( the freifunk WG with gretap and batman-adv if you interested
https://forum.freifunk.net/t/wireguard-0-0-20161230-mit-linux-3-18-kernel=
-und-damit-gluon-v2016-2-2/14122/7=20
)



On 14.01.2017 20:11, Wasa Bee wrote:
> Hi
>
> i've got 2 simple questions about WireGuard, correct me if I'm wrong:
>
> - it is only over UDP. If so, is there ever going to be a TCP version?
> A lot of applications that could benefit from WG use TCP. It does not
> seem wise to expect programmers to implement a TCP-like layer (eg
> retransmission, ack, etc) in userspace, is it? This would increase
> complexity unnecessarily and would lead to vuln in practice...
>
> - WG is implemented as a patch to the kernel or a kernel module? The
> reason I ask is that when an update is available for WG, it would be
> good not to have to replace the whole kernel, but only reload a
> patched WG module. Also: if there are ongoing sessions with some
> clients, how would sessions be re-established (afaik, the current
> design is to simply ignore irrelevant messages)?
>
> Thanks
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

--=20
make the world nicer, please use PGP encryption


--------------1F9947BA64D5D2FEF7D77DB2
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>UDP is used for the connection between 2 wireguard instances ..
      using of the tunnel itself is done with the wg0 interface, which
      is "normal" Interface (layer3) - of cause you cannot do layer 2
      (ethernet based) stuff.<br>
      (but i do actually some tests with gretap tunnel on top of
      wireguard (to use batman-adv) - which works fine so far)</p>
    Wireguard can be compiled and is then loaded as kernel module, so
    its easy to unload the module and load another one. But unloading
    the module will drop all tunnel for that time, and they have tobe
    restored afterwards - which is fine , since the tunnel is mainly
    stateless <br>
    <br>
    just my simple insight (which may wrong or over simplyfied)<br>
    <br>
    jens<br>
    <br>
    ( the freifunk WG with gretap and batman-adv if you interested<br>
<a class="moz-txt-link-freetext" href="https://forum.freifunk.net/t/wireguard-0-0-20161230-mit-linux-3-18-kernel-und-damit-gluon-v2016-2-2/14122/7">https://forum.freifunk.net/t/wireguard-0-0-20161230-mit-linux-3-18-kernel-und-damit-gluon-v2016-2-2/14122/7</a> 
    )<br>
    <br>
    <br>
    <br>
    <div class="moz-cite-prefix">On 14.01.2017 20:11, Wasa Bee wrote:<br>
    </div>
    <blockquote
cite="mid:CAOnWvx_BCaSO3i=319vCUjKuXG6E+8ReGsFGFFVgJLsdyb4RGg@mail.gmail.com"
      type="cite">
      <div dir="ltr">Hi
        <div><br>
        </div>
        <div>i've got 2 simple questions about WireGuard, correct me if
          I'm wrong:</div>
        <div><br>
        </div>
        <div>- it is only over UDP. If so, is there ever going to be a
          TCP version? A lot of applications that could benefit from WG
          use TCP. It does not seem wise to expect programmers to
          implement a TCP-like layer (eg retransmission, ack, etc) in
          userspace, is it? This would increase complexity unnecessarily
          and would lead to vuln in practice...</div>
        <div><br>
        </div>
        <div>- WG is implemented as a patch to the kernel or a kernel
          module? The reason I ask is that when an update is available
          for WG, it would be good not to have to replace the whole
          kernel, but only reload a patched WG module. Also: if there
          are ongoing sessions with some clients, how would sessions be
          re-established (afaik, the current design is to simply ignore
          irrelevant messages)?</div>
        <div><br>
        </div>
        <div>Thanks</div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
WireGuard mailing list
<a class="moz-txt-link-abbreviated" href="mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a>
<a class="moz-txt-link-freetext" href="https://lists.zx2c4.com/mailman/listinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard</a>
</pre>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
make the world nicer, please use PGP encryption</pre>
  </body>
</html>

--------------1F9947BA64D5D2FEF7D77DB2--
