Return-Path: jehan@altheamesh.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2cb1a52c
 for <wireguard@lists.zx2c4.com>;
 Sat, 31 Dec 2016 23:31:32 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f451c4ad
 for <wireguard@lists.zx2c4.com>;
 Sat, 31 Dec 2016 23:31:32 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id BD9BA20824
 for <wireguard@lists.zx2c4.com>; Sat, 31 Dec 2016 18:40:02 -0500 (EST)
Message-Id: <1483227602.2820173.833990769.0EDBBF7D@webmail.messagingengine.com>
From: Jehan Tremback <jehan@altheamesh.com>
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Date: Sat, 31 Dec 2016 15:40:02 -0800
In-Reply-To: <CAHmME9ps=8bc74tnmKMnitH_wRBLXoioQc+XC_qvqk8Pv6WgBA@mail.gmail.com>
Subject: Re: Compression support- zstd, &c
References: <20161230060941.u4bwzdmforghluhz@pdebuildx-amd64.voodoowarez.com>
 <CAHmME9ps=8bc74tnmKMnitH_wRBLXoioQc+XC_qvqk8Pv6WgBA@mail.gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

What is the advantage of doing this in Wireguard as opposed to doing it
as a separate project?

-- 
  Jehan Tremback
  jehan@altheamesh.com

On Fri, Dec 30, 2016, at 06:34 PM, Jason A. Donenfeld wrote:
> Hi Rektide,
> 
> On Fri, Dec 30, 2016 at 7:09 AM, rektide <rektide@voodoowarez.com> wrote:
> > Greetings. Compression would be a great feature for WireGuard & it's roadmap. Perhaps the latest high compression & high throughput, very tuneable Zstd from Cyan4793? I think it'd make a fine complement to the other very nice modern technologies WireGuard has adopted.
> > http://facebook.github.io/zstd/
> >
> > IPSec has a decent if not very modern history of compression with deflate, lzs, and lzjh support via IP Compression packets. That shows that there's some precedent for this feature. More recently OpenVPN has added LZ4 support.
> >
> > I want to throw on a feature request- compression. It'd be great to get free compression across the tunnel. OpenVPN recently added LZ4 compression. I personally would love to see Zstd supported. Seeing compression added to your roadmap would be immensely satisfying for me,
> > I'd point to the author of both LZ4 and Zstd- Cyan4973-'s post introducing Zstd for more info the tradeoffs between these and others (Snappy, lzo, &c), which boil down to CPU usage and compression ratio,
> > http://fastcompression.blogspot.com/2015/01/zstd-stronger-compression-algorithm.html
> 
> That's an interesting idea. The first concern that immediately comes
> to mind is data leakage and CRIME-like compression attacks. We'd have
> to tread very carefully in order to do this right. Is there a
> particular implementation strategy for this you have in mind?
> Historically adding compression to crypto protocols has been quite
> risky.
> 
> > This would make a huge difference for me while I am tethered to cellular.
> 
> Do you have any metrics on what kind of difference? I've never tried
> out the effects of compression on cellular links. Is it immediately
> noticeable in some obvious way?
> 
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
