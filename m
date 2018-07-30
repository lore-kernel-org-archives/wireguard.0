Return-Path: yszhou4tech@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ea8b6e17
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Jul 2018 03:24:49 +0000 (UTC)
Received: from mail-yb0-x236.google.com (mail-yb0-x236.google.com
 [IPv6:2607:f8b0:4002:c09::236])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8c449b4
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Jul 2018 03:24:49 +0000 (UTC)
Received: by mail-yb0-x236.google.com with SMTP id h127-v6so4219063ybg.12
 for <wireguard@lists.zx2c4.com>; Sun, 29 Jul 2018 20:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAECwjAjdHujDmgKURVf1jG=Pg4vu3XLje619GvtH2G5kGWLm3A@mail.gmail.com>
 <CAECwjAi9rrcqb6+kJcWChVGxnk1Ro68nJS7wh2b7F791RWSHvg@mail.gmail.com>
 <CAHmME9ppK0TF5TQgY4kwJTpzWGAtNHBSwKbHPHJV2mPbj_7DHg@mail.gmail.com>
In-Reply-To: <CAHmME9ppK0TF5TQgY4kwJTpzWGAtNHBSwKbHPHJV2mPbj_7DHg@mail.gmail.com>
From: Yousong Zhou <yszhou4tech@gmail.com>
Date: Mon, 30 Jul 2018 11:34:31 +0800
Message-ID: <CAECwjAh2xvqRPEWbFqi2oh3+-WT1D2t7AJGH0+0FJu4pXt-RZg@mail.gmail.com>
Subject: Re: compilation error on centos 7 kernels
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

On Mon, 30 Jul 2018 at 11:29, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Update to the latest available centos kernel in the latest available
> centos release, and then after install WireGuard. If you're facing
> problems then, email a compilation log.

Well, better add a note in the installation page about the
update-to-date kernel version expectation.  The other thing is that
it's not always that feasible to switch kernel version in enterprise
managed environment

                yousong
