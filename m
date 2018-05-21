Return-Path: joerg@higgsboson.tk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 855911fb
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 May 2018 12:45:05 +0000 (UTC)
Received: from mail.thalheim.io (mail.thalheim.io [188.68.39.17])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51e6b97f
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 May 2018 12:45:05 +0000 (UTC)
Received: from [129.215.90.191] (dhcp-90-191.inf.ed.ac.uk [129.215.90.191])
 by mail.thalheim.io (Postfix) with ESMTPSA id C037D5E09
 for <wireguard@lists.zx2c4.com>; Mon, 21 May 2018 12:46:02 +0000 (UTC)
Subject: Re: [PATCH] Adopt Go workspace best practices
To: wireguard@lists.zx2c4.com
References: <1526842622.607158.1378580648.4BA3B2F0@webmail.messagingengine.com>
From: =?UTF-8?Q?J=c3=b6rg_Thalheim?= <joerg@higgsboson.tk>
Message-ID: <8a3ad189-bef5-61cf-05a1-0801d6be6161@higgsboson.tk>
Date: Mon, 21 May 2018 13:46:02 +0100
MIME-Version: 1.0
In-Reply-To: <1526842622.607158.1378580648.4BA3B2F0@webmail.messagingengine.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>



On 2018-05-20 19:57, Filippo Valsorda wrote:
> Relative imports break when the project is built from within GOPATH,
> where most Go developers prefer to develop:
>
>     device.go:10:2: local import "./ratelimiter" in non-local package
>     tun_darwin.go:10:2: local import "./rwcancel" in non-local package
>     noise-protocol.go:10:2: local import "./tai64n" in non-local package
>     cookie.go:10:2: local import "./xchacha20poly1305" in non-local package


We also carry a patch for this in nixpkgs for that reason:
https://github.com/NixOS/nixpkgs/commit/b599f672e44270d2c6154b7855ddec11e4d43a93#diff-b3f319067b7e71fdd1f6b94ef51a983aR17

>
> On the other hand, the vendor folder is not supported outside of
> GOPATH, so it's unclear how/if that ever worked.
>
> Moreover, using go get instead of dep means that dependencies are not
> pinned, and HEAD is used instead, which makes builds unreproducible.
>
> This adds a Makefile that creates a local GOPATH with a symlink
> trick, so developing outside GOPATH still works. Not only that, but
> a system GOPATH is not required at all as long as the Makefile is used.
> And if the project is cloned in the right place in GOPATH all standard
> tools will work as expected.
>
> So all workflows should work just as weel or better. The only new
> requirement is dep, but that's unavoidable for reproducible builds.
>
> Finally, run goimports on all files to format import statements.
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
