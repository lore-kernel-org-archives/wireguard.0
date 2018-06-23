Return-Path: brunnre8@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 962475d6
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Jun 2018 19:11:47 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bf4de629
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Jun 2018 19:11:47 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id q24-v6so1405277edr.1
 for <wireguard@lists.zx2c4.com>; Sat, 23 Jun 2018 12:16:58 -0700 (PDT)
Return-Path: <brunnre8@gmail.com>
Received: from gmail.com (adsl-178-39-227-80.adslplus.ch. [178.39.227.80])
 by smtp.gmail.com with ESMTPSA id k1-v6sm11065052eda.35.2018.06.23.12.16.55
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 23 Jun 2018 12:16:55 -0700 (PDT)
Date: Sat, 23 Jun 2018 21:16:54 +0200
From: Reto Brunner <brunnre8@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: Re: PostUp/PreUp/PostDown/PreDown Dangerous?
Message-ID: <20180623191654.4k3bd2y5p3dplkty@ghostArch.localdomain>
References: <CAHmME9qGuyr+aPA0xw5M0hf_NvUAZaBGvX9evzegowCASwgDFA@mail.gmail.com>
 <CAHmME9qPwF-YdSKRhngVuL4JXrMD_1=nbP0jDUAejBxexsN3EA@mail.gmail.com>
 <CAHmME9p6wS7BfWaa-0yHY-+T=ujqWVu_akkc1=XFO_rGAerY7A@mail.gmail.com>
 <c80282cc-5c43-e2fc-3656-efeca01c15b6@ironicdesign.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <c80282cc-5c43-e2fc-3656-efeca01c15b6@ironicdesign.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, Jun 22, 2018 at 09:07:43AM -0500, Andy Dorman wrote:
> So, while it should be obvious, it wouldn't hurt to add a short warning (in
> bold) to the wg-quick man page that lets these "amateur" users know of the
> potential danger.

The issue being that people do not tend to read the man pages.
I don't disagree that this might be useful for some, but don't get your
hopes up too much...

The type of user who actually needs this warning tends to not want to
put in any effort whatsoever in understanding how stuff works, they just want the end result.

This is at least my experience from several Linux irc channels, where
half the questions could be answered by `man $program_I_have_issues_with`
