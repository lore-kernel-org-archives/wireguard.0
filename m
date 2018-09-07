Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b4bd394c
 for <wireguard@lists.zx2c4.com>; Fri, 7 Sep 2018 01:29:12 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c638bc55
 for <wireguard@lists.zx2c4.com>; Fri, 7 Sep 2018 01:29:12 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ceb8691c
 for <wireguard@lists.zx2c4.com>; Fri, 7 Sep 2018 01:13:23 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 840fdd87
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 7 Sep 2018 01:13:23 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id p84-v6so24347335oic.4
 for <wireguard@lists.zx2c4.com>; Thu, 06 Sep 2018 18:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAHijbEWf1S0Tc+zxZBvmJ0xe5iBU00pOxikejetF8x33Qh=GcQ@mail.gmail.com>
 <CAHijbEWTvJW+FsBS3NTsuF=FXAHJFRqThs5tEiPYwj51V7vzYQ@mail.gmail.com>
In-Reply-To: <CAHijbEWTvJW+FsBS3NTsuF=FXAHJFRqThs5tEiPYwj51V7vzYQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 6 Sep 2018 19:29:18 -0600
Message-ID: <CAHmME9q8qZBd6CZ7CZsQdxP7yGp=5bcwEovygJFm-w1-MgpSAA@mail.gmail.com>
Subject: Re: Setting the transit namespace at runtime
To: ju.orth@gmail.com
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

On Thu, Sep 6, 2018 at 2:43 PM Julian Orth <ju.orth@gmail.com> wrote:
>
> Hi,
>
> After receiving some positive feedback on IRC, I've gone ahead and implemented
> this. You can see the code here:
>
> https://github.com/mahkoh/wireguard/commits/transit-namespace

Thanks for this. Not sure I'll accept it based on the issues I
mentioned in the last email (though I am open to discussion to change
minds about it), but either way, the proper way to get a review on the
code here or on LKML is to submit it with `git format-patch
--cover-letter` and `git send-email`.

Jason
