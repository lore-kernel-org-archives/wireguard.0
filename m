Return-Path: rm@romanrm.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa2c4450
 for <wireguard@lists.zx2c4.com>; Mon, 3 Sep 2018 10:41:26 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [IPv6:2001:41d0:1:8055::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ef9f63d
 for <wireguard@lists.zx2c4.com>; Mon, 3 Sep 2018 10:41:26 +0000 (UTC)
Date: Mon, 3 Sep 2018 15:55:49 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Ole-Morten Duesund <olemd@glemt.net>
Subject: Re: Wireguard behind NAT
Message-ID: <20180903155549.0677bf87@natsu>
In-Reply-To: <429987c9-26e4-edb7-4d31-c8e611615670@glemt.net>
References: <CA+Hw3eb7rEuDyuzq9dCj71KAYK3hRni0EDiz5j1ZpKjVwBo-Xg@mail.gmail.com>
 <429987c9-26e4-edb7-4d31-c8e611615670@glemt.net>
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

On Mon, 3 Sep 2018 12:43:19 +0200
Ole-Morten Duesund <olemd@glemt.net> wrote:

> Adding a "PersistentKeepalive = 5" to your config on SIDE_A_SERVER 
> should keep the connection up.

Do you encounter any difference between 5, 25 and 55, only 5 works for you? If
not, setting it to such a low interval seems wasteful, especially on
LTE/mobile with possibly metered bandwidth and battery concerns.

-- 
With respect,
Roman
