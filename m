Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d03d60f2
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Dec 2016 17:57:52 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d2abaa8
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Dec 2016 17:57:51 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 61f9b78c
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Dec 2016 17:57:51 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 185553a8
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Dec 2016 17:57:51 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id y198so125775867oia.1
 for <wireguard@lists.zx2c4.com>; Sun, 18 Dec 2016 10:04:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1d684ee8-9f6c-a9f0-4cec-df0116cb97b7@mib-infotech.co.nz>
References: <CAHmME9o_BzZRj2HVpQMUxE7t1DS_NcHJWXe8zsvndNbwu+j+Qg@mail.gmail.com>
 <1d684ee8-9f6c-a9f0-4cec-df0116cb97b7@mib-infotech.co.nz>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 18 Dec 2016 19:04:39 +0100
Message-ID: <CAHmME9oZmH5mRyCySGRssQ0ytDuaUUe-Qo5ycnMHkL9stVwYAA@mail.gmail.com>
Subject: Re: MTU
To: John Huttley <john@mib-infotech.co.nz>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey John,

The old WireGuard gave you a default MTU of 1423. The new one gives
you a default MTU of 1420. That's your minus 3. From your email, it
looks like you subtracted twice!

If you're not using IPv6 as the outer endpoint IP address, then you
can make this 1440. The breakdown of the wireguard packet is:

20 byte IPv4 header or 40 byte IPv6 header
8 byte UDP header
1 byte type
3 byte reserved
4 byte index
8 byte nonce
CIPHERTEXT
16 byte authtag

So either you wind up with 20+8+1+3+4+8+16 bytes of overhead, or you
wind up with 40+8+1+3+4+8+16 bytes of overhead.

Regards,
Jason
