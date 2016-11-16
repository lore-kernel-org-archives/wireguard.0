Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db7efccc
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 17:37:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b4d5d0c
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 17:37:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1e318f95
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 17:37:41 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id g23so254778204wme.1
 for <wireguard@lists.zx2c4.com>; Wed, 16 Nov 2016 09:40:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9ordFZD8ESpTr9BEsedocoFDWjBwkWf43ke4X-m-bvibQ@mail.gmail.com>
References: <CAKXLc7fZYEejEu0FmATWX6_8aAPRUxkPL429UK-39TGsFF4aUA@mail.gmail.com>
 <CAHmME9ordFZD8ESpTr9BEsedocoFDWjBwkWf43ke4X-m-bvibQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 16 Nov 2016 18:40:30 +0100
Message-ID: <CAHmME9oDp1R87utxJaL6hHimDedC66RVr+Hj_DXp07wc-jRynQ@mail.gmail.com>
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

Trying again with no line breaks:

> WIREGUARD_VERSION :=3D $(shell parent_name=3D$$(readlink -f .. | sed -n '=
s:.*/[wW]ire[Gg]uard[a-z-]*-\([0-9.]\+\)$$:\1:p');  if [ -d ../.git ]; then=
 echo "git-$$(git rev-parse --short HEAD)"; elif [ -n $parent_name ]; then =
echo "$$parent_name"; else echo "unknown"; fi)
