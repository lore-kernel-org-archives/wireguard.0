Return-Path: <SRS0=K46V=QL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99666C169C4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Feb 2019 00:14:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D117214DA
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Feb 2019 00:14:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=de-vri.es header.i=@de-vri.es header.b="m303v3n7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D117214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=de-vri.es
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db5cc133;
	Mon, 4 Feb 2019 00:07:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bf2b7642
 for <wireguard@lists.zx2c4.com>; Mon, 4 Feb 2019 00:07:24 +0000 (UTC)
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06ba389a
 for <wireguard@lists.zx2c4.com>; Mon, 4 Feb 2019 00:07:24 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id b20so8988200lfa.12
 for <wireguard@lists.zx2c4.com>; Sun, 03 Feb 2019 16:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de-vri.es; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=I+nR4Lc5npRq+pRci7umLjH1fYpV+HhIki9LdbOZKnc=;
 b=m303v3n7LgBJDDKrvb3xheNvsTjjMup+e/8XyIRq5hrt4WGFkRJE74BQA6tlFwkk8/
 qxQNFcCDtNPVdISspfKT2QMZ/7laTqOBu/35D2J9P88DdRkhzA0bsev+X6weo2bU5a6T
 VnLz1kWv5AlfotLXE7dkWs9ganoEjYOkd5XuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=I+nR4Lc5npRq+pRci7umLjH1fYpV+HhIki9LdbOZKnc=;
 b=kxNuaghsh2Wfw5x5L5+uqNeBAWrvXspcoQAiWvHHSV9XKuATG2AjWMocrMiki7D6fR
 ueSkfU6hXxxcVqNcei+y2HN/FNJvZLfjps9CP6Vy8Rp8oQkqgUyZC20b1OCwO6dWRThO
 n0WKJrVaHVS503OL1NqW+0LRgGBzY6JD2vEU8WTEUjcOFoVEosTiogdDA1N7VFL1x2vT
 r7bZH3mt47zgU6+1SeclFtzB82teKIeGpYqsomNrem/Akz49fM0wihNo2nkfbkgxois5
 5qtpLXdmsCfHVaRl+qiyhhYTkPGILxWZ76mVt9aCzG6wQJhFhl1ZhuTJPC1ennOFYQpW
 QIxw==
X-Gm-Message-State: AHQUAuYcLyPLzb0MC1zPErIDMcSW274wHZhS5be3WsjAPK8HBW+ncLxQ
 JOKm1lE2OcRUucYqx3sg0zxklylyW0M=
X-Google-Smtp-Source: AHgI3Ibb/dmOfrLYKlHiHzrSdudNz+0JBAOZBZ5kDmcRyxkkZm9SZuGWH+vtzCez3HdKfBPo9kJIJQ==
X-Received: by 2002:ac2:50d5:: with SMTP id h21mr4739824lfm.165.1549239235400; 
 Sun, 03 Feb 2019 16:13:55 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174])
 by smtp.gmail.com with ESMTPSA id k13-v6sm2474293lje.89.2019.02.03.16.13.54
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 Feb 2019 16:13:54 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id v1-v6so10224277ljd.0
 for <wireguard@lists.zx2c4.com>; Sun, 03 Feb 2019 16:13:54 -0800 (PST)
X-Received: by 2002:a2e:9681:: with SMTP id
 q1-v6mr38396615lji.182.1549239234522; 
 Sun, 03 Feb 2019 16:13:54 -0800 (PST)
MIME-Version: 1.0
References: <20190203220806.14327-1-maarten@de-vri.es>
 <20190204000549.24287-1-maarten@de-vri.es>
In-Reply-To: <20190204000549.24287-1-maarten@de-vri.es>
From: Maarten de Vries <maarten@de-vri.es>
Date: Mon, 4 Feb 2019 01:13:43 +0100
X-Gmail-Original-Message-ID: <CAPWpf+xtkEOYch084oZfuK_G3nOkJNLwFKGppSK7M-se4WCw8Q@mail.gmail.com>
Message-ID: <CAPWpf+xtkEOYch084oZfuK_G3nOkJNLwFKGppSK7M-se4WCw8Q@mail.gmail.com>
Subject: Re: [PATCH] Check CAP_NET_ADMIN in old and new ns before changing
 network ns.
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Mon, 4 Feb 2019 at 01:11, Maarten de Vries <maarten@de-vri.es> wrote:
>
> ---
>
> Forgot to check for CAP_NET_ADMIN. Quite important actually :)
>
>  src/netlink.c | 60 +++++++++++++++++++++++++++++----------------------
>  1 file changed, 34 insertions(+), 26 deletions(-)
>
> diff --git a/src/netlink.c b/src/netlink.c
> index 82e9030..2999593 100644
> --- a/src/netlink.c
> +++ b/src/netlink.c
> @@ -473,30 +473,10 @@ out:
>         return ret;
>  }
>
> -static int set_tunnel_netns(struct wg_device *wg, u32 fd)
> -{
> -       struct net *new_net;
> -
> -       if (wg->sock4 != NULL || wg->sock6 != NULL)
> -               return -EINVAL;
> -
> -       new_net = get_net_ns_by_fd(fd);
> -
> -       if (IS_ERR(new_net))
> -               return PTR_ERR(new_net);
> -
> -       if (wg->have_creating_net_ref)
> -               put_net(wg->creating_net);
> -
> -       wg->have_creating_net_ref = true;
> -       wg->creating_net = new_net;
> -
> -       return 0;
> -}
> -
>  static int wg_set_device(struct sk_buff *skb, struct genl_info *info)
>  {
>         struct wg_device *wg = lookup_interface(info->attrs, skb);
> +       struct net *new_net = NULL;
>         int ret;
>
>         if (IS_ERR(wg)) {
> @@ -509,10 +489,34 @@ static int wg_set_device(struct sk_buff *skb, struct genl_info *info)
>
>         ret = -EPERM;
>         if ((info->attrs[WGDEVICE_A_LISTEN_PORT] ||
> -            info->attrs[WGDEVICE_A_FWMARK]) &&
> +            info->attrs[WGDEVICE_A_FWMARK] ||
> +            info->attrs[WGDEVICE_A_TUNNEL_NETNS_FD]) &&
>             !ns_capable(wg->creating_net->user_ns, CAP_NET_ADMIN))
>                 goto out;
>
> +       if (info->attrs[WGDEVICE_A_TUNNEL_NETNS_FD]) {
> +               int fd = nla_get_u32(info->attrs[WGDEVICE_A_TUNNEL_NETNS_FD]);
> +               new_net = get_net_ns_by_fd(fd);
> +
> +               if (IS_ERR(new_net)) {
> +                       ret = PTR_ERR(new_net);
> +                       new_net = NULL;
> +                       goto out;
> +               }
> +
> +               /* Also check that we've got CAP_NET_ADMIN in the new namespace. */
> +               if (!ns_capable(new_net->user_ns, CAP_NET_ADMIN)) {
> +                       ret = -EPERM;
> +                       goto out;
> +               }
> +
> +               /* And check that there are no initialized sockets. */
> +               if (wg->sock4 != NULL || wg->sock6 != NULL) {
> +                       ret = -EINVAL;
> +                       goto out;
> +               }
> +       }
> +
>         ++wg->device_update_gen;
>
>         if (info->attrs[WGDEVICE_A_FWMARK]) {
> @@ -582,15 +586,19 @@ static int wg_set_device(struct sk_buff *skb, struct genl_info *info)
>         }
>
>         if (info->attrs[WGDEVICE_A_TUNNEL_NETNS_FD]) {
> -               int fd = nla_get_u32(info->attrs[WGDEVICE_A_TUNNEL_NETNS_FD]);
> -               ret = set_tunnel_netns(wg, fd);
> -               if (ret < 0)
> -                       goto out;
> +               if (wg->have_creating_net_ref)
> +                       put_net(wg->creating_net);
> +
> +               wg->have_creating_net_ref = true;
> +               wg->creating_net = new_net;
> +               new_net = NULL;
>         }
>
>         ret = 0;
>
>  out:
> +       if (new_net)
> +               put_net(new_net);
>         mutex_unlock(&wg->device_update_lock);
>         rtnl_unlock();
>         dev_put(wg->dev);
> --
> 2.20.1
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

Hmm, I did send this with --in-reply-to, but at least in gmail it is
treated as a separate thread. This was meant to be a reply to [PATCH]
Allow changing `creator_net` after interface creation.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
