Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 174803aa
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 Nov 2016 16:04:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75f7058f
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 Nov 2016 16:04:30 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c362e77c
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 Nov 2016 16:04:30 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id f82so32946672wmf.1
 for <wireguard@lists.zx2c4.com>; Tue, 22 Nov 2016 08:08:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161122121748.GF20343@tuxmachine.polynome.dn42>
References: <20161122121748.GF20343@tuxmachine.polynome.dn42>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 22 Nov 2016 17:08:02 +0100
Message-ID: <CAHmME9rCpUtxsCmKrdAXBu466iLrTajQt5goc6NvtUU_5QbjHQ@mail.gmail.com>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Is nf_conntrack really needed?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey,

In fact, it's not needed if it's not needed. How to explain this
apparent tautology?

If conntracking is compiled into the kernel, then for ICMP, I need to
ask conntracking if it's possibly mangled the src IP of the packet
before giving it to the wireguard device. If conntracking isn't
compiled into the kernel, then there's nobody to ask and probably the
packet wasn't mangled, in which case, I don't need to do anything. So,
the following patch makes conntrack optional:

https://git.zx2c4.com/WireGuard/commit/?id=c90fba009d70eedac614d77ad3494ed450b2995e

This will be included in the next snapshot.

Jason
