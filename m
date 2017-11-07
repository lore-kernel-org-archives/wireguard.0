Return-Path: gregkh@linuxfoundation.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 843ba7cf
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 09:35:08 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 784a7830
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 09:35:08 +0000 (UTC)
Date: Tue, 7 Nov 2017 10:38:32 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ferris Ellis <ferris@ferrisellis.com>
Subject: Re: Production usage of Wireguard
Message-ID: <20171107093832.GB7891@kroah.com>
References: <CAC4KqtwH_XAXeXHSf9Kxs5t80Qag9GrMwp6SaPnO9bj=GVL-7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <CAC4KqtwH_XAXeXHSf9Kxs5t80Qag9GrMwp6SaPnO9bj=GVL-7w@mail.gmail.com>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Nov 06, 2017 at 09:41:18PM +0000, Ferris Ellis wrote:
> Hello Wireguard mailing list!
> 
> I have been very interested in the WireGuard project for a little while now
> and am in the process of evaluating it. While benchmarks and code reviews
> are useful, they don’t uncover many of the issues that can potentially wake
> one up at 3am. I’d hunted around on the web for a while but wasn’t able to
> find any articles on running WireGuard in a production environment. I know
> the project is still young but was wondering if anyone on the mailing list
> had started using WireGuard in production? And, if so, if they’d be willing
> to share some details about their use case and experience?

There are at least two companies offering Wireguard as a VPN service
"commercially" right now, so it is being used in that manner already.

But as "production environment" always means different things for
different people, perhaps only you can answer this question?  What would
it take for _you_ to be comfortable with it in your network environment?

thanks,

greg k-h
