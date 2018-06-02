Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a9ccc4d
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jun 2018 11:55:19 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.vm.smurf.noris.de
 [IPv6:2001:780:107:8:83::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 223419f5
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jun 2018 11:55:19 +0000 (UTC)
Received: from [2001:780:107:0:1278:d2ff:fea3:d4a6]
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1fP599-0001s5-8Z
 for wireguard@lists.zx2c4.com; Sat, 02 Jun 2018 13:56:35 +0200
Subject: Re: Openbsd update recommendation
To: wireguard@lists.zx2c4.com
References: <CAKE2PDtV_5bkjPgtPBgtq4BgY2QaFB4eVD7r9MjqiLZNkAMjzQ@mail.gmail.com>
 <CAHmME9p7ZkaJO7FYTbyp39tQAKtfZhkD_5Lo5TfQpiOkM1a3kA@mail.gmail.com>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <5eef1dc6-2f95-a15e-731d-bab2baa290a5@urlichs.de>
Date: Sat, 2 Jun 2018 13:56:33 +0200
MIME-Version: 1.0
In-Reply-To: <CAHmME9p7ZkaJO7FYTbyp39tQAKtfZhkD_5Lo5TfQpiOkM1a3kA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 02.06.2018 05:15, Jason A. Donenfeld wrote:
> # ksh -c pwd
> /root/a
>
> That's pretty weird behavior, but maybe there's an interesting reason
> for it

Yes.

# mv ../a ../xx
# /bin/pwd

Basically you have three choices, (a) check whether $PWD points to the
current directory, (b) reconstruct the current path by walking up and
"readdir()" on each level, (c) ask the kernel.

In order to make some interesting attacks via symlinks more difficult,
(b) is somewhat safer. However, it's also significantly more expensive.
(c) works on Linux, just readlink("/proc/self/cwd"); it's equivalent to
(b). I don't know whether OpenBSD can do that, though.

-- 
-- Matthias Urlichs
