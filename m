Return-Path: rm@romanrm.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e08fbd43
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 14:52:28 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [91.121.86.59])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94918311
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 14:52:28 +0000 (UTC)
Date: Fri, 10 Aug 2018 20:03:46 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Brian Candler <b.candler@pobox.com>
Subject: Re: Reflections on WireGuard Design Goals
Message-ID: <20180810200346.0e9646ac@natsu>
In-Reply-To: <b66a15d1-c4f1-78a5-cf5a-4d2a4ca9ce54@pobox.com>
References: <mailman.1318.1533866648.2201.wireguard@lists.zx2c4.com>
 <b66a15d1-c4f1-78a5-cf5a-4d2a4ca9ce54@pobox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, 10 Aug 2018 14:35:14 +0100
Brian Candler <b.candler@pobox.com> wrote:

>  From my point of view, the only thing which makes me uncomfortable=20
> about wireguard is the lack of any second authentication factor. Your=20
> private key is embedded in a plaintext file in your device (e.g.=20
> laptop), not even protected with a passphrase.=C2=A0 Anyone who gains acc=
ess=20
> to that laptop is able to establish wireguard connections.
>=20
> Of course, it can be argued that the laptop holds other information=20
> which is more valuable that the wireguard key, therefore you should=20
> concentrate on properly securing the laptop itself (*). Furthermore, to=20
> be able to talk to the wireguard kernel module you're already root, and=20
> therefore have all sorts of malicious options available to you. etc etc
>=20
> But I'd feel a lot happier if a second level of authentication were=20
> required to establish a wireguard connection, if no packets had been=20
> flowing for more than a configurable amount of time - say, an hour. It=20
> would give some comfort around lost/stolen devices.

Couldn't you just encrypt your home directory? Or even the root FS entirely.
Either of those should be a must on a portable device storing valuable
information.

--=20
With respect,
Roman
