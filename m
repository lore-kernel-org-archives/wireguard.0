Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 34431524
 for <wireguard@lists.zx2c4.com>;
 Sat, 12 Nov 2016 02:16:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e94c0758
 for <wireguard@lists.zx2c4.com>;
 Sat, 12 Nov 2016 02:16:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ee28b886
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 12 Nov 2016 02:16:17 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id o141so24236822lff.1
 for <wireguard@lists.zx2c4.com>; Fri, 11 Nov 2016 18:18:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <31e050e2-0499-a77e-f698-86e58ad2fa6b@cumulusnetworks.com>
References: <CAHmME9qi7_C7c=wsZg=EwBg3jzFzVmW1eiFGGXgcX8fCcOOZcA@mail.gmail.com>
 <31e050e2-0499-a77e-f698-86e58ad2fa6b@cumulusnetworks.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 12 Nov 2016 03:18:31 +0100
Message-ID: <CAHmME9o_AM1Lms6CJSpbjfAgcyGuRx8yqwSaNWEbSnY7gGnt6w@mail.gmail.com>
To: David Ahern <dsa@cumulusnetworks.com>
Content-Type: text/plain; charset=UTF-8
Cc: Netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Source address fib invalidation on IPv6
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi David,

On Fri, Nov 11, 2016 at 11:14 PM, David Ahern <dsa@cumulusnetworks.com> wrote:
> What do you mean by 'valid dst'? ipv6 returns net->ipv6.ip6_null_entry on lookup failures so yes dst is non-NULL but that does not mean the lookup succeeded.

What I mean is that it returns an ordinary dst, as if that souce
address _hadn't_ been removed from the interface, even though I just
removed it. Is this buggy behavior? If so, let me know and I'll try to
track it down. The expected behavior, as far as I can see, would be
the same that ip_route_output_flow has -- returning -EINVAL when the
saddr isn't valid. At the moment, when the saddr is invalid,
ipv6_stub->ipv6_dst_lookup returns 0 and &dst contains a real entry.

Regards,
Jason
