Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8898bb86
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 May 2018 12:32:44 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf5ee8eb
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 May 2018 12:32:44 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: reiner otto <augustus_meyer@yahoo.de>, neumann@cgws.de,
 Kalin KOZHUHAROV <me.kalin@gmail.com>
Subject: Re: Need for HW-clock independent timestamps
In-Reply-To: <1324673763.992877.1526187430298@mail.yahoo.com>
References: <1324673763.992877.1526187430298.ref@mail.yahoo.com>
 <1324673763.992877.1526187430298@mail.yahoo.com>
Date: Sun, 13 May 2018 14:35:36 +0200
Message-ID: <87mux3wx5z.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

reiner otto <augustus_meyer@yahoo.de> writes:

> Having implemented this solution already, I consider it some type of
> hack, as the standard time sync unfortunately happens very late in the
> start of the services, after rc.local called. And the sync might take
> quite some time.
>
> Which means, I had to "hack" the time sync immediately after WAN up,
> and to be done in a single shot, before starting WG.

Yeah, messing init script order is going to be hackish. You'd want to
add a hotplug script to react to when the NTP daemon syncs and apply
config after that. See the dnsmasq hotplug script for an example:

https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=package/network/services/dnsmasq/files/dnsmasqsec.hotplug;h=781d5337348bb8e927bd15f1caac94a5e7a9ba63;hb=HEAD

For WG it should be necessary to wait to configure the wg interfaces;
they just won't validate correctly until time is fixed. So you could
configure the interfaces in /etc/config/network and just have the
hotplug script add the default route (or whatever your needs are).

> However, as a real RTC is rather cheap, it might be a good idea, in
> case of commercial apps, to ask the supplier of the device to be used
> for the inclusion of a RTC. The more requests, the better the chances
> to find more devices with RTC included.

Sure, for people who are building their own hardware. Most people
aren't, though...

-Toke
