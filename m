Return-Path: aranea@aixah.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb74b533
 for <wireguard@lists.zx2c4.com>; Tue, 5 Dec 2017 02:47:12 +0000 (UTC)
Received: from wp260.webpack.hosteurope.de (wp260.webpack.hosteurope.de
 [80.237.133.29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6bf629a
 for <wireguard@lists.zx2c4.com>; Tue, 5 Dec 2017 02:47:12 +0000 (UTC)
Date: Tue, 5 Dec 2017 03:53:52 +0100
From: Luis Ressel <aranea@aixah.de>
To: wireguard@lists.zx2c4.com
Subject: Re: Standardized IPv6 ULA from PublicKey
Message-ID: <20171205035352.01ffe1f5@vega.skynet.aixah.de>
In-Reply-To: <372AE79B-69E5-4B18-926C-E402FDFB2E95@lonnie.abelbeck.com>
References: <372AE79B-69E5-4B18-926C-E402FDFB2E95@lonnie.abelbeck.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, 4 Dec 2017 10:52:28 -0600
Lonnie Abelbeck <lists@lonnie.abelbeck.com> wrote:

> Hi,
> 
> Has anyone thought about a standardized WireGuard IPv6 ULA generated
> from the PublicKey ?

This was indeed already discussed, albeit not for ULAs, but link-local
addresses (fe80::/64). IIRC, Jason rejected it citing the KISS
principle -- and I fully agree with that. Adding a hundred small
features useful for certain corner cases is a sure way to transform
wireguard into a behemoth of ipsec/openvpn dimensions. :)

Cheers,
Luis Ressel
