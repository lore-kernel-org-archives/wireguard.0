Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f04dc6f6
 for <wireguard@lists.zx2c4.com>; Thu, 5 Apr 2018 07:00:29 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.smurf.noris.de [213.95.149.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75bb9998
 for <wireguard@lists.zx2c4.com>; Thu, 5 Apr 2018 07:00:29 +0000 (UTC)
Received: from hyper1.noris.net ([62.128.1.62] helo=[10.6.0.3])
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1f3z4z-0007kF-Hk
 for wireguard@lists.zx2c4.com; Thu, 05 Apr 2018 09:13:06 +0200
Subject: Re: Using WG for transport security in a p2p network
To: wireguard@lists.zx2c4.com
References: <CADX+UFjEBcWRsL3SRv5_b0ezU0adcURqOJf=MvDbQkSXg3JRHg@mail.gmail.com>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <1a0ce6c1-4f62-509f-8d8e-9f0821d6f465@urlichs.de>
Date: Thu, 5 Apr 2018 09:13:03 +0200
MIME-Version: 1.0
In-Reply-To: <CADX+UFjEBcWRsL3SRv5_b0ezU0adcURqOJf=MvDbQkSXg3JRHg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------63B439AAFB6D2C50FBADCFF9"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------63B439AAFB6D2C50FBADCFF9
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,<https://tools.ietf.org/html/draft-hohendorf-secure-sctp-25>
>
> Another option would be to run insecure QUIC or SCTP on top of WireGuard,
You cannot run SCTP on the Internet anyway. Too many routers block
anything that's not TCP/UDP/ICMP.

> I'm also wondering how easy this would be to program. It would clearly
> be much
> more heavyweight than simply opening a socket, but I guess it can be
> done via
> invocations of the `wg` or `wg-quick` tools.
Don't use the tools. There's a library around that you can use to do all
of the heavy lifting via netlink sockets. You'll also need the privilege
to assign addresses and routes to the WG interfaces.
> Ideally we wouldn't need root
If you go the netlink route, you do need one process that has the
appropriate privilege, which means root at install time (but not runtime).
>
> Once the network is live, we'd need the transport protocol to be
> relatively
> stable, or at least be easily upgradeable
Well, the WG wire protocol is supposed to be stable by now. Switching
away from it would require new code on your side anyway, so you can
implement the exact method of switching at that time.

-- 
-- Matthias Urlichs


--------------63B439AAFB6D2C50FBADCFF9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hi,<a
      href="https://tools.ietf.org/html/draft-hohendorf-secure-sctp-25"
      moz-do-not-send="true"></a><br>
    <blockquote type="cite"
cite="mid:CADX+UFjEBcWRsL3SRv5_b0ezU0adcURqOJf=MvDbQkSXg3JRHg@mail.gmail.com">
      <div dir="ltr"><br>
        Another option would be to run insecure QUIC or SCTP on top of
        WireGuard,<br>
      </div>
    </blockquote>
    You cannot run SCTP on the Internet anyway. Too many routers block
    anything that's not TCP/UDP/ICMP.<br>
    <br>
    <blockquote type="cite"
cite="mid:CADX+UFjEBcWRsL3SRv5_b0ezU0adcURqOJf=MvDbQkSXg3JRHg@mail.gmail.com">
      <div dir="ltr">I'm also wondering how easy this would be to
        program. It would clearly be much<br>
        more heavyweight than simply opening a socket, but I guess it
        can be done via<br>
        invocations of the `wg` or `wg-quick` tools.</div>
    </blockquote>
    Don't use the tools. There's a library around that you can use to do
    all of the heavy lifting via netlink sockets. You'll also need the
    privilege to assign addresses and routes to the WG interfaces.<br>
    <blockquote type="cite"
cite="mid:CADX+UFjEBcWRsL3SRv5_b0ezU0adcURqOJf=MvDbQkSXg3JRHg@mail.gmail.com">
      <div dir="ltr">Ideally we wouldn't need root</div>
    </blockquote>
    If you go the netlink route, you do need one process that has the
    appropriate privilege, which means root at install time (but not
    runtime).<br>
    <blockquote type="cite"
cite="mid:CADX+UFjEBcWRsL3SRv5_b0ezU0adcURqOJf=MvDbQkSXg3JRHg@mail.gmail.com">
      <div dir="ltr"><br>
        Once the network is live, we'd need the transport protocol to be
        relatively<br>
        stable, or at least be easily upgradeable</div>
    </blockquote>
    Well, the WG wire protocol is supposed to be stable by now.
    Switching away from it would require new code on your side anyway,
    so you can implement the exact method of switching at that time.<br>
    <br>
    <pre class="moz-signature" cols="72">-- 
-- Matthias Urlichs</pre>
  </body>
</html>

--------------63B439AAFB6D2C50FBADCFF9--
