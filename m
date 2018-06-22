Return-Path: a@unstable.cc
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6ec4305c
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 01:51:59 +0000 (UTC)
Received: from s2.neomailbox.net (s2.neomailbox.net [5.148.176.60])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e68c688f
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 01:51:59 +0000 (UTC)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAHmME9qGuyr+aPA0xw5M0hf_NvUAZaBGvX9evzegowCASwgDFA@mail.gmail.com>
 <CAHmME9qPwF-YdSKRhngVuL4JXrMD_1=nbP0jDUAejBxexsN3EA@mail.gmail.com>
 <CAHmME9p6wS7BfWaa-0yHY-+T=ujqWVu_akkc1=XFO_rGAerY7A@mail.gmail.com>
From: Antonio Quartulli <a@unstable.cc>
Subject: Re: PostUp/PreUp/PostDown/PreDown Dangerous?
Message-ID: <a7989c95-0047-dfe9-e870-59db44fbb463@unstable.cc>
Date: Fri, 22 Jun 2018 09:56:41 +0800
MIME-Version: 1.0
In-Reply-To: <CAHmME9p6wS7BfWaa-0yHY-+T=ujqWVu_akkc1=XFO_rGAerY7A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Cc: baines.jacob@gmail.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

On 22/06/18 09:41, Jason A. Donenfeld wrote:
> Hey list,
> 
> wg(8) is the main WireGuard configuration tool. It takes a fairly
> strict set of inputs, and is supposed to perform acceptable input
> validation on them.
> 
> https://git.zx2c4.com/WireGuard/about/src/tools/man/wg.8
> 
> wg-quick(8), on the other and, is a dinky bash script, that is useful
> for making some common limited use cases a bit easier.
> 
> https://git.zx2c4.com/WireGuard/about/src/tools/man/wg-quick.8
> 
> wg-quick(8) has the very handy feature of allowing
> PostUp/PostDown/PreUp/PreDown directives, to execute some helpers,
> such as iptables or whatever else you want in a custom setup. These
> have proven very useful to folks. And because these allow arbitrary
> execution anyway, wg-quick(8) doesn't try very hard to do proper input
> validation either.
> 
> I just saw this nice post pointing out a problem in OpenVPN:
> https://medium.com/tenable-techblog/reverse-shell-from-an-openvpn-configuration-file-73fd8b1d38da
> 
> The same thing applies to wg-quick(8) with
> PostUp/PostDown/PreUp/PreDown. The question is how seriously we should
> take the problem presented by this blog post. Namely, you can't trust
> configuration files given to you by outside parties. Maybe you
> shouldn't reconfigure your network without inspecting what those
> reconfigurations are first. However, one could argue that code
> execution is a bit beyond networking config.
> 
> So, the question we need to ask is whether this problem is important
> enough that these useful features should be _removed_? Or if there's a
> way to make them safer? Or if it just doesn't matter that much and we
> shouldn't do anything.
> 
> Thoughts?

In case this might be useful: in OpenVPN there is an additional
parameter called "--script-security" that requires to be set to a
certain level before allowing configured scripts to be executed.

Unfortunately there is no real protection against the clueless user, who
can and will blindly enable that setting if asked by a $random VPN provider.

However, I still believe (and hope) that forcing the user to enable a
specific knob may raise the level of attention.

Maybe something similar could be added as a command line parameter to
wg/wg-quick so that it will execute the various
PostUp/PreUp/PostDown/PreDown only if allowed to?


Just as a side note: this is not a VPN specific problem, this is
something users can end up with everytime they execute some binary with
a configuration they have not inspected. So, be careful out there ;-)


Cheers,


-- 
Antonio Quartulli
