Return-Path: <SRS0=3xXV=4V=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C03C3F2CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  4 Mar 2020 11:17:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3D8320709
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  4 Mar 2020 11:17:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ImzJa5N8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3D8320709
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28044eb3;
	Wed, 4 Mar 2020 11:13:25 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28c19040
 for <wireguard@lists.zx2c4.com>; Wed, 4 Mar 2020 11:13:23 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 41307116
 for <wireguard@lists.zx2c4.com>; Wed, 4 Mar 2020 11:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=3SsE00O26Yed9OhLJzl5GilAxTI=; b=ImzJa5
 N8QoSYnR5bTFL2CnqCcqVIVEZc6gwXxYVyAMBLghf82Bz8dKLbHL1vm7gZY7j6NJ
 H9PODPOHIdqVMwFCSxHRgR9cfu9eThbMG24fPXY2Ht/tqfmxtJvVvxZM3Kxk725u
 RqMoX21cplG78A6iVmvrM4p8xm7FQ+MOr6Fcs1iwW8RCqFB8YhNKBhVnGBGpNq89
 kao0dvv7bqhOxIt1i8mE37Jgb4kTDJ4o05Pm5aD+hT4O49Wk2FPs9jEQlBE5aZVj
 nQv+QwDoW5EXF2yPN8qkmY0FOG5e023pNUDZJR4K6qjBfnV7Ihaeo1AhnQugv5SB
 KkQDHatdCPvwtSEQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c77261e3
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Mar 2020 11:13:23 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id o18so1456842ilg.10
 for <wireguard@lists.zx2c4.com>; Wed, 04 Mar 2020 03:17:55 -0800 (PST)
X-Gm-Message-State: ANhLgQ1FIGD8lXqU9o6S5EoCQR38+rRN+DjY+769hajgFxNl27TOz7EE
 9Lx+ZXAfES+/d2PKtZhdBQMyPWLfuLYVSqnRpzI=
X-Google-Smtp-Source: ADFU+vuv/OoppNMXvse70z7R2SCUW1rm0ERMcblcA9wdd2lWGaQGFHXnrr07Im0PuJ44fwkb+plH5mFfh0LajsYdUAo=
X-Received: by 2002:a92:49cf:: with SMTP id k76mr2206071ilg.207.1583320674952; 
 Wed, 04 Mar 2020 03:17:54 -0800 (PST)
MIME-Version: 1.0
References: <xezycvxaj.1@wg-ml-rkaofgr.redir.email>
In-Reply-To: <xezycvxaj.1@wg-ml-rkaofgr.redir.email>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 4 Mar 2020 19:17:44 +0800
X-Gmail-Original-Message-ID: <CAHmME9q9P0ij4UUev=VOfdOLG20TwofKootix-0ue15207TrzA@mail.gmail.com>
Message-ID: <CAHmME9q9P0ij4UUev=VOfdOLG20TwofKootix-0ue15207TrzA@mail.gmail.com>
Subject: Re: [PATCH 1/1] Added network namespacing support to wq-quick
To: endre.szabo@wg-ml-rkaofgr.redir.email
Cc: Luis Ressel <aranea@aixah.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Thanks for the patch! I've generally been hesitant to add network
namespacing stuff to wg-quick, because it seemed a bit too complex for
the scope, but your idea here of thinking of it as simply the socket
netns, while the link stays in the namespace of the running process is
kind of nice, and I'm willing to consider this.

Would be interested in feedback on the idea from Luis (CC'd) too.

Some comments on the implementation, below:

On Wed, Mar 4, 2020 at 7:14 AM <endre.szabo@wg-ml-rkaofgr.redir.email> wrote:
> Please go easy on me, this is my first time sending a patch.
>
> --Endre

The patch needs a Signed-off-by: line. Git will automatically add this
using the lowercase -s option to git-commit, such as:

$ git commit -a -s -m "blah"

>   contrib/highlighter/gui/highlight.cpp |  1 +
>   contrib/highlighter/highlight.c       |  1 +
>   contrib/highlighter/highlighter.h     |  1 +

Thanks for not forgetting the highlighters. However, you'll still need
to add parsing of this field to the actual parser. This might involve
looking up what valid netns names are.

> +NetNS \(em Controls in which network namespace the WireGuard UDP socket
> is added to. The
> +namespace has to be created before WireGuard use.
> +.IP \(bu

Let's call this "SocketNamespace".

SocketNamespace \(em the namespace of the interface's UDP sockets,
though not the interface itself.

> +            NetNS) NETNS="$value"; continue ;;

Might need some validation after?

> +    if [[ -n $NETNS ]]; then
> +        if ! ip netns pids "${NETNS}" > /dev/null; then
> +            ret=$?
> +            echo "[!] Target namespace '${NETNS}' not found"
> +            exit $ret

`ip -n NS` will fail if NS doesn't exist, right? Might as well allow
that to fail organically rather than the TOCTOU here.

> +        elif ! cmd ip -n "${NETNS}" link add "$INTERFACE" type
> wireguard; then

Rather than putting the whole thing in an if [[ -n $NETNS ]] like
that, you can instead use this pattern:

local knetns unetns
[[ -z $NETNS ]] || knetns="-n $NETNS" unetns="ip netns exec $NETNS"
cmd ip $knetns link add ...
cmd $unetns wireguard-go ...

Also, ${NETNS} --> $NETNS.

> +            ret=$?
> +            [[ -e /sys/module/wireguard ]] || ! command -v
> "${WG_QUICK_USERSPACE_IMPLEMENTATION:-wireguard-go}" >/dev/null && exit $ret

That should be run in the right namespace, right? via `ip netns exec`

> +        cmd ip -n "${NETNS}" link set "$INTERFACE" netns 1

Using "1" here isn't correct, since we want people to be able to run
wg-quick itself in a network namespace. Instead use `$$`, which will
expand to the shell's PID, which has an associated netns.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
