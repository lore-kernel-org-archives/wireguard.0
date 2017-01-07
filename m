Return-Path: em12345@web.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2767cc05
 for <wireguard@lists.zx2c4.com>; Sat, 7 Jan 2017 16:36:17 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c48322b2
 for <wireguard@lists.zx2c4.com>; Sat, 7 Jan 2017 16:36:17 +0000 (UTC)
Received: from [192.168.244.69] ([91.63.246.64]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MMWA2-1cPKYh0OiM-008GG9 for
 <wireguard@lists.zx2c4.com>; Sat, 07 Jan 2017 17:45:37 +0100
Subject: Re: Multiple Endpoints
References: <6d000312-635f-a361-200a-936da7ce7e17@web.de>
 <CAHmME9p4WOB96v6P1E2yGZcpEXdRfG7e=vK1nUwCE953tx1SSA@mail.gmail.com>
From: em12345 <em12345@web.de>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <89477ad4-b015-d0a1-1c05-ea6600b2f464@web.de>
Date: Sat, 7 Jan 2017 17:45:35 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9p4WOB96v6P1E2yGZcpEXdRfG7e=vK1nUwCE953tx1SSA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason,

I'm not sure that I'm understanding the roaming feature in WireGuard.

>From your response it sounds like once a connection is established, then
the server can inform the client about a server IP change.

This would require PersistentKeepalive on "server" side. But assuming
the common case that the client sits behind a stateful firewall, how
would the server be able to inform the client about its IP change?

On a server IP change:

- the client still sends UDP packages to old server IP, which is useless

- the server (from its new IP) can send UDP packages to the still
remembered client IP (because of PersistentKeepalive). But my
understanding is that stateful firewalls will block UDP packages from
the new IP until the client has send an UDP to the new server IP.

So in such a scenario the roaming feature wouldn't help.

Thanks

Emmanuel



> Hello,
> 
> Keep in mind that WireGuard's roaming property means that while the
> two peers are communicating, they'll automatically be updating to each
> others' latest IP addresses. One way to ensure that they _keep_
> communicating is by using the PersistentKeepalive feature. This then
> shifts the problem to "how do they start communicating", in which case
> you can just use a little resolve,ping,resolve,ping loop on your
> various dyndns services.
> 
> But, in case you want a different architecture, I'll directly answer
> your questions:
> 
> - wg setconf/addconf/set can be run at any time, before or after the
> link is up, and before or after peers are communicating. It returns
> and succeeds immediately, leaving the actual negotiation to be done
> whenever data needs to be sent.
> - The same goes for `ip link up`, with the sole exception that `ip
> link up` may fail if the UDP port is already in use by a different
> program.
> - The best way to determine if a wireguard link is up is if you can
> send a ping through the tunnel.
> - Your syntax doesn't make sense for endpoint setting. What you want
> is: `wg set wg0 peer ABCDEFG... endpoint 1.2.3.4:1234`. So, yes, you
> can individually set the endpoint of a peer.
> 
> Jason
> 
