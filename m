Return-Path: rm@romanrm.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae5cb2a6
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Aug 2018 18:54:35 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [IPv6:2001:41d0:1:8b3b::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 080d13dc
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Aug 2018 18:54:35 +0000 (UTC)
Date: Mon, 13 Aug 2018 00:06:11 +0500
From: Roman Mamedov <rm@romanrm.net>
To: StarBrilliant <coder@poorlab.com>
Subject: Re: Fragmentation on UDP layer possible?
Message-ID: <20180813000611.3296fa66@natsu>
In-Reply-To: <CA+7UkwLpoa_n87PKghohdGc5JVpYJdjAB1a8NUpYjx35o5nPWw@mail.gmail.com>
References: <CA+7UkwLpoa_n87PKghohdGc5JVpYJdjAB1a8NUpYjx35o5nPWw@mail.gmail.com>
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

On Mon, 13 Aug 2018 02:53:44 +1000
StarBrilliant <coder@poorlab.com> wrote:

> I know Wireguard can already do IP layer fragmentation. (Just set
> tunnel MTU >= 1441 then fragmentation will be turned on)

Is that really expected to work? I tried setting MTU 9000 on both ends of a WG
tunnel, but large packets still do not seem to come through properly. Did you
try using it like that in any kind of environment (aside from that one
restrictive network)?

In theory using MTU 9000 or such would help lower the huge overhead percentage
of running IP over VXLAN over IP over WG over IP. I was looking into that the
other day, but my idea was to fragment VXLAN packets across multiple WG ones,
which turned out to be impossible (VXLAN RFC forbids fragmentation).

-- 
With respect,
Roman
