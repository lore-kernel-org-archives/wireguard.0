Return-Path: tim@sedlmeyer.us
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eaf86c36
 for <wireguard@lists.zx2c4.com>; Thu, 5 Apr 2018 15:53:44 +0000 (UTC)
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
 [209.85.214.68])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0edf738d
 for <wireguard@lists.zx2c4.com>; Thu, 5 Apr 2018 15:53:44 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id b5-v6so3395271itj.1
 for <wireguard@lists.zx2c4.com>; Thu, 05 Apr 2018 09:06:54 -0700 (PDT)
Return-Path: <tim@sedlmeyer.us>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com.
 [209.85.223.172])
 by smtp.gmail.com with ESMTPSA id z8-v6sm4531660itc.13.2018.04.05.09.06.52
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Apr 2018 09:06:52 -0700 (PDT)
Sender: Timothy Sedlmeyer <tim@sedlmeyer.us>
Received: by mail-io0-f172.google.com with SMTP id o4so31244372iod.3
 for <wireguard@lists.zx2c4.com>; Thu, 05 Apr 2018 09:06:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1a0ce6c1-4f62-509f-8d8e-9f0821d6f465@urlichs.de>
References: <CADX+UFjEBcWRsL3SRv5_b0ezU0adcURqOJf=MvDbQkSXg3JRHg@mail.gmail.com>
 <1a0ce6c1-4f62-509f-8d8e-9f0821d6f465@urlichs.de>
From: Tim Sedlmeyer <tim@sedlmeyer.org>
Date: Thu, 5 Apr 2018 12:06:51 -0400
Message-ID: <CAK_h9uGko4XWco9UVi2nRj7vMSj3tSKHyPhpPW32fZ5qbb4g3Q@mail.gmail.com>
Subject: Re: Using WG for transport security in a p2p network
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Apr 5, 2018 at 3:13 AM, Matthias Urlichs <matthias@urlichs.de> wrote:
> Hi,
>
>
> Another option would be to run insecure QUIC or SCTP on top of WireGuard,
>
> You cannot run SCTP on the Internet anyway. Too many routers block anything
> that's not TCP/UDP/ICMP.
>
> I'm also wondering how easy this would be to program. It would clearly be
> much
> more heavyweight than simply opening a socket, but I guess it can be done
> via
> invocations of the `wg` or `wg-quick` tools.
>
> Don't use the tools. There's a library around that you can use to do all of
> the heavy lifting via netlink sockets. You'll also need the privilege to
> assign addresses and routes to the WG interfaces.
>
> Ideally we wouldn't need root
>
> If you go the netlink route, you do need one process that has the
> appropriate privilege, which means root at install time (but not runtime).

The process doesn't need full root permissions even at install time.
Whatever process is going to create and manage
the interfaces needs the CAP_NET_ADMIN capability.

>
>
> Once the network is live, we'd need the transport protocol to be relatively
> stable, or at least be easily upgradeable
>
> Well, the WG wire protocol is supposed to be stable by now. Switching away
> from it would require new code on your side anyway, so you can implement the
> exact method of switching at that time.
>
> --
> -- Matthias Urlichs
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
