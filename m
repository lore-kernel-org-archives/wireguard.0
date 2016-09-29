Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 82ced99d
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Sep 2016 18:54:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3937a35b
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Sep 2016 18:54:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id aaf59af8
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Sep 2016 18:54:36 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id g62so88420543lfe.3
 for <wireguard@lists.zx2c4.com>; Thu, 29 Sep 2016 12:05:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAA93jw7Lt5bq0ExfyhBmu7Lw1pdnPpebyG3v1pdtODsji88ABw@mail.gmail.com>
References: <CAHmME9p7LbqwSxSXgyjcam5f1cS0yM3E4WuLKnk8Ffm1QhQ4=A@mail.gmail.com>
 <CAA93jw5Uv3bjXSvOnx0fcPYPjPVeVuHehYr4oHeHX+ED7c-2Ng@mail.gmail.com>
 <CAHmME9ps9AacMTk15+6NNZQ9dYi1jMw0Gm_S51PraEni=3Ki1A@mail.gmail.com>
 <CAA93jw7Lt5bq0ExfyhBmu7Lw1pdnPpebyG3v1pdtODsji88ABw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 29 Sep 2016 21:05:12 +0200
Message-ID: <CAHmME9pvM_LZhT0VXGj+baUNXJXW1e97Akw3actPYa7_yYeCRg@mail.gmail.com>
To: Dave Taht <dave.taht@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] WireGuard ECN Implementation
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Sep 29, 2016 at 9:03 PM, Dave Taht <dave.taht@gmail.com> wrote:
> that + 1 was clever. I think you are done... and I should go change the blog. :)

Yea I like tricks like that. Anytime you have a range of values in the
middle, you can just add, modulo, and check the end.
