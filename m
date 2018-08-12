Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0453c3d0
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Aug 2018 08:01:42 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c77430e
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Aug 2018 08:01:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a721fe7
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Aug 2018 08:00:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 61dd0dfb
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Aug 2018 08:00:28 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id w126-v6so22469859oie.7
 for <wireguard@lists.zx2c4.com>; Sun, 12 Aug 2018 01:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20180810080617.20283-1-ahanins@gmail.com>
In-Reply-To: <20180810080617.20283-1-ahanins@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 12 Aug 2018 01:13:06 -0700
Message-ID: <CAHmME9pCdYSc5vLUJt_7xkCG9PLMkQE5qMMbrxQ9uCq0U0KL-Q@mail.gmail.com>
Subject: Re: [PATCH 0/1] Fix broken inner checksums for non TCP/UDP protocols
To: ahanins@gmail.com
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Andrejs,

Thanks a lot for this patch and for the nice write-up. I'm still not
sure, though, that I totally understand the checksumming semantics
properly. I see that this basic pattern is used in tap.c and in a few
other random drivers, but different places seem to do it differently
from that too.

Your paranoid proposal at the end of your description would be
something like this?

> if (skb->ip_summed == CHECKSUM_PARTIAL || !skb_checksum_setup(skb, true)) {
>    if (skb_checksum_help(skb))
>        return false;
> }

And the bug you're pointing out is that skb_checksum_setup returns
-EPROTO in the case of GRE and such, because a child function,
skb_checksum_setup_ip, only works for UDP/TCP?

Do you know why there exist these two separate functions in the first
place, and what the preferred use cases are for each one? Also, do you
know about the relative performance of them and how your patch or the
paranoid variant above would impact that?

Thanks,
Jason
