Return-Path: joe@solidadmin.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20eea748
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 16:55:03 +0000 (UTC)
Received: from conquer.yellowcord.com (conquer.yellowcord.com [45.55.224.114])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 96fe8fdc
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 16:55:03 +0000 (UTC)
Received: from [108.160.195.141] (port=53644 helo=[192.168.0.49])
 by conquer.yellowcord.com with esmtpsa (TLSv1.2:DHE-RSA-AES128-SHA:128)
 (Exim 4.85) (envelope-from <joe@solidadmin.com>) id 1e7lSZ-0007DC-Kh
 for wireguard@lists.zx2c4.com; Thu, 26 Oct 2017 11:56:47 -0500
Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
To: wireguard@lists.zx2c4.com
References: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
From: Joe Doss <joe@solidadmin.com>
Message-ID: <3a761178-19bc-1d01-b6a8-9fb801312d47@solidadmin.com>
Date: Thu, 26 Oct 2017 11:56:47 -0500
MIME-Version: 1.0
In-Reply-To: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 10/25/2017 05:43 PM, Jason A. Donenfeld wrote:
> Meanwhile, Fedora does not ship resolvconf at all, and instead either
> uses NetworkManager or dhclient-script, depending on the configuration
> of a variable inside of some file in/etc/sysconfig/network-scripts/.
> I haven't really looked at how to coherently interface with all the
> possibilities, and I'm kind of reluctant to look.

The most likely best long term solution for this problem, at least for 
Fedora (and other distros that use NetworkManager), is to create a 
WireGuard NetworkManager plugin similar to the OpenVPN plugin.

https://src.fedoraproject.org/git/rpms/NetworkManager-openvpn.git
https://git.gnome.org/browse/network-manager-openvpn

This way we are not fighting with NetworkManager over control over the 
resolv.conf file and we integrate with the desktop well.

The hatchet proposal sounds fine for a short term solution, but if 
WireGuard is to replace something like OpenVPN we will need to drink the 
distro koolaid on how VPN services are managed on the desktop.

Joe



--
Joe Doss
joe@solidadmin.com
