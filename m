Return-Path: ju.orth@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 90f4321c
 for <wireguard@lists.zx2c4.com>; Mon, 3 Sep 2018 16:02:43 +0000 (UTC)
Received: from mail-io0-x229.google.com (mail-io0-x229.google.com
 [IPv6:2607:f8b0:4001:c06::229])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 247e5175
 for <wireguard@lists.zx2c4.com>; Mon, 3 Sep 2018 16:02:43 +0000 (UTC)
Received: by mail-io0-x229.google.com with SMTP id q4-v6so772904iob.8
 for <wireguard@lists.zx2c4.com>; Mon, 03 Sep 2018 09:17:09 -0700 (PDT)
MIME-Version: 1.0
From: Julian Orth <ju.orth@gmail.com>
Date: Mon, 3 Sep 2018 18:16:58 +0200
Message-ID: <CAHijbEWf1S0Tc+zxZBvmJ0xe5iBU00pOxikejetF8x33Qh=GcQ@mail.gmail.com>
Subject: Setting the transit namespace at runtime
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

Hi,

Each Wireguard device remembers the network namespace in which it was created.
In the documentation this is called the birthplace namespace [1] but I'll be
calling it the transit namespace.

Let's say I create a Wireguard device `wg0` in a network namespace called
`vpn`. Then I would like to be able to run

# wg set wg0 transit-namespace /proc/1/ns/net

to change the Wireguard UDP socket to live in the init namespace.

This has the following advantages over creating the device in the init
namespace and then moving it to the `vpn` namespace:

* If multiple processes are creating Wireguard devices at the same time, then
  their device namespaces are isolated as long as each process uses its own
  network namespace. This means that there is no problem if two processes try
  to create the `wg0` device at the same time.
* The intention is for the `wg0` device to be used only within the `vpn`
  namespace. It does not feel clean that the device has to live in the init
  namespace for an arbitrarily short but non-zero amount of time. This also
  leaks the existence of the `wg0` device to all processes living in the init
  namespace.

Could such a feature be implemented?

Julian

[1] https://www.wireguard.com/netns/
