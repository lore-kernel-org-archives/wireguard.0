Return-Path: joerg@higgsboson.tk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5d1c1ddf
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 Jan 2018 12:02:20 +0000 (UTC)
Received: from mail.thalheim.io (mail.thalheim.io [188.68.39.17])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a6fef622
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 Jan 2018 12:02:20 +0000 (UTC)
Received: from [172.20.134.52] (pat-131-254.wlan.net.ed.ac.uk [192.41.131.254])
 by mail.thalheim.io (Postfix) with ESMTPSA id B9E8FA5C12
 for <wireguard@lists.zx2c4.com>; Tue, 30 Jan 2018 12:07:15 +0000 (UTC)
Subject: Re: WireGuard in systemd-networkd
To: wireguard@lists.zx2c4.com
References: <CAHmME9pJHQOTkOm4Cn6rt-ER14L8Pb54L2r3=T=4DphA0wNBTA@mail.gmail.com>
From: =?UTF-8?Q?J=c3=b6rg_Thalheim?= <joerg@higgsboson.tk>
Message-ID: <56cbfe68-5f8f-a60e-859e-a78f5a772d7f@higgsboson.tk>
Date: Tue, 30 Jan 2018 12:07:14 +0000
MIME-Version: 1.0
In-Reply-To: <CAHmME9pJHQOTkOm4Cn6rt-ER14L8Pb54L2r3=T=4DphA0wNBTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Wireguard support in networkd is now set in stone.
systemd v237 was released three days ago.

On 2018-01-09 13:49, Jason A. Donenfeld wrote:
> Hi folks,
>
> Thanks to the wonderful work of Jörg Thalheim, WireGuard is now
> supported inside systemd-netword's .netdev files. The syntax should be
> pretty similar to wg(8). Expect for this to be released as part of the
> next release of systemd, where you'll then be able to read the man
> pages for using it.
>
> Next up - anybody interested in providing support for NetworkManager?
>
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
