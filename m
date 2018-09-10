Return-Path: ju.orth@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f7fc82d
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Sep 2018 07:15:33 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d39d565
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Sep 2018 07:15:33 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id j26-v6so20711000wre.2
 for <wireguard@lists.zx2c4.com>; Mon, 10 Sep 2018 00:16:15 -0700 (PDT)
Return-Path: <ju.orth@gmail.com>
Subject: Re: Setting the transit namespace at runtime
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <CAHijbEWf1S0Tc+zxZBvmJ0xe5iBU00pOxikejetF8x33Qh=GcQ@mail.gmail.com>
 <CAHmME9rB71UbcY-kLkJO0yOVQ-s31E_S9yCKdZTh6F9-PScN5A@mail.gmail.com>
 <CAHijbEX8cRGA3_NFdRqFCraLns_UhaSbX0yFJTax8bsFvAP9XQ@mail.gmail.com>
 <CAHmME9qYX8AEtOWo-u2E90mnKy+HeT-cb8KH8b9q3GUsmjxzDg@mail.gmail.com>
From: Julian Orth <ju.orth@gmail.com>
Message-ID: <ea71ea95-b0ab-2b88-72b5-90089e216c2a@gmail.com>
Date: Mon, 10 Sep 2018 09:16:11 +0200
MIME-Version: 1.0
In-Reply-To: <CAHmME9qYX8AEtOWo-u2E90mnKy+HeT-cb8KH8b9q3GUsmjxzDg@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------55ED723FEDDA92D0302B4DEA"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------55ED723FEDDA92D0302B4DEA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello Jason,

> That looks to me like a security vulnerability. User namespace sets
> listen-port to < 1024, and then moves it into the target namespace,
> and bam, controls subverted.

Luckily this is not the case. The kernel code called by Wireguard to create a
socket already checks that the executing program has the correct capabilities
in the transit namespace. In the case you described, the call will fail if the
program does not have CAP_NET_BIND_SERVICE in the transit namespace.

To be clear: Moving the socket involves creating a new one in the target
namespace and closing the old one.

V1 of this series did, however, have a security vulnerability. It did not
check if the program could create a socket in the transit namespace. While
creating a socket in your current network namespace requires no capabilities,
creating a socket in another network namespace requires CAP_SYS_ADMIN in that
namespace:

* Linux provides no syscalls to create a socket in a network namespace except
  for your current namespace.
* Therefore you first have to enter this namespace to create the socket.
* Entering a network namespace requires CAP_SYS_ADMIN in that namespace.

I've talked about this in more detail here: [1].

In V2 I have therefore added the following capability check: To change the
listen-port or the transit-netns, the caller must have CAP_NET_ADMIN in the
transit namespace.

At the same time, I've introduced a way to skip this capability check: If the
caller can prove that he could implement Wireguard in userspace in the desired
transit namespace, then he is allowed to open the socket without
CAP_NET_ADMIN. The caller proves this by passing UDP sockets from the transit
namespace into the kernel. And indeed, if Wireguard refused her, then she
could simply bind these sockets to the desired port and run a userspace
implementation of Wireguard.

Julian

[1] https://lists.zx2c4.com/pipermail/wireguard/2018-September/003342.html

PS: I've attached my key.

--------------55ED723FEDDA92D0302B4DEA
Content-Type: application/vnd.ms-publisher;
 name="id_wireguard.pub"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="id_wireguard.pub"

c3NoLWVkMjU1MTkgQUFBQUMzTnphQzFsWkRJMU5URTVBQUFBSUhUVjhTUnZtTGMyM250U0Jx
SGVvdEFnUUw5alFFWGVYWko0UXRUZkRaUnQganUub3J0aEBnbWFpbC5jb20K
--------------55ED723FEDDA92D0302B4DEA--
