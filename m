Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7c7f042
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Nov 2016 16:51:35 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 737f0b99
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Nov 2016 16:51:35 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ff5320af
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Nov 2016 16:51:34 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id b14so62672714lfg.2
 for <wireguard@lists.zx2c4.com>; Mon, 14 Nov 2016 08:54:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qC4xqGOwJnauXrJBDkAtmmuJ+kJKL6ufuU9_XWKNFdSA@mail.gmail.com>
References: <27cccef1-06d9-74b3-5b8a-912850119a76@cumulusnetworks.com>
 <20161113232813.28926-1-Jason@zx2c4.com>
 <87012eb2-e52d-7058-4115-a4a3c70a7b4c@cumulusnetworks.com>
 <CAHmME9p6-mLSs84AwwfRXe8U3Z2sy6Dp9W9H0gKh0rcZuQAfZA@mail.gmail.com>
 <CAHmME9qC4xqGOwJnauXrJBDkAtmmuJ+kJKL6ufuU9_XWKNFdSA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 14 Nov 2016 17:54:06 +0100
Message-ID: <CAHmME9oztO74yyG2sP-6jWTqo8KzgZq=u-MDSx2S84R6WP4O+w@mail.gmail.com>
To: David Ahern <dsa@cumulusnetworks.com>, David Miller <davem@davemloft.net>
Content-Type: multipart/alternative; boundary=94eb2c0d90583a2dc8054145b0c8
Cc: Netdev <netdev@vger.kernel.org>,
 Hannes Frederic Sowa <hannes@stressinduktion.org>,
 YOSHIFUJI Hideaki <hideaki.yoshifuji@miraclelinux.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [WireGuard] [PATCH v3] ip6_output: ensure flow saddr actually
	belongs to device
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c0d90583a2dc8054145b0c8
Content-Type: text/plain; charset=UTF-8

On Nov 14, 2016 17:19, "David Ahern" <dsa@cumulusnetworks.com> wrote:
>
> LGTM
>
> Acked-by: David Ahern <dsa@cumulusnetworks.com>

Great.

@DaveM: can we get this in 4.9 and in stable?

Thanks,
Jason

--94eb2c0d90583a2dc8054145b0c8
Content-Type: text/html; charset=UTF-8

<p dir="ltr">On Nov 14, 2016 17:19, &quot;David Ahern&quot; &lt;<a href="mailto:dsa@cumulusnetworks.com">dsa@cumulusnetworks.com</a>&gt; wrote:<br>
&gt;<br>
&gt; LGTM<br>
&gt;<br>
&gt; Acked-by: David Ahern &lt;<a href="mailto:dsa@cumulusnetworks.com">dsa@cumulusnetworks.com</a>&gt;</p>
<p dir="ltr">Great.</p>
<p dir="ltr">@DaveM: can we get this in 4.9 and in stable?</p>
<p dir="ltr">Thanks,<br>
Jason</p>

--94eb2c0d90583a2dc8054145b0c8--
