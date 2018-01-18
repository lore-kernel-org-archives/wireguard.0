Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dae442cc
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 14:16:41 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 34e65fe5
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 14:16:41 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5fbbb4b8
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 14:07:50 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2f48ed7c
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 14:07:49 +0000 (UTC)
Received: by mail-ot0-f177.google.com with SMTP id p16so20204069otf.1
 for <wireguard@lists.zx2c4.com>; Thu, 18 Jan 2018 06:20:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1516283661.uwaeedz44a.astroid@morple.none>
References: <1516279577.16nr5x0y18.astroid@morple.none>
 <CAHmME9oiqr7dN+riRgJ0jXxxwuXB0U9ot94GsoM7KUWGbEE-0Q@mail.gmail.com>
 <1516283661.uwaeedz44a.astroid@morple.none>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 18 Jan 2018 15:20:08 +0100
Message-ID: <CAHmME9oh74ca=PZFe2oK9rvqBZW15Ntmz=e-rnxMYqhG9k8ZAg@mail.gmail.com>
Subject: Re: Defaultroutepiercing
To: "M. Dietrich" <mdt@emdete.de>
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

On Thu, Jan 18, 2018 at 3:11 PM, M. Dietrich <mdt@emdete.de> wrote:
>         [#] resolvconf -a tun.wg0 -m 0 -x
>
> which seems to be wrong, the manpage resolvconf(8) states that the
> this parameter is
>
>         interface[.protocol]
>
> why is "tun." prepended?

To hack around incompetence on the part of Debian. They order entries
based on the device prefix.

If you have something custom going on, use PostUp/PostDown or
PreUp/PreDown to call your custom script, instead of using DNS=.

> the command is issued before the routing is configured.
> shouldnt the DNS configuration be applied after routing
> changes?

I can reason about it in both directions. What's your intuition lead
you to the _after_ choice?
