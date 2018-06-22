Return-Path: brunnre8@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a961d9dd
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 05:39:20 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f5adf130
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 05:39:20 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id z21-v6so533991edr.9
 for <wireguard@lists.zx2c4.com>; Thu, 21 Jun 2018 22:44:19 -0700 (PDT)
Return-Path: <brunnre8@gmail.com>
Received: from gmail.com (adsl-178-39-227-80.adslplus.ch. [178.39.227.80])
 by smtp.gmail.com with ESMTPSA id c11-v6sm2927035eda.64.2018.06.21.22.44.16
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 21 Jun 2018 22:44:17 -0700 (PDT)
Date: Fri, 22 Jun 2018 07:44:13 +0200
From: Reto Brunner <brunnre8@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: Re: PostUp/PreUp/PostDown/PreDown Dangerous?
Message-ID: <20180622054413.54azzixsunbxdu35@ghostArch.localdomain>
References: <CAHmME9qGuyr+aPA0xw5M0hf_NvUAZaBGvX9evzegowCASwgDFA@mail.gmail.com>
 <CAHmME9qPwF-YdSKRhngVuL4JXrMD_1=nbP0jDUAejBxexsN3EA@mail.gmail.com>
 <CAHmME9p6wS7BfWaa-0yHY-+T=ujqWVu_akkc1=XFO_rGAerY7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAHmME9p6wS7BfWaa-0yHY-+T=ujqWVu_akkc1=XFO_rGAerY7A@mail.gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, Jun 22, 2018 at 03:41:03AM +0200, Jason A. Donenfeld wrote:
> The same thing applies to wg-quick(8) with
> PostUp/PostDown/PreUp/PreDown. The question is how seriously we should
> take the problem presented by this blog post. Namely, you can't trust
> configuration files given to you by outside parties. Maybe you
> shouldn't reconfigure your network without inspecting what those
> reconfigurations are first. However, one could argue that code
> execution is a bit beyond networking config.

You should never run *any* config from the internet without inspecting
it...
Even if it isn't a reverse shell directly, you can still for example end
up with questionable cipher suit choices in say openvpn or openssh if
you just blindly do that.

So please don't remove the hooks. They are very useful for many reasons
and adding an additional knob will not make it any more secure.

As others already said those users anyhow just run random commands from
$blog (heck they even copy / paste fork bombs and stuff like `rm -rf /*`)

In my view the whole point of wg-quick is that it can do things like the
post-up hook, to enter things like firewall rules etc.


Kind regards,
Reto
