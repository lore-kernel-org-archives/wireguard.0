Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 03941d06
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Oct 2017 18:14:39 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ce65295c
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Oct 2017 18:14:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ea264a53
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Oct 2017 18:14:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 356d4996
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Oct 2017 18:14:39 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id h200so21352470oib.4
 for <wireguard@lists.zx2c4.com>; Fri, 20 Oct 2017 11:15:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171020180603.GA24912@wolff.to>
References: <20171020173941.GA23750@wolff.to>
 <CAHmME9rf2+S_pJqpGPPq+BXzMWTVyF92W2bVT904teHhVhJHoQ@mail.gmail.com>
 <20171020180603.GA24912@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 20 Oct 2017 20:15:38 +0200
Message-ID: <CAHmME9ponoXERrRnque-qWHqcYzUYTTMXL9W_5r-T5eCvUJDgw@mail.gmail.com>
Subject: Re: crypto routing with subnets?
To: Bruno Wolff III <bruno@wolff.to>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, Oct 20, 2017 at 8:06 PM, Bruno Wolff III <bruno@wolff.to> wrote:
> For this one, I was a bit worried that it might work sometimes, but have
> problems later as I couldn't find an explicit answer in the documentation (I
> might have missed it.) saying it worked like normal network routing. The
> examples I saw were all disjoint networks.

I should clarify this. I mention places that it uses a radix trie, but
this is probably gibberish, so I should make this explicit in the
manpage.
