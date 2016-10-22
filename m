Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e185ff11
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Oct 2016 07:55:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f2d8d29c
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Oct 2016 07:55:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 226b78bb
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Oct 2016 07:55:45 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id x79so169578361lff.0
 for <wireguard@lists.zx2c4.com>; Sat, 22 Oct 2016 00:56:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5809E3E0.20338.7C6D35E@pageexec.gmail.com>
References: <87mvi0jxsb.fsf@toke.dk>
 <5809CB98.15179.767FB18@pageexec.gmail.com>
 <CAHmME9oAnWiN8fx5dGP6+i+rTdxH4fMfxmbsr56Ey7viBwiL-Q@mail.gmail.com>
 <5809E3E0.20338.7C6D35E@pageexec.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 22 Oct 2016 16:56:53 +0900
Message-ID: <CAHmME9oMfrfQ43sB1WDR2H3FRNFum_Jtk6K8ui_cZQaqL96aKQ@mail.gmail.com>
To: Pipacs <pageexec@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Emese Revfy <re.emese@gmail.com>,
 =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>,
 Brad Spengler <spender@grsecurity.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Error building against grsec-enabled kernel
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, Oct 21, 2016 at 6:46 PM, PaX Team <pageexec@gmail.com> wrote:
> thanks, i'm wondering if the tree should be audited for similar cases as we
> have open issues that have the same symptom (and ideally such fields changes
> would be done in accessor functions...).

Toke mentioned a v4 related overflow too. I'll look into this and see
if I can reproduce it.

> btw, your second submission has a
> few extra hunks disclosing debug code and full paths on your system, you probably
> didn't intend it ;).

I know. :( I resubmitted (again). Brain damage.

> in general, plugin dependence should be expressed by plugin specific defines
> (CONSTIFY_PLUGIN in your case) and not by the config option as the two may
> not always correlate (e.g., it used to be possible to compile the kernel with
> a plugin-incapable gcc while enabling plugin dependent features and in such
> cases depending on the config option could produce unintended results).

Okay, done:
https://git.zx2c4.com/WireGuard/commit/?id=e74fdd02ab8fd5325f2534067dbfbd3a7254c12a

> FYI, i added detection for such cases in the plugin but it'd also be possible to
> simply override these interfering section attributes. i went with the compile
> error instead of the fixup as this way people pay attention (and i'm forced
> to fix the fallout in PaX) but it's also less convenient for out-of-tree code...

Linux has never really supported out-of-tree code, in order to
motivate mainline submission. Hopefully WireGuard will be mainline
anyway soon enough. I think the error behavior is probably the right
one, for weeding out issues as they appear.
