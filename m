Return-Path: <SRS0=qbNG=2Y=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 050FBC32771
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 15:40:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A028421734
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 15:40:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="bevvmmkW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A028421734
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63dc6076;
	Fri, 3 Jan 2020 15:39:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1842a874
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Dec 2019 18:49:08 +0000 (UTC)
Received: from st43p00im-ztfb10073301.me.com (st43p00im-ztfb10073301.me.com
 [17.58.63.186])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13af8647
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Dec 2019 18:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1577818147;
 bh=Tk3yUeIM/hr/Q5hkwL1QwuIKAU3j7S8gufOfPxTy6R8=;
 h=To:From:Subject:Message-ID:Date:Content-Type;
 b=bevvmmkWGsKfaRXtcX1uxl1RFiyTJP/KEsyRReFYzL4XqOnRJOgnglX6Mz9Hx4yBy
 cDwWq9BakKOWBFL07hEsViTCsy81NsZjM9pOh2RQXe22cg/5D/lZF4yeGqxnJb3pqQ
 PLcF4dja+pQgUwyJbHlNC57Jecbek3EESC8YgZBKcQJhbO/jPrKAHDnRda22h9k+Cu
 m/UvlIRbArm6C12Tkmbr0p65I+KdvK9hV9as+g/k994hFHVlhaHAC2zYG+NQK0e8QC
 +/awDhYY5b+HFsf+Q9zp+X+RMnaZz7oPiPSfInd+t80lLcxZAAniNV8XPhpJBC6hRM
 e2Qa/RGDhKgSQ==
Received: from [10.65.11.24] (unknown [185.206.227.140])
 by st43p00im-ztfb10073301.me.com (Postfix) with ESMTPSA id 3EDB9940D85
 for <wireguard@lists.zx2c4.com>; Tue, 31 Dec 2019 18:49:07 +0000 (UTC)
To: "WireGuard@lists.zx2c4.com" <WireGuard@lists.zx2c4.com>
From: Lee Yates <rainmakerraw@icloud.com>
Subject: DNS fails after undetermined time in-tunnel
X-Pep-Version: 2.0
Message-ID: <ef68748c-4b72-3287-781f-52cb93483de1@icloud.com>
Date: Tue, 31 Dec 2019 18:49:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------D41258C2F69E6C81637D8603"
Content-Language: en-GB
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-12-31_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1912310162
X-Mailman-Approved-At: Fri, 03 Jan 2020 16:39:50 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--------------D41258C2F69E6C81637D8603
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

I hope everyone had an enjoyable festive period.

I have posted this issue on the /r/WireGuard subreddit, and several
Linux people responded that they are also experiencing it. As such I'm
posting here 'properly'.

For a while now, I have noticed that a WG tunnel on my Linux machines
will at some point lose DNS. It doesn't matter what the DNS was set to
in the .conf (i.e. VPN provider's own, my own local resolver on a Pi,
Cloudflare, whatever) - after a seemingly arbitrary time DNS will just
stop working whether in a browser, CLI or elsewhere. For example:

> $ update
> Password: 
> [*] Updating `https://alpha.de.repo.voidlinux.org/current/x86_64-repodata' ...
> ERROR: [reposync] failed to fetch file `https://alpha.de.repo.voidlinux.org/current/x86_64-repodata': Transient resolver failure

Only taking down the tunnel and bringing it back up will resolve the
issue, at least until it recurs again a short while later. Curiously
though, wg-quick reports that there's no such process during the
take-down, but it does nonetheless disconnect it. Reconnecting does, as
I said, work fine for a while again.

> $ sudo cat /etc/resolv.conf
> nameserver 192.168.2.12

> $ wg-quick down mullvad
> [#] ip -4 rule delete table 51820
> [#] ip -4 rule delete table main suppress_prefixlength 0
> [#] ip -6 rule delete table 51820
> [#] ip -6 rule delete table main suppress_prefixlength 0
> [#] ip link delete dev mullvad
> [#] resolvconf -d mullvad -f
> [#] iptables-restore -n
> [#] ip6tables-restore -n
> [#] ip route del 192.168.2.0/24 via 192.168.1.1
> RTNETLINK answers: No such process

I am currently in Void Linux with WireGuard version 20191219 (the latest
in the repo). Void has openresolv (3.9.2_1) installed also, by default.
Because Void uses runit rather then systemd, there's no access to the
wg-quick@ system service. As such I am bringing up and taking down the
connection manually with wg-quick up/down. However I get the same
behaviour on Ubuntu 19.10, Arch Linux and Fedora 31 which all use
systemd and the related wg-quick@ service (and resolvconf instead of
openresolv).

I have also tried adding a PersistentKeepalive = 25 to my .conf with no
effect either way. My home router is actually a repurposed Dell Optiplex
Core i7 x64 machine with Arch Linux installed, and WireGuard has never
needed NAT keepalive on my network before (nor did enabling it change
this DNS drop behaviour). Finally, I have tried several WireGuard
providers including Mullvad, TunSafe, AzireVPN and a manual VPS install
- all have the same DNS failure after a short while.

I don't know how to start debugging this, but hopefully I've provided
enough to help someone get an idea (or provide me further steps to help).

Best wishes,

Lee Yates

--------------D41258C2F69E6C81637D8603
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=FV89
-----END PGP PUBLIC KEY BLOCK-----

--------------D41258C2F69E6C81637D8603
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--------------D41258C2F69E6C81637D8603--
