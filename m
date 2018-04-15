Return-Path: rm@romanrm.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bda0ef82
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 18:43:37 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [91.121.86.59])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28762452
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 18:43:37 +0000 (UTC)
Date: Sun, 15 Apr 2018 23:58:01 +0500
From: Roman Mamedov <rm@romanrm.net>
To: "Patrick O'Sullivan" <irish@insaneirish.com>
Subject: Re: Why does 'allowed-ips' affect route selection behavior?
Message-ID: <20180415235801.411a50af@natsu>
In-Reply-To: <CA+bb15uz7jkD2GZhSQANkH9JPi5Sq2g20wrm0avTRFiOMJ55iA@mail.gmail.com>
References: <CA+bb15uz7jkD2GZhSQANkH9JPi5Sq2g20wrm0avTRFiOMJ55iA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sun, 15 Apr 2018 14:49:23 -0400
"Patrick O'Sullivan" <irish@insaneirish.com> wrote:

> $ sudo ip route get 4.2.2.1
> 4.2.2.1 dev wg0 table 51820 src 10.111.111.100
                  ^^^^^^^^^^^
>     cache

> Can someone please explain this behavior?

Probably will be easier to do if you show the output of "ip -4 rule".

-- 
With respect,
Roman
