Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4a77e244
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Mar 2017 15:56:10 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 180af3c2
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Mar 2017 15:56:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8fef4433
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Mar 2017 15:56:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 40607df8
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Mar 2017 15:56:09 +0000 (UTC)
Received: by mail-ot0-f170.google.com with SMTP id i1so23494513ota.3
 for <wireguard@lists.zx2c4.com>; Wed, 15 Mar 2017 08:59:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1489486302.24652.2.camel@gmail.com>
References: <80387df1-3237-43a0-adaa-09ffeebbef01@me.com>
 <1489486302.24652.2.camel@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 15 Mar 2017 08:59:42 -0700
Message-ID: <CAHmME9oaJA6xTwATpc0q=h9NO_F=ae-NveccSQpw-M4i-cF5Sw@mail.gmail.com>
Subject: Re: Rust implementation status
To: Vladimir Matveev <dpx.infinity@gmail.com>
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

On Tue, Mar 14, 2017 at 3:11 AM, Vladimir Matveev
<dpx.infinity@gmail.com> wrote:
> I see. I think that joining efforts would be nice, but, if I understand
> it correctly, that project is intended to provide a different
> interface, using WG as an underlying protocol. I personally think that
> it would be better to separate these layers, providing the connectivity
> daemon and higher-level features separately. I may be wrong though, it
> is quite possible that the combined approach will be more useful.

The objective of all wireguard implementations is to provide a simple
and uniform interface. Unity is very important. I have no interest
debating that point further. It is a stated project goal and a core
design consideration that drives discussion on this list forward.

> This is understandable, I think. But still, maybe doing development on
> Github and publishing the contents of the repository there to the main
> repository is possible? I believe that taking advantage of the issue
> tracker and the pull requests system there would be very useful and
> convenient.

The main repository is on git.zx2c4.com, but if people want to use PRs
and issues, and Sascha wants to review those, then that's of course
fine. Use whatever tools necessary. The important aspect is that the
canonical location for all WireGuard projects remains the same.

> I'm pretty sure that when WG get popuar, differences in behavior will
> be unavoidable.

You are so very wrong. If you start with this stupidity, sure, you'll
get brokenness. But if you actually attempt to carry out something
worthwhile, then each and every such difference will be squashed and
unified. I certainly intend to toil away to achieve this goal.

By the way, are you actually intending to contribute anything here, or
are you just on this list to bikeshed about procedural issues?
