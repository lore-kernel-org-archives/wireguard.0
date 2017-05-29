Return-Path: lazyvirus@gmx.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0fb46c07
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 May 2017 20:30:56 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4bda257b
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 May 2017 20:30:56 +0000 (UTC)
Date: Mon, 29 May 2017 22:43:47 +0200
From: Bzzzz <lazyvirus@gmx.com>
To: Ibrahim Tachijian <barhom@netsat.se>
Subject: Re: Multiple peers to one wireguard "server"
Message-ID: <20170529224347.056ab480@msi.defcon1>
In-Reply-To: <CACTq0bRv6KcKCvw3iYnkeFU+vvr0WTgHU5nT=TskYQ7F5NodmA@mail.gmail.com>
References: <CACTq0bRv6KcKCvw3iYnkeFU+vvr0WTgHU5nT=TskYQ7F5NodmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, 29 May 2017 20:31:36 +0000
Ibrahim Tachijian <barhom@netsat.se> wrote:

> If I understand correctly if I need to connect 10 different wg
> "clients" to one wg "server" I will require one wgX interface
> per-client on the "server".
> 
> Is this correct?

No, it means you'll have wg0 and 10 [Peer] sections into your server
configuration file.

Jean-Yves
