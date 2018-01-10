Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0036bcca
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Jan 2018 08:48:36 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.smurf.noris.de [213.95.149.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 770d29a6
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Jan 2018 08:48:36 +0000 (UTC)
Received: from [2001:780:107:0:1278:d2ff:fea3:d4a6]
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1eZC5o-0007B9-Dk
 for wireguard@lists.zx2c4.com; Wed, 10 Jan 2018 09:50:40 +0100
Subject: Re: WireGuard in systemd-networkd
To: wireguard@lists.zx2c4.com
References: <CAHmME9pJHQOTkOm4Cn6rt-ER14L8Pb54L2r3=T=4DphA0wNBTA@mail.gmail.com>
 <871siz6ouv.fsf@fifthhorseman.net>
 <CAHmME9qrfy4Lf78NkChdv6tPnSFTcGArwgsizAaapL9k=Tc31w@mail.gmail.com>
 <87efmy42c0.fsf@fifthhorseman.net>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <81bb0726-8f67-0163-875f-0d3403f8df29@urlichs.de>
Date: Wed, 10 Jan 2018 09:50:39 +0100
MIME-Version: 1.0
In-Reply-To: <87efmy42c0.fsf@fifthhorseman.net>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 10.01.2018 08:09, Daniel Kahn Gillmor wrote:
> The disjunction (A | B) means "if one of A or B is installed, don't bother
> trying to satisfy the other; but if neither is installed, install A".

… unless installing A causes a conflict – then the solver is free to use
B instead.

Given that systemd is installed by default in Debian, a "Suggests:
systemd" is unlikely to be useful for anybody, and an A|B recommendation
also is a no-op for the majority of users.

Instead, I would simply Recommend wg-tools, as they're very useful for
querying or modifying its state even when systemd-networkd manages the
interface.

I would also create a virtual "wireguard" package that directly depends
on wireguard-dkms and wireguard-tools (and Recommends:
networkmanager-wireguard, as soon as that exists). Then, simply instruct
the user to install that.

-- 
-- Matthias Urlichs
