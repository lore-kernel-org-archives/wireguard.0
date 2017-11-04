Return-Path: aranea@aixah.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 511c9bd0
 for <wireguard@lists.zx2c4.com>; Sat, 4 Nov 2017 20:24:11 +0000 (UTC)
Received: from wp260.webpack.hosteurope.de (wp260.webpack.hosteurope.de
 [80.237.133.29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d65aeee6
 for <wireguard@lists.zx2c4.com>; Sat, 4 Nov 2017 20:24:11 +0000 (UTC)
Date: Sat, 4 Nov 2017 21:27:01 +0100
From: Luis Ressel <aranea@aixah.de>
To: wireguard@lists.zx2c4.com, Markus Woschank <markus.woschank+wg@gmail.com>
Subject: Re: wg showconf
Message-ID: <20171104212701.527fadc1@vega.skynet.aixah.de>
In-Reply-To: <CAKUy5axWvBJfDQOjWSs7T0BCJ3Gw051Uu8gGw0BdSUOrzMAndw@mail.gmail.com>
References: <CAKUy5axWvBJfDQOjWSs7T0BCJ3Gw051Uu8gGw0BdSUOrzMAndw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sat, 4 Nov 2017 21:04:22 +0100
Markus Woschank <markus.woschank+wg@gmail.com> wrote:

> Is there a specific reason for this behaviour? If not, then I would
> argue that showconf should reflect the settings used to configure the
> interface and not the current state.

Peer endpoints are the only part of the information displayed by wg
showconf which change dynamically. Wireguard doesn't cache the original
endpoint specified by the config (if any), so it's not possible to
display it.

> Having the output of showconf reflect the original configuration in a
> deterministic way enables configuration/provisioning software to check
> if the interface is in the desired state and only take action if it's
> not - that would be very helpful at least to me.

I'd suggest you set up your provisioning software to ignore the
endpoints in "wg showconf"'s output if(f) the configuration file
doesn't specify endpoints at all.

If the config file does contain an endpoint, it's probably a good idea
to compare it to the endpoint reported by wg showconf.

Cheers,
Luis Ressel
