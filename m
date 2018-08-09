Return-Path: mdlayher@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de788b19
 for <wireguard@lists.zx2c4.com>; Thu, 9 Aug 2018 03:43:29 +0000 (UTC)
Received: from mail-it0-x241.google.com (mail-it0-x241.google.com
 [IPv6:2607:f8b0:4001:c0b::241])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e2bd8cd0
 for <wireguard@lists.zx2c4.com>; Thu, 9 Aug 2018 03:43:29 +0000 (UTC)
Received: by mail-it0-x241.google.com with SMTP id 139-v6so823589itf.0
 for <wireguard@lists.zx2c4.com>; Wed, 08 Aug 2018 20:54:40 -0700 (PDT)
Return-Path: <mdlayher@gmail.com>
Subject: Re: Kernel module sends infinite netlink messages on v0.0.20180802
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <8b63f0e3-3f0f-d028-59de-5eb08af2e26a@gmail.com>
 <CAHmME9qi0v1yMbTK+tTjB2RYjriZeRJBDH5i7yNfQcopfmJfOA@mail.gmail.com>
 <CAHQtf6-gQRYWfb0eiWuMmke5S9LO3tf26h+YczKwtAZNALtJiA@mail.gmail.com>
 <CAHmME9qyZQ-XQ0GDcoBAK8PdDr444Le5i0wq15un4oROKSj1AQ@mail.gmail.com>
From: Matt Layher <mdlayher@gmail.com>
Message-ID: <6ee30b21-704c-f63b-b725-949497e38ecb@gmail.com>
Date: Wed, 8 Aug 2018 23:54:36 -0400
MIME-Version: 1.0
In-Reply-To: <CAHmME9qyZQ-XQ0GDcoBAK8PdDr444Le5i0wq15un4oROKSj1AQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I can confirm that this is fixed for me as of latest master:

$ dmesg | grep wireguard
[   50.396241] wireguard: module verification failed: signature and/or 
required key missing - tainting kernel
[   50.396675] wireguard: WireGuard 0.0.20180802-11-gc6505ee loaded. See 
www.wireguard.com for information.
[   50.396675] wireguard: Copyright (C) 2015-2018 Jason A. Donenfeld 
<Jason@zx2c4.com>. All Rights Reserved.

$ sudo ip link add dev wg0 type wireguard

$ sudo ./wgnlbug -n 2
before: wg0
  after: wg0
- peer: ZoJIpwr1iel/9emt2bNlnHhvasjZdmUD6v92Ry8z1Ro=: 0 IPs
- peer: y84s8m/91ryGV8tTQbycauYcukCjrAG1B8vx44BsxWM=: 511 IPs

$ sudo wg show
interface: wg0

peer: ZoJIpwr1iel/9emt2bNlnHhvasjZdmUD6v92Ry8z1Ro=
   allowed ips: (none)

peer: y84s8m/91ryGV8tTQbycauYcukCjrAG1B8vx44BsxWM=
   allowed ips: 2001:db8::1ff/128, 2001:db8::1fe/128, ...

Thanks for the quick patch.  I started with a pretty naive approach on 
my netlink message chunking implementation, but I'm glad I was able to 
help find a problem that way.

I'll be sure to report anything else I find, but at this point, I think 
I'm feature-complete for both userspace and kernel APIs.

- Matt


On 08/08/2018 10:20 PM, Jason A. Donenfeld wrote:
> On Wed, Aug 8, 2018 at 5:30 PM Matt Layher <mdlayher@gmail.com> wrote:
>> Excellent! That's much more concise.
> Let me know if this fixes it for you, and please do keep messing with
> weird cases to see if you can find more bugs. I really appreciate you
> finding this.
>
> https://git.zx2c4.com/WireGuard/commit/?id=fd60e07ba3e294b94985a42d11afebf55f1d8829
