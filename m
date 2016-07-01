Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e3d3cb6e
 for <wireguard@lists.zx2c4.com>; Fri, 1 Jul 2016 02:05:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7df7f635
 for <wireguard@lists.zx2c4.com>; Fri, 1 Jul 2016 02:05:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 66fb8885
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 1 Jul 2016 02:05:17 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id h129so67796251lfh.1
 for <wireguard@lists.zx2c4.com>; Thu, 30 Jun 2016 19:08:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1467327323-8532-3-git-send-email-dkg@fifthhorseman.net>
References: <1467327323-8532-1-git-send-email-dkg@fifthhorseman.net>
 <1467327323-8532-3-git-send-email-dkg@fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 1 Jul 2016 04:08:08 +0200
Message-ID: <CAHmME9p79wUVkdUX30dgrJ28rMkX13ywAi-4OBg+agiZdEijQQ@mail.gmail.com>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] [PATCH 3/4] Explain the optional nature of
 Peer.EndPoint more clearly
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I'm merging a commit with some of these suggested changes for 1,2,4.
Thanks for those. But the changes here are simply not correct.

The endpoint is simply the initial endpoint used to contact the peer.
If the peer sends legit traffic from a different endpoint, it will be
updated to that new endpoint. So, specifying an endpoint doesn't bind
traffic to that endpoint. It's simply an initial specifier of it.
Otherwise, how does traffic get started flowing?
