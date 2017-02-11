Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7463d547
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 09:06:21 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 247a66b8
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 09:06:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 331248e4
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 09:06:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7cebe5f4
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 09:06:21 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id s203so32602708oie.1
 for <wireguard@lists.zx2c4.com>; Sat, 11 Feb 2017 01:20:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <91e1990891fb763b8090a2eed1321744@mail.teknik.io>
References: <91e1990891fb763b8090a2eed1321744@mail.teknik.io>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 11 Feb 2017 10:20:08 +0100
Message-ID: <CAHmME9pyHASJVx0ZC1GNLgddgF_Dja7bqRxGoML8hCuWLaPbzg@mail.gmail.com>
Subject: Re: WIreGuard on embedded devices and traffic shaping question.
To: j0eblack@teknik.io
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Joe,

Sorry for the late reply. There was a conference and then a small trip
after, and now I'm catching up on the backlog.

On Fri, Jan 27, 2017 at 12:05 PM,  <j0eblack@teknik.io> wrote:
> If anyone is interested in this set-up I can write a short guide how you can
> achieve that and other people can point if any mistakes were made during the
> setup.

I'd certainly be interested in some sort of blog write-up. The more
documentation and tutorials, the better, IMHO.

> Something that I want to do, and I was not able to find information about it
> in the mailing list or the docs on the website is, can bandwidth (traffic
> shaping) limits be applied between connected peers?

The traffic shaping with WireGuard is the same trafic shaping found in
the rest of the Linux kernel -- the qdisc and tc subsystem. I think
you can use the usual techniques there for applying shaping to the
entire interface or selectively to certain flows.

> I have done this in the past with open-vpn and tc (per IP address shaping)
> and I am really curious if this can be done inside WireGuard or not?

I believe it can be using exactly that idea.

Regards,
Jason
