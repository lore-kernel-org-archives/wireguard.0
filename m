Return-Path: john@phrozen.org
Received: from nbd.name (nbd.name [46.4.11.11])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ea8dbbec
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jul 2016 13:41:31 +0000 (UTC)
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>,
 lede-dev@lists.infradead.org
References: <20160702132018.GH12181@lud.polynome.dn42>
From: John Crispin <john@phrozen.org>
Message-ID: <5ad48f17-1fbb-74ca-4b41-33bcfa0c46c4@phrozen.org>
Date: Sat, 2 Jul 2016 15:44:28 +0200
MIME-Version: 1.0
In-Reply-To: <20160702132018.GH12181@lud.polynome.dn42>
Content-Type: text/plain; charset=windows-1252
Cc: wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] [LEDE-DEV] Kernel symbol dependencies and KCONFIG
 usage for kernel packages
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>



On 02/07/2016 15:20, Baptiste Jonglez wrote:
> Hi,
> 
> I am packaging a new kernel module (wireguard), the package is currently here [1].
> 
> However, I have some trouble understanding what KCONFIG does.  Wireguard
> needs a few kernel options, so I thought that KCONFIG was the place to
> declare such dependencies:
> 
>   https://github.com/zorun/packages-1/blob/wireguard/net/wireguard/Makefile#L90
> 
> However, it does not seem to enable these options.  The module compiles
> fine, it installs fine [2], but then it fails to load at runtime:
> 
> Sat Jul  2 10:04:50 2016 kern.warn kernel: [   95.015838] wireguard: Unknown symbol udp_sock_create4 (err 0)
> Sat Jul  2 10:04:50 2016 kern.warn kernel: [   95.022021] wireguard: Unknown symbol udp_tunnel6_xmit_skb (err 0)
> Sat Jul  2 10:04:50 2016 kern.warn kernel: [   95.028767] wireguard: Unknown symbol udp_tunnel_sock_release (err 0)
> Sat Jul  2 10:04:50 2016 kern.warn kernel: [   95.035570] wireguard: Unknown symbol setup_udp_tunnel_sock (err 0)
> Sat Jul  2 10:04:50 2016 kern.warn kernel: [   95.042136] wireguard: Unknown symbol udp_sock_create6 (err 0)
> Sat Jul  2 10:04:50 2016 kern.warn kernel: [   95.048297] wireguard: Unknown symbol udp_tunnel_xmit_skb (err 0)
> 
> It works when selecting the needed options manually in kernel_menuconfig,
> but it's a huge pain.
> 
> Is there a way to get the needed kernel options automatically?  Maybe this
> only happens for packages that are part of the core Lede distribution?
> 
> Thanks,
> Baptiste
> 
> [1] https://github.com/zorun/packages-1/blob/wireguard/net/wireguard/Makefile
> [2] http://paste.aliens-lyon.fr/CBI
> 
> 

Hi,

wireguard depends on other moduls so you will need to package them aswell.

CONFIG_NET_UDP_TUNNEL will create ip6_udp_tunnel.ko which for example
has udp_tunnel6_xmit_skb inside it.

once all of these are packaged you can make wireguard depend on them.

	John

> 
> _______________________________________________
> Lede-dev mailing list
> Lede-dev@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/lede-dev
> 
