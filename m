Return-Path: saeidscorp@yahoo.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb40637f
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Mar 2018 14:07:48 +0000 (UTC)
Received: from sonic310-13.consmr.mail.ir2.yahoo.com
 (sonic310-13.consmr.mail.ir2.yahoo.com [77.238.177.34])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fe26e1c8
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Mar 2018 14:07:48 +0000 (UTC)
Received: from 88.202.186.116 (EHLO scorpbook.localnet) ([88.202.186.116])
 by smtp416.mail.ir2.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID
 0f4761d8fad8ae430b59a72c41633d00 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Mar 2018 14:17:52 +0000 (UTC)
From: Saeid Akbari <saeidscorp@yahoo.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Some potential bug in wg-quick re. fwmark and default route
Date: Mon, 12 Mar 2018 17:47:10 +0330
Message-ID: <4993616.ZASKD2KPVS@scorpbook>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

Straight to the point :)
Suppose the following scenario:

On a client system I have 2 interfaces:
wg0 -> which has allowedips of 0.0.0.0; so it gets special treatment by wg-
quick -> so `ip rule add not fwmark 51820 table 51820`
wg1 -> which has a restrictive allowedips of 192.168.255.10/32 (not important)

also each one have a FwMark set in their config file:
wg0 -> 51800
wg1 -> 51820

Then: `wg-quick up wg0` and `wg-quick up wg1`

Now the problem is, when I do `wg-quick down wg1` it also deletes the default 
rules for wg0, as its fwmark is 51820 which belongs to table of wg0. I see 
that this might seem a little bit weird to do, but why rely on hard-coded 
numbers if we can use the ones provided by the user...

So wouldn't be better if `add_default()` function first checks if fwmark is 
present on device (thus config file) and use that as fwmark and table-id?

Like what `del_if()` does, borrowing its code:

```DEFAULT_TABLE=
add_default() {
	local fwmark
	fwmark="$(wg show "$INTERFACE" fwmark)"
	[[ $fwmark != off ]] && DEFAULT_TABLE=$(( fwmark )) # borrowed
	if [[ -z $DEFAULT_TABLE ]]; then
		DEFAULT_TABLE=51820
		while [[ -n $(ip -4 route show table $DEFAULT_TABLE) || -n $(ip -6 route 
show table $DEFAULT_TABLE) ]]; do
			((DEFAULT_TABLE++))
		done
	fi```

This way, default interface (the one having allowedips of 0.0.0.0) would 
register its own fwmark, and bringing down other interfaces, doesn't delete 
its rule.


+ But another issue, `del_if()` seems to assume that the interface is used as 
default route when a fwmark is present on it. This causes deletion of "from 
all lookup main suppress_prefixlength 0" when bringing down a non-default 
interface (in this scenario, wg1).

Any ideas?

Thanks.
