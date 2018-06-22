Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df70d77b
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 01:36:19 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b229f955
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 01:36:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f518fdb
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 01:35:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d44dc19a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 01:35:06 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id c6-v6so4763383oiy.0
 for <wireguard@lists.zx2c4.com>; Thu, 21 Jun 2018 18:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9qGuyr+aPA0xw5M0hf_NvUAZaBGvX9evzegowCASwgDFA@mail.gmail.com>
 <CAHmME9qPwF-YdSKRhngVuL4JXrMD_1=nbP0jDUAejBxexsN3EA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 22 Jun 2018 03:41:03 +0200
Message-ID: <CAHmME9p6wS7BfWaa-0yHY-+T=ujqWVu_akkc1=XFO_rGAerY7A@mail.gmail.com>
Subject: Re: PostUp/PreUp/PostDown/PreDown Dangerous?
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Cc: baines.jacob@gmail.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey list,

wg(8) is the main WireGuard configuration tool. It takes a fairly
strict set of inputs, and is supposed to perform acceptable input
validation on them.

https://git.zx2c4.com/WireGuard/about/src/tools/man/wg.8

wg-quick(8), on the other and, is a dinky bash script, that is useful
for making some common limited use cases a bit easier.

https://git.zx2c4.com/WireGuard/about/src/tools/man/wg-quick.8

wg-quick(8) has the very handy feature of allowing
PostUp/PostDown/PreUp/PreDown directives, to execute some helpers,
such as iptables or whatever else you want in a custom setup. These
have proven very useful to folks. And because these allow arbitrary
execution anyway, wg-quick(8) doesn't try very hard to do proper input
validation either.

I just saw this nice post pointing out a problem in OpenVPN:
https://medium.com/tenable-techblog/reverse-shell-from-an-openvpn-configuration-file-73fd8b1d38da

The same thing applies to wg-quick(8) with
PostUp/PostDown/PreUp/PreDown. The question is how seriously we should
take the problem presented by this blog post. Namely, you can't trust
configuration files given to you by outside parties. Maybe you
shouldn't reconfigure your network without inspecting what those
reconfigurations are first. However, one could argue that code
execution is a bit beyond networking config.

So, the question we need to ask is whether this problem is important
enough that these useful features should be _removed_? Or if there's a
way to make them safer? Or if it just doesn't matter that much and we
shouldn't do anything.

Thoughts?

Jason
