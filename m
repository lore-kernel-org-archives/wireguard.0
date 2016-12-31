Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bca27895
 for <wireguard@lists.zx2c4.com>;
 Sat, 31 Dec 2016 02:26:33 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31e22e1d
 for <wireguard@lists.zx2c4.com>;
 Sat, 31 Dec 2016 02:26:33 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a05cad8
 for <wireguard@lists.zx2c4.com>;
 Sat, 31 Dec 2016 02:26:33 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 86967558
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 31 Dec 2016 02:26:33 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id b126so438053390oia.2
 for <wireguard@lists.zx2c4.com>; Fri, 30 Dec 2016 18:34:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161230060941.u4bwzdmforghluhz@pdebuildx-amd64.voodoowarez.com>
References: <20161230060941.u4bwzdmforghluhz@pdebuildx-amd64.voodoowarez.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 31 Dec 2016 03:34:56 +0100
Message-ID: <CAHmME9ps=8bc74tnmKMnitH_wRBLXoioQc+XC_qvqk8Pv6WgBA@mail.gmail.com>
Subject: Re: Compression support- zstd, &c
To: rektide <rektide@voodoowarez.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Rektide,

On Fri, Dec 30, 2016 at 7:09 AM, rektide <rektide@voodoowarez.com> wrote:
> Greetings. Compression would be a great feature for WireGuard & it's road=
map. Perhaps the latest high compression & high throughput, very tuneable Z=
std from Cyan4793? I think it'd make a fine complement to the other very ni=
ce modern technologies WireGuard has adopted.
> http://facebook.github.io/zstd/
>
> IPSec has a decent if not very modern history of compression with deflate=
, lzs, and lzjh support via IP Compression packets. That shows that there's=
 some precedent for this feature. More recently OpenVPN has added LZ4 suppo=
rt.
>
> I want to throw on a feature request- compression. It'd be great to get f=
ree compression across the tunnel. OpenVPN recently added LZ4 compression. =
I personally would love to see Zstd supported. Seeing compression added to =
your roadmap would be immensely satisfying for me,
> I'd point to the author of both LZ4 and Zstd- Cyan4973-'s post introducin=
g Zstd for more info the tradeoffs between these and others (Snappy, lzo, &=
c), which boil down to CPU usage and compression ratio,
> http://fastcompression.blogspot.com/2015/01/zstd-stronger-compression-alg=
orithm.html

That's an interesting idea. The first concern that immediately comes
to mind is data leakage and CRIME-like compression attacks. We'd have
to tread very carefully in order to do this right. Is there a
particular implementation strategy for this you have in mind?
Historically adding compression to crypto protocols has been quite
risky.

> This would make a huge difference for me while I am tethered to cellular.

Do you have any metrics on what kind of difference? I've never tried
out the effects of compression on cellular links. Is it immediately
noticeable in some obvious way?

Jason
