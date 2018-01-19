Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7942f812
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Jan 2018 13:22:33 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 311444a7
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Jan 2018 13:22:33 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 82f12737
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Jan 2018 13:13:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4a26264d
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Jan 2018 13:13:41 +0000 (UTC)
Received: by mail-ot0-f175.google.com with SMTP id s3so1370222otc.9
 for <wireguard@lists.zx2c4.com>; Fri, 19 Jan 2018 05:26:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180119082957.GB14517@kroah.com>
References: <CAHmME9pWnFh4jN72hRo6kFzWTEQn4xF8AGNQUg8r3g_eAPBvdg@mail.gmail.com>
 <20180119082957.GB14517@kroah.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 19 Jan 2018 14:26:07 +0100
Message-ID: <CAHmME9oTZn2sB+6HL2UR3NGSnEw5ywXZYs3hJOGgVSq8BE8Q+g@mail.gmail.com>
Subject: Re: Formally Verified Cryptographic Primitive Implementations
To: Greg KH <greg@kroah.com>
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

On Fri, Jan 19, 2018 at 9:29 AM, Greg KH <greg@kroah.com> wrote:
> No questions, just a general, "Wow, this is great work!"
>
> It's wonderful to see this happen, thanks so much for pushing this
> forward.

Glad you like it. The real work, of course, will be parlaying this
work into kernel crypto api 2.0...

Jason
