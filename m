Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7953009a
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jul 2018 02:25:24 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28610258
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jul 2018 02:25:24 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13e44fcb
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jul 2018 02:24:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0eb0fe3c
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jul 2018 02:24:10 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id k81-v6so794154oib.4
 for <wireguard@lists.zx2c4.com>; Mon, 02 Jul 2018 19:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAMj-8hS_bJado86_1V9hCyW=+-jO6BDnk1WnZE0EQoDembViEw@mail.gmail.com>
 <d939f3b9-ff51-4b94-fcdc-2e819a98459c@sholland.org>
 <CAMj-8hQFk_UPJO4-KEH8YvK5NOBH5vu23Vu5JM2Gt0srMD_kEg@mail.gmail.com>
 <CAHmME9qcXm65jFbGv24m-Pzx9c+nq2-D4y4kBkXk7W6u8HZLiw@mail.gmail.com>
 <CAMj-8hSnvCpY7sZ6xcH=2_Va33M1YsZ97H66PrDSo5=BV9vyOw@mail.gmail.com>
In-Reply-To: <CAMj-8hSnvCpY7sZ6xcH=2_Va33M1YsZ97H66PrDSo5=BV9vyOw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 3 Jul 2018 04:31:36 +0200
Message-ID: <CAHmME9qQyw-GxJ-1mLNR_DaWspOO8Enc+gKWobvKUcLqZ-Phcg@mail.gmail.com>
Subject: Re: Android app whitelist/blacklist feature
To: eric@bluelinelabs.com
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

On Tue, Jul 3, 2018 at 4:27 AM Eric Kuck <eric@bluelinelabs.com> wrote:
>
> I was originally thinking the new fragment would be a per-tunnel thing (s=
et when you create the tunnel or edit it), but you=E2=80=99re right - makin=
g it a general setting likely makes a whole lot more sense. I can=E2=80=99t=
 think of any use-cases for different tunnels handling different apps.

It might actually make most sense to make it a per-tunnel thing. We'd
then have to introduce conf key called, "ExemptedApplications=3D" or
something. Samuel - any thoughts on this?
