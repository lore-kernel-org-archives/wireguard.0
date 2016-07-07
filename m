Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4da2ecc0
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 11:44:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8be171fb
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 11:44:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f73e2397
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 11:44:25 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id h129so9553020lfh.1
 for <wireguard@lists.zx2c4.com>; Thu, 07 Jul 2016 04:44:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9o5aYzCQV=Py7uK5KLNFcPtEuNNFniyZB=_KAn4NYw4GA@mail.gmail.com>
References: <20160707025708.95304-1-jonathan@titanous.com>
 <CAHmME9o5aYzCQV=Py7uK5KLNFcPtEuNNFniyZB=_KAn4NYw4GA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 7 Jul 2016 13:44:34 +0200
Message-ID: <CAHmME9rgoaw=MzbfgXkDCWFt6sXzD_FKQka9V6JkpqaY1AH4iw@mail.gmail.com>
To: Jonathan Rudenberg <jonathan@titanous.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] [PATCH] go test: add ICMP ping
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Jul 7, 2016 at 12:20 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> This is awesome. What fun it was making this yesterday. A couple nits, however:
>
> On Thu, Jul 7, 2016 at 4:57 AM, Jonathan Rudenberg
> <jonathan@titanous.com> wrote:
>> +               Checksum: 0xa15b, // the packet is always the same, hard-code checksum
>
> Isn't there some Go lib we can use to calculate this for us?

https://git.zx2c4.com/WireGuard/commit/?id=42451879597f58ef6cdd74284c9629c12631d14d
Done.

>> +       if echo.ID != 1 || echo.Seq != 1 || string(echo.Data) != "WireGuard" {
>
> Can we set ID and Seq to random numbers, and check that we get them back here?

https://git.zx2c4.com/WireGuard/commit/?id=df68121676a70b325993e3bfdd51dce4c6bc65eb
Done.
