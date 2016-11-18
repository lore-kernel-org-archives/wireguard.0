Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 747d6931
 for <wireguard@lists.zx2c4.com>;
 Fri, 18 Nov 2016 04:57:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53073f08
 for <wireguard@lists.zx2c4.com>;
 Fri, 18 Nov 2016 04:57:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4a30212c
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 18 Nov 2016 04:57:48 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id a197so14291939wmd.0
 for <wireguard@lists.zx2c4.com>; Thu, 17 Nov 2016 21:00:50 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9oPuqAaQe1VKjjoy_VBwBe70TiKW_NJPs46HpBZyKj2RA@mail.gmail.com>
References: <CAKXLc7fZYEejEu0FmATWX6_8aAPRUxkPL429UK-39TGsFF4aUA@mail.gmail.com>
 <CAHmME9ordFZD8ESpTr9BEsedocoFDWjBwkWf43ke4X-m-bvibQ@mail.gmail.com>
 <CAHmME9oDp1R87utxJaL6hHimDedC66RVr+Hj_DXp07wc-jRynQ@mail.gmail.com>
 <87shqr6sw1.fsf@alice.fifthhorseman.net>
 <CAHmME9oPuqAaQe1VKjjoy_VBwBe70TiKW_NJPs46HpBZyKj2RA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 18 Nov 2016 06:00:48 +0100
Message-ID: <CAHmME9qWoStPA8evwkjH7OPGioGHsVoOsiie2ognTmmBo1c9WQ@mail.gmail.com>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
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

https://git.zx2c4.com/WireGuard/commit/?id=258d0b33a5087558447b319273c37c89445d3ae0

There we go. My release script looks like this:

zx2c4@thinkpad ~/Projects/WireGuard $ cat maint/release.sh
#!/bin/sh
set -ex
cd "$(dirname "$(readlink -f "$0")")/.."
date="$(date +%Y%m%d)"
tag="experimental-0.0.$date"
git reset --hard
sed -i "s/\".*\"/\"$tag\"/" src/version.h
git update-index --no-assume-unchanged src/version.h
git add src/version.h
git commit -m "version: bump snapshot"
git tag "$tag" --sign -m "Experimental snapshot $date"
