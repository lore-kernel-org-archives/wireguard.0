Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ca7ebe6c
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Feb 2018 14:35:20 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id adf4f34d
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Feb 2018 14:35:20 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c9afedbe
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Feb 2018 14:26:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8edf635e
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Feb 2018 14:26:29 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id t145so1380449oif.8
 for <wireguard@lists.zx2c4.com>; Thu, 15 Feb 2018 06:42:20 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 15 Feb 2018 15:42:19 +0100
Message-ID: <CAHmME9q5SW+K-1NGAFoFw7i-J6J-Nr55s5K6cYAY2B1VyR6cjw@mail.gmail.com>
Subject: Single-file C Embeddable Library for WireGuard Device Configuration
To: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Toke & List,

There's been some interest in integrating WireGuard configuration into
various utilities, such as bird, babel, networkmanager, and more.
Indeed shelling out to wg(8) is sub-par for core networking utilities,
such as routing daemons. Unfortunately, Netlink is horrible in so many
ways, and -- with the single exception of Joerg Thalheim's heroic
hustle with systemd-networkd -- people tend to get discouraged pretty
quickly when trying to do the WireGuard Netlink dance and importing
Netlink library dependencies, and so forth. I'm still displeased about
having to move away from a simpler API at the behest of upstream, but
such is life.

In order to make things more pleasant, I've made a single-file C
library, which is meant to be copy and pasted directly into your
application, and then tweaked as needed. It currently exports a few
simple methods for managing the device:

int wg_set_device(wg_device_t *dev);
int wg_get_device(wg_device_t **dev, const char *device_name);
void wg_free_device(wg_device_t *dev);
char *wg_list_device_names(void); /* first\0second\0third\0forth\0last\0\0 */

And some helper methods for dealing with keys with constant-time algorithms:

void wg_key_to_base64(wg_base64_string_key_t base64, const wg_key_t key);
bool wg_key_from_base64(wg_key_t key, const wg_base64_string_key_t base64);
bool wg_key_is_zero(const wg_key_t key);

And some handy macro iterators:

#define wg_for_each_device_name(__names, __name, __len)
#define wg_for_each_peer(__dev, __peer)
#define wg_for_each_allowedip(__peer, __allowedip)

The README has more info here:

https://git.zx2c4.com/WireGuard/tree/contrib/examples/embeddable-wg-library/README

It only depends on libc, and compiles with pretty much any C compiler.

I expect that some people might not need all the functionality, in
which case, simply deleting what you don't need is an easy
possibility. Others will need to change calling conventions or types
or file descriptor management or memory allocators, and that's fine
too. The point is that it's just a little chunk of nice code, from
which you can craft your WireGuard integration.

Enjoy!

Jason
