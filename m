Return-Path: <SRS0=UgTS=M7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 407B4C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 23:40:47 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48FAB60F0F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 23:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 48FAB60F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ec20057b;
	Sun, 8 Aug 2021 23:38:33 +0000 (UTC)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ceda773a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 Aug 2021 23:38:29 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id y7so10061765ljp.3
 for <wireguard@lists.zx2c4.com>; Sun, 08 Aug 2021 16:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SrazaAjD8ufYKdLwToUuGR4tIZR2rbSot9k/6c56UkY=;
 b=QyGr7ZcRe5/nlYPAT7zcq55PJh/QjgPYT6TKPunTMFAb8ppy+0g5d3BmmnMVgbL+9q
 QDuICMCFeUH/rjKlzAtCDzxJrry+gBJHrmKBosHNAcsG3AI3QdLZf25YNLGLQ4sLrhSD
 c/d9wbadPze8KiEPZNgJQ8ezSbKBc8oheIptTtSkXEykhyMEewcTX+QcHjEdnA0eVlVB
 YN5Q886hpLQKG2VyBY5z7yf+jwm6+h9JeRUdDoRgZbZ20EALYNFvPDracOi2kpGrombd
 6ierN9xtRXlgVvJcYDwXkj0rmWO/IhOfjlHJSTkK1dCNyoi+ews6p+gzBYCdGEH5rKdy
 VJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SrazaAjD8ufYKdLwToUuGR4tIZR2rbSot9k/6c56UkY=;
 b=hqoOaARjy4tTlwoP1124Ae21z1spaBeVPIut4xU5nOtslGf8C4HSuYzYu39vHfzO4m
 2saSS1ntbFr8GiEzM+jONhXP191n2muCHHGiWWte3UJxg6pA27ZogT5DvVRBVkCn/jZ+
 vhYx+aXMt13mLkjccYLW9n4mLj7xbpChuFNAIOIV3VeWWCpJscLC3MTArJncMeCvdgzI
 v4K26QV9zEr6fQ76r2R3mAi1NP1vR0BtVLj+tvy8Xz6V6DlCkuWI64jVku0zjf6/cEeX
 +J5xP5ViRt+aaf4sZMRNX+vNh/s/zhePiNarugX8BodBFa/3k1w9TFYiqd/OyB1yxQiW
 xt4Q==
X-Gm-Message-State: AOAM532SpQTwMG7rrOS4nvc20Clif7hQanHBHVNO7IolohYlB1YiPoyG
 tK0pl1Qzg59qF4qEOTD55sktMNG/BiqU0+oq31A=
X-Google-Smtp-Source: ABdhPJwkfx2l/+6qGCn9d7Ul/k+8U/Tf1P8TIhFBwuiDIpGWV+EO4iiVdq1tvo6LXb/6hnXCqg1z02RIqyOE+oF1izw=
X-Received: by 2002:a2e:9acb:: with SMTP id p11mr7493788ljj.120.1628465909269; 
 Sun, 08 Aug 2021 16:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <7388816e-1f87-fa5e-f509-7276a6d3b80d@gmail.com>
In-Reply-To: <7388816e-1f87-fa5e-f509-7276a6d3b80d@gmail.com>
From: Phillip McMahon <phillip.mcmahon@gmail.com>
Date: Mon, 9 Aug 2021 01:37:58 +0200
Message-ID: <CABtXGiCig_pOKT2dRe5tdwJR5x8BnJO3zwvUYEoy0TMNR62QzQ@mail.gmail.com>
Subject: Re: ERX wireguard assistance please
To: Simon McNair <simonmcnair@gmail.com>
Cc: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi Simon,

I think that query is more for the ubiquity support forum, as you're
almost certainly going to have to supply your config.boot file etc.
which is somewhat outside of the pure wg.

Regards,

Phill

On Mon, 9 Aug 2021 at 01:06, Simon McNair <simonmcnair@gmail.com> wrote:
>
> Hi,
> I've searched to try and find the solution to my issue but I'm no expert
> and I'm not entirely sure what to search for.  I would appreciate your
> help please.
>
> In summary, If I connect to my LAN via local WiFi I successfully connect
> to wireguard:
> interface: wg0
>    public key: <removed>
>    private key: (hidden)
>    listening port: 12345
>
> peer: <removed>
>    endpoint: 192.168.100.102:50084
>    allowed ips: 10.250.250.5/32
>    latest handshake: Now
>    transfer: 157.33 KiB received, 536.33 KiB sent
>    persistent keepalive: every 25 seconds
>
> However if I try and connect via a remote network it fails.  My DDNS is
> resolving correctly to the correct IP so I can only think that firewall
> rules or NAT is somehow causing the issue.  Has anyone come across this
> before please ?
> I don't know how to monitor my WAN port 12345 for activity, I tried
> tcpdump -n -v -i wg0 to no real benefit.
>
>
> The ERX is running v2.0.9-hotfix.2 and
> e50-v2-v1.0.20210606-v1.0.20210424.deb
>
>
> High level the infrastructure is:
>
> LAN: 192.168.100.0/24
> wg ip : 10.250.250.1/24
> listen port:12345
> route-allowed-ips:true
> peer allowed ip is : 10.250.250.5/32
> Firewall policy WAN_LOCAL default action drop, rule 2 wireguard
> destination port 12345, protocol udp, action accept
>
>
> I would appreciate any help you can provide. The aim is to be able to
> access resources in the 192.168.100.0/24 subnet using routed ip from the
> 10.250.250.0/24 transit network.
>
> My apologies if my syntax or understanding is flawed.
>
> Regards
>
> Simon
>
>


-- 
Phillip McMahon

https://flowcrypt.com/me/phillipmcmahon
https://keys.openpgp.org/vks/v1/by-fingerprint/EA0483D4C864AA7C10994BE6A11E70ADFDA60CF9
