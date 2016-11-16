Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 522977d8
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 17:36:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 01765e34
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 17:36:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 44278f44
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 17:36:56 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id t79so88032132wmt.0
 for <wireguard@lists.zx2c4.com>; Wed, 16 Nov 2016 09:39:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAKXLc7fZYEejEu0FmATWX6_8aAPRUxkPL429UK-39TGsFF4aUA@mail.gmail.com>
References: <CAKXLc7fZYEejEu0FmATWX6_8aAPRUxkPL429UK-39TGsFF4aUA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 16 Nov 2016 18:39:45 +0100
Message-ID: <CAHmME9ordFZD8ESpTr9BEsedocoFDWjBwkWf43ke4X-m-bvibQ@mail.gmail.com>
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] RFE: A notion of VERSION (was: Debugging AllowedIps)
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

The best I could come with:

> WIREGUARD_VERSION := $(shell parent_name=$$(readlink -f .. | sed -n 's:.*/[wW]ire[Gg]uard[a-z-]*-\([0-9.]\+\)$$:\1:p');  if [ -d ../.git ]; then echo "git-$$(git rev-parse --shor
t HEAD)"; elif [ -n $parent_name ]; then echo "$$parent_name"; else
echo "unknown"; fi)

Is this reliable, or is this garbage?
