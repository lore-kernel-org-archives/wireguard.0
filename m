Return-Path: logcabin@fastmail.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a8525fb5
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 01:50:37 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cae2200d
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 01:50:37 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C1AA821F37
 for <wireguard@lists.zx2c4.com>; Thu, 21 Jun 2018 21:55:35 -0400 (EDT)
Message-Id: <1529632535.19086.1416445888.7A63B9D9@webmail.messagingengine.com>
From: logcabin@fastmail.net
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Subject: Re: PostUp/PreUp/PostDown/PreDown Dangerous?
In-Reply-To: <CAHmME9p6wS7BfWaa-0yHY-+T=ujqWVu_akkc1=XFO_rGAerY7A@mail.gmail.com>
References: <CAHmME9qGuyr+aPA0xw5M0hf_NvUAZaBGvX9evzegowCASwgDFA@mail.gmail.com>
 <CAHmME9qPwF-YdSKRhngVuL4JXrMD_1=nbP0jDUAejBxexsN3EA@mail.gmail.com>
 <CAHmME9p6wS7BfWaa-0yHY-+T=ujqWVu_akkc1=XFO_rGAerY7A@mail.gmail.com>
Date: Thu, 21 Jun 2018 21:55:35 -0400
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I'm in favor of keeping the features. A competent sysadmin or netadmin should know not to put questionable material on their systems, or at the very least, try it on a test bed where it can't do any damage.

On Thu, Jun 21, 2018, at 9:41 PM, Jason A. Donenfeld wrote:
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
> 
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
