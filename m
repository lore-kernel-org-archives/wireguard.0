Return-Path: <SRS0=1SvS=PY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,LOCALPART_IN_SUBJECT,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C732C43612
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jan 2019 16:36:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B8A620657
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jan 2019 16:36:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJRgKhyA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B8A620657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2cf1286b;
	Wed, 16 Jan 2019 16:32:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a3370f6e
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Jan 2019 14:16:06 +0000 (UTC)
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 52621646
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Jan 2019 14:16:06 +0000 (UTC)
Received: by mail-vs1-xe36.google.com with SMTP id v205so9283419vsc.3
 for <wireguard@lists.zx2c4.com>; Fri, 11 Jan 2019 06:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=z2Ka0YuimF+lumHXtxFt5bPXPsHQjtQHpaNy3qaYC+8=;
 b=FJRgKhyA79gs3DAXZI1S03FmupIoCLof6DK8AKRyUnMyk+k9N4n82tp3/oRD/e/6zP
 kU8hn033pDUoYplewrolfN1x6yYF7Dend+JjAdNXH9UqEYbLsdKvlgkYoge7Fm3QsJ/K
 5uTVYe80BU8w2OMIzmuTgbc2Z0HlwPY4O3e/80ILtxu1v+JpsOFPiTiCefwwihYQIoV5
 Iql+dEqXn2WEJHBCHW/QK+4FftiAKWZ9p+wqnu/17+16LKKV+nntP+y/DErfxrE2aEpO
 ivDkxwX4/flTBaIcepLrF0ogqbEtbMiJlI7KLwZaScHL+wzrpW0jHuyzPycfj2DKkEoJ
 XhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=z2Ka0YuimF+lumHXtxFt5bPXPsHQjtQHpaNy3qaYC+8=;
 b=n1CDDq+oBC1ljwcB1ku1GhU33keekuvjKCfAioJEsCosDLxFCSDzp0Pnl/sxCfCj79
 w4IUmXgD4D7HqOuuO5hVDTF624QuHy+qzvmq+N4X/9N9+SSGsQHr0QislzfnE5ioU/Wq
 g7DNKzAHNpD+JSHcTljrNISrsLb4s002o8zv+LYWIKymS63+gaagOrYTB5GLN0EcEW5k
 lhzyNp1VuO3vxYq+qvSXCMISxv9yC9ksM8xcWOwb4QErKAZup+UEIKGosy6jWEescuXI
 b48K+ZXPqW1C+hN+kSkPwEG3wgiGzN5BE5uJR38kGWHczcBKRfAEwagvhGwz3J3qSQx6
 YoRw==
X-Gm-Message-State: AJcUukcmuWLfhRMR9ocJbbOyS+VwdcdBTQfshXgzwPMNde80z1G69B8n
 62wi7wfqPdk2dvnzSRBkBfcRL3O6gNfBWl/sDaZ+7O/Uvvg=
X-Google-Smtp-Source: ALg8bN76m5cgHf41QCMPN7RmeZ36rpUOCoTcJL8q1FLvYJmfAFgg0KU8C1SOQrWzGpIW0V75euSGFDUBZzusP4M6Rws=
X-Received: by 2002:a67:4850:: with SMTP id v77mr6257117vsa.59.1547216377233; 
 Fri, 11 Jan 2019 06:19:37 -0800 (PST)
MIME-Version: 1.0
From: Ju Hyung Park <qkrwngud825@gmail.com>
Date: Fri, 11 Jan 2019 23:19:26 +0900
Message-ID: <CAD14+f2_Ko5zZvZ3jh3XzckXALRER1vpc6OyJtZ7p7=BPqH-1Q@mail.gmail.com>
Subject: wireguard: Adding an interface name filter for Android?
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 16 Jan 2019 17:32:07 +0100
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi,

I've been using WireGuard on my Laptop for months and I've just got to
try it on my Android device with kernel support just now.

I've just noticed that Android's ndc doesn't take it nicely when the
interface name has a period on it. I'm not sure whether this is a
known issue, but it seems to be a good idea to add a name filter for
Android. I'm guessing that some other symbols would be also
problematic.

Here's a terminal log I manually captured after running wg-quick
myself as the logcat didn't indicate much:

OnePlus6:/data/data/com.wireguard.android # ./cache/bin/wg-quick up
arter97.com
[#] ip link add arter97.com type wireguard
[#] wg setconf arter97.com /proc/self/fd/0
[#] ip link set up dev arter97.com
[#] ip6tables -I INPUT 1 -p udp --dport ***** -j DROP -m comment
--comment "wireguard rule arter97.com"
[#] ip link set down dev arter97.com
[#] ndc interface setcfg arter97.com '192.168.2.8' 32
[#] wg set arter97.com fwmark 0x20000
[#] iptables -I OUTPUT 1 -m mark --mark 0x20000 -j ACCEPT -m comment
--comment "wireguard rule arter97.com"
[#] ip6tables -I OUTPUT 1 -m mark --mark 0x20000 -j ACCEPT -m comment
--comment "wireguard rule arter97.com"
[#] ndc interface setcfg arter97.com up
[#] ndc network create 20968 vpn 1 1
[#] ndc network interface add 20968 arter97.com
[#] ndc resolver setnetdns 20968 '' '1.1.1.1'
[#] ndc network route add 20968 arter97.com 0.0.0.0/0
[#] ndc interface setmtu arter97.com 1370
Error: 400 0 Failed to set MTU (No such file or directory)

[#] iptables -D OUTPUT -m mark --mark 0x20000 -j ACCEPT -m comment
--comment "wireguard rule arter97.com"
[#] ip6tables -D OUTPUT -m mark --mark 0x20000 -j ACCEPT -m comment
--comment "wireguard rule arter97.com"
[#] ip link del arter97.com
[#] ndc network destroy 20968
64|OnePlus6:/data/data/com.wireguard.android #




OnePlus6:/data/data/com.wireguard.android # ./cache/bin/wg-quick up
arter97
[#] ip link add arter97 type wireguard
[#] wg setconf arter97 /proc/self/fd/0
[#] ip link set up dev arter97
[#] ip6tables -I INPUT 1 -p udp --dport ***** -j DROP -m comment
--comment "wireguard rule arter97"
[#] ip link set down dev arter97
[#] ndc interface setcfg arter97 '192.168.2.8' 32
[#] wg set arter97 fwmark 0x20000
[#] iptables -I OUTPUT 1 -m mark --mark 0x20000 -j ACCEPT -m comment
--comment "wireguard rule arter97"
[#] ip6tables -I OUTPUT 1 -m mark --mark 0x20000 -j ACCEPT -m comment
--comment "wireguard rule arter97"
[#] ndc interface setcfg arter97 up
[#] ndc network create 4402 vpn 1 1
[#] ndc network interface add 4402 arter97
[#] ndc resolver setnetdns 4402 '' '1.1.1.1'
[#] ndc network route add 4402 arter97 0.0.0.0/0
[#] ndc interface setmtu arter97 1370
[#] ndc network users add 4402 0-99999
[#] am broadcast -a com.wireguard.android.action.REFRESH_TUNNEL_STATES
com.wireguard.android
Broadcasting: Intent {
act=com.wireguard.android.action.REFRESH_TUNNEL_STATES
pkg=com.wireguard.android }
Broadcast completed: result=0

Thanks,
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
