Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b7e3957
 for <wireguard@lists.zx2c4.com>; Tue, 1 Nov 2016 20:08:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 57a6488b
 for <wireguard@lists.zx2c4.com>; Tue, 1 Nov 2016 20:08:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 32e8dce9
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 1 Nov 2016 20:08:43 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id b14so955013lfg.2
 for <wireguard@lists.zx2c4.com>; Tue, 01 Nov 2016 13:09:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <25C77A0A-9EAB-4B87-AF85-D590F972F332@danrl.com>
References: <25C77A0A-9EAB-4B87-AF85-D590F972F332@danrl.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 1 Nov 2016 21:09:41 +0100
Message-ID: <CAHmME9p8bYDF9StPW8EHNXGEguK=Fomb9CE6yd9h0gZwWo=5pg@mail.gmail.com>
To: =?UTF-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Wireguard on OpenWRT/LEDE (here: Luci)
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

 Hey Dan,

This looks beautiful! Thanks for writing it. I'm not a LEDE dev, but I
do have a small bit of preliminary feedback, below.

Thanks for writing this. I'm thrilled!

Jason


1. The first screenshot should be cropped before the start of the
"Peers" section creeps in. Otherwise it looks like there are two
sections for peers. This confused me a bit at first.

2.
- listen_port.placeholder = "500"
+ listen_port.placeholder = "51820"

3. "addresses.placeholder = "fd00:13:37::1/64"" -- might be nice to
give a v4 example too.

4.
- "cryptography for post-quantum resistance")
+ "cryptography for post-quantum resistance.")

5. "Names are resolved prior to establishing the connection for the
first time." It might be more accurate to say that they're resolved at
the time the interface is configured/brought up.

6.
- endpoint.placeholder = "vpn.example.com:500"
+ endpoint.placeholder = "vpn.example.com:51820"

7.
- persistent_keepalive.datatype = "range(0, 3600)"
+ persistent_keepalive.datatype = "range(0, 65535)"

8. This one is more important than it may seem at first, but please
keep the terminology straight and explicit:
- translate("Keep Alive"),
+ translate("Persistent Keep Alive"),

9. ${iface} should be quoted -- "${iface}"

10. 1>/dev/null 2>/dev/null can be shortened to the more idiomatic
>/dev/null 2>&1

11. The existing logic for adding a device is to add it if it doesn't
exist, and otherwise to flush the addresses. Is it a good idea to
flush the routes too? Or simply delete and re-add? Or is a simple
flush of the addresses standard LEDE behavior? I'll defer to Baptiste
(CC'd) on this.

12. mkdir -p is non fatal if the path already exists, so you don't
need to do the -d check before.

13. Touching the configuration file and then recursively chmodding is
not the right way to do things. It opens you up to other types of
security vulnerabilities. Instead, use umask.

Putting 12 and 13 together, we have:

- [ -d "${wg_dir}" ] || mkdir -p "${wg_dir}"
- [ -f "${wg_cfg}" ] || touch "${wg_cfg}"
- chmod -R 0600 "${wg_dir}"
+ umask 077
+ mkdir -p "${wg_dir}"

14.
- allowed_ips=$(echo $allowed_ips | tr ' ' ',')
+ allowed_ips="$(echo "$allowed_ips" | tr ' ' ',')"

You might also want to replace all instances of ,, with , after this
transformation until there aren't any ,, left  just to maintain
sanity.

15. On tear-down, why not just unconditionally delete?
