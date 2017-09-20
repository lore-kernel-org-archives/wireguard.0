Return-Path: joerg@higgsboson.tk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31be08f3
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Sep 2017 09:34:46 +0000 (UTC)
Received: from mail.thalheim.io (mail.thalheim.io [188.68.39.17])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ece33aaf
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Sep 2017 09:34:45 +0000 (UTC)
Received: from [172.20.134.165] (pat-131-252.wlan.net.ed.ac.uk
 [192.41.131.252])
 by mail.thalheim.io (Postfix) with ESMTPSA id 8549E77E9D
 for <wireguard@lists.zx2c4.com>; Wed, 20 Sep 2017 10:01:59 +0000 (UTC)
From: =?UTF-8?Q?J=c3=b6rg_Thalheim?= <joerg@higgsboson.tk>
Subject: Re: Wireguard and VRFs?
To: wireguard@lists.zx2c4.com
References: <000001d331be$4e5d4900$eb17db00$@dev.xod.de>
Message-ID: <3b671530-b335-e61b-edcd-d9cb4a804188@higgsboson.tk>
Date: Wed, 20 Sep 2017 11:01:59 +0100
MIME-Version: 1.0
In-Reply-To: <000001d331be$4e5d4900$eb17db00$@dev.xod.de>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

You assign a firewall mark to each wireguard interface to route dedicated routing table using ip rule.
wg-quick use this feature for example, when you redirect 0.0.0.0 via a vpn interface:

$ wg-quick up mullvad
[#] ip link add mullvad type wireguard
[#] wg setconf mullvad /dev/fd/63
[#] ip address add 10.99.1.142/32 dev mullvad
[#] ip address add fc00:bbbb:bbbb:bb01::18e/128 dev mullvad
[#] ip link set mtu 1420 dev mullvad
[#] ip link set mullvad up
[#] wg set mullvad fwmark 51820
[#] ip -4 route add 0.0.0.0/0 dev mullvad table 51820
[#] ip -4 rule add not fwmark 51820 table 51820
[#] ip -4 rule add table main suppress_prefixlength 0


On 2017-09-20 04:12, Florian Werner wrote:
> Hi Jason,
>
> does Wireguard support to bind to a specific interface?
>
> For e.g. gre interface it is possible with
> ip tunnel add name gre0 mode gre remote 1.2.3.4 dev eth0
> to bind the gre0 interface to eth0.
>
> Quoting ip-tunnel(8):
> dev NAME
> 	bind the tunnel to the device NAME so that tunneled
> 	packets will only be routed via this device and will
> 	not be able to escape to another device when the route
> 	to endpoint changes.
>
> But I don't think ip link supports this.
> The question is, why are there 2 commands to create new
> interfaces (ip link add, ip tunnel add)...
>
> With binding support one can simply bind to a vrf master
> interface and all outer-traffic is sent to the associated
> routing table. Using vrf instead of network namespace has
> the advantage of allowing daemons to operate in multiple
> vrf (e.g. routing daemons), where network namespace are
> more separated but also don't allow much communication.
>
> Florian
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
