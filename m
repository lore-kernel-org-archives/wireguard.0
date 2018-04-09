Return-Path: yszhou4tech@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eb6a169a
 for <wireguard@lists.zx2c4.com>; Mon, 9 Apr 2018 02:52:07 +0000 (UTC)
Received: from mail-yb0-f174.google.com (mail-yb0-f174.google.com
 [209.85.213.174])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0bfafd32
 for <wireguard@lists.zx2c4.com>; Mon, 9 Apr 2018 02:52:07 +0000 (UTC)
Received: by mail-yb0-f174.google.com with SMTP id c1-v6so2524319ybm.2
 for <wireguard@lists.zx2c4.com>; Sun, 08 Apr 2018 20:05:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <trinity-d392f714-af63-4df5-a7bf-3bc24d3edf34-1522768786475@3c-app-gmx-bs64>
References: <trinity-d392f714-af63-4df5-a7bf-3bc24d3edf34-1522768786475@3c-app-gmx-bs64>
From: Yousong Zhou <yszhou4tech@gmail.com>
Date: Mon, 9 Apr 2018 11:05:22 +0800
Message-ID: <CAECwjAiNAYPBTQ=5+_2aVSvgvU5eKOx2b4-3JTbxSiP4mbnkeA@mail.gmail.com>
Subject: Re: wg-quick (script snippets) for OpenWRT/LEDE
To: vtol@gmx.net
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

On 3 April 2018 at 23:19,  <vtol@gmx.net> wrote:
> Hi,
>
> it appears that wg-quick is not provided for OpenWRT/LEDE.
>
> The reason is not really clear to me. As far I understand wg-quick depends
> on BASH whilst the default shell in OpenWRT/LEDE is ASH.
> This however can be easily remidied by installing the BASH package from the
> OpenWRT/LEDE repo.
>
> OpenWRT/LEDE is utilising netifd for network configuration which is lacking
> th3 versatility of wg-quick with there script snippets
>
> PRE_UP=( )
> POST_UP=( )
> PRE_DOWN=( )
> POST_DOWN=( )
>

POST_UP and POST_DOWN is possible with hotplug scripts in OpenWrt, but
the PRE_xx callback is currently not possible.  As a temporary
workaround, you can try patching locally /lib/netifd/proto/wg.sh to
achieve similar effects, or wrapping wg command with a script (hacky
wacky way)

> Is there a way to get those script snippets working in OpenWRT/LEDE as such
> is required in dynamic/split/kill-switch routing scenarios.
>

Just try installing all those dependencies wg-quick requires, though
after you know enough details about the wg-quick script, you may well
just write your own stripped down version for your own needs.

> OpenVPN provides a similar script functionality which is however not
> stripped on the OpenWRT/LEDE repo, respectively it does not require an extra
> tool package. I find it rather curious that the aforementioned script
> snippets are not part of wg but rather implemented in wg-quick which then is
> absent from OpenWRT/LEDE.
>

OpenVPN and WireGuard is different in this regard.  OpenVPN has a
daemon running while WireGuard depends on the network manager to do
the maintenance things.

                yousong
