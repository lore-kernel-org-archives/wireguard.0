Return-Path: whit@transpect.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5a5ad351
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 18:31:13 +0000 (UTC)
Received: from black.transpect.com (vt.electrainfo.com [207.136.236.70])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 16cf59db
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 18:31:13 +0000 (UTC)
Date: Mon, 4 Dec 2017 13:37:53 -0500
From: Whit Blauvelt <whit@transpect.com>
To: Aaron Jones <aaronmdjones@gmail.com>
Subject: Re: What are the options for stopping and starting?
Message-ID: <20171204183753.GA5311@black.transpect.com>
References: <20171204160159.GA27666@black.transpect.com>
 <CAHmME9o3+SBZfsWLUczAxKOxmBcWeJYyx_wpGnk_sXNbb8aZgA@mail.gmail.com>
 <20171204172937.GA11936@black.transpect.com>
 <0e21b9be-bb38-427c-629b-a45473d6e223@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <0e21b9be-bb38-427c-629b-a45473d6e223@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Aaron,

Yes, removing the link should disable it. But that's overkill. Assuming I
want to leave the device in place, and the IP assignments there for
subsequent use by WireGuard, is there a simple way to shut WireGuard off,
without tearing down more than required?

If I'm running a VPN on a tun or tap device, for instance, I don't have to
remove the device to turn the VPN software off. I'm looking for the minimal,
not maximal, way to do that with WireGuard -- the equivalent to shutting
down a daemon in user space.

Thanks,
Whit

On Mon, Dec 04, 2017 at 05:31:35PM +0000, Aaron Jones wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
> 
> On 04/12/17 17:29, Whit Blauvelt wrote:
> > Is there a preferred way to take WireGuard fully down? We could
> > unload the wireguard (and ip6_udp_tunnel and udp_tunnel?) modules.
> > But that seems a crude method. What's perferred? I see we can "set
> > <interface> remove", but is there a simple command to take them all
> > down? (One could obviously be scripted; just wondering if I'm
> > missing that one's already there.)
> 
> # ip link del dev wg0
> 
> Regards,
> Aaron Jones
