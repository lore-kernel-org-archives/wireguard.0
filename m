Return-Path: markus@lindenberg.io
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2997e624
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 May 2018 09:24:01 +0000 (UTC)
Received: from mail.ruhrblick.net (mail.ruhrblick.net [212.227.89.85])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 120c107c
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 May 2018 09:24:01 +0000 (UTC)
Date: Tue, 29 May 2018 11:25:53 +0200
From: Markus Lindenberg <markus@lindenberg.io>
To: John Huttley <john@mib-infotech.co.nz>
Subject: Re: Recommended Mini-VM image?
Message-ID: <20180529092553.c52bqhc2n5b5j3ht@hodor.lindenberg.io>
References: <CACW8NbAnCtceEQLqgJ6vaCHexH3dH_uq82TTPuYKeb-C55NM-Q@mail.gmail.com>
 <03090631-bb0c-5b54-a9ff-9d79021afea5@mib-infotech.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <03090631-bb0c-5b54-a9ff-9d79021afea5@mib-infotech.co.nz>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi John, 

OpenWRT/Lede ist available for x86 targets and is <10MB in size.
You could use a current snapshot and install Wireguard and the Luci
webinterface (not included in snapshot builds by default) on it (using SSH):

opkg update
opkg install luci luci-proto-wireguard

After that you can configure all your routing/switching needs including
wireguard using the webinterface.

Best, 

Markus

On Tue, May 29, 2018 at 05:35:18PM +1200, John Huttley wrote:
> Hi team,
> I want to run WG in a VM under windows with Virtual box or such.
> 
> I could use my Gentoo image, buts its 25Gb. Does anyone have an "appliance"
> image?
> Regards,
> -Dad
