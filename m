Return-Path: germano.massullo@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cbb4a029
 for <wireguard@lists.zx2c4.com>; Sun, 5 Nov 2017 16:55:53 +0000 (UTC)
Received: from mail-ua0-f178.google.com (mail-ua0-f178.google.com
 [209.85.217.178])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a0c89dc1
 for <wireguard@lists.zx2c4.com>; Sun, 5 Nov 2017 16:55:53 +0000 (UTC)
Received: by mail-ua0-f178.google.com with SMTP id n22so4937716uaj.13
 for <wireguard@lists.zx2c4.com>; Sun, 05 Nov 2017 08:58:53 -0800 (PST)
MIME-Version: 1.0
From: Germano Massullo <germano.massullo@gmail.com>
Date: Sun, 5 Nov 2017 17:58:52 +0100
Message-ID: <CAGa=++SYvYFBdFFAcZuoz+O3enV_=nAQMABYx3xx8qY0yAZSKA@mail.gmail.com>
Subject: Suggestions for creating a VPN network
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi there, I am going to start using Wireguard, so I read the
whitepaper and the online documentation on the website. I am writing
to you to ask you some suggestions about a kind of network I would
like to setup, since there could be various different ways to
implement what I have in my mind. Here my use case:
a server has eth1 network interface that is the slave interface of
bridge br0. Many Linux virtual machines (qemu/libvirt) are connected
to br0, and they have public IPs. Now let's name one of them 'vm3'.
I would like to create a certain amount of virtual machines that:
- do not have public IPs;
- are in a Wireguard VPN (let's call it 'wireguard_vpn');
- use vm3 as gateway to the internet.

Moreover, hosts from the internet must be able to connect to
wireguard_vpn, possibly through vm3.

It looks like that example "The New Namespace Solution" of
https://www.wireguard.com/netns/ is a good way to start configuring
vm3.

What do you think about?
Thank you for your time
