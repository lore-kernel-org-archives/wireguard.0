Return-Path: <SRS0=ifwh=XT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47ABAC432C1
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Sep 2019 08:48:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8576A2146E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Sep 2019 08:48:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Jx/RfNmp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8576A2146E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c58c38e0;
	Tue, 24 Sep 2019 08:48:06 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26eff24d
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Sep 2019 08:48:03 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9032d5db
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Sep 2019 08:48:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45fe2913
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Sep 2019 08:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :from:date:message-id:subject:to:content-type; s=mail; bh=ozXlLP
 W/f03UFdgH+awu/RJH8Fg=; b=Jx/RfNmp/psFwpz8wYXodvE5i8PudY0dRy469O
 Oeo0aBwp+PUlZ9cwhNlHcFXnv1MBgHBZFcpraY58wU2NjGpHO+xmg3oT0txNZwMv
 CTpcSFN2FbnAedgsKhAEBYRVC3IHZLI19pE3WtFuzH4B+drdGu4uCwqnfyXBT4o9
 9MnqXCOgtfnbZTGOl6Wcb9W1mMlI6P8c3WLv9e3EB8Aic1FgOnS+fTLid3Fw+7tO
 XV4BFgc9rxyVNE8hqPgGOr92SWucSkCDTEhhER/wSEnSyAXhDxDVWZW2fPbv3FWp
 9iW18eEtEqn4CWASVE2/6KkQYYW0j3euRSONXLQroRVwpBJA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 66b3cbe6
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Sep 2019 08:02:28 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id o44so767015ota.10
 for <wireguard@lists.zx2c4.com>; Tue, 24 Sep 2019 01:48:03 -0700 (PDT)
X-Gm-Message-State: APjAAAWXCPVc++eGKUqf4cQh1zVQyLD3kQyK4OoPdO/eRsEVF4cRF2OF
 ziFhqYFeXnBO0iPGnaLyW2+a2hT+yu6UGztkoqU=
X-Google-Smtp-Source: APXvYqwWFsCWwJM1DWwo1IGKCtjjPiU7JVi3e7s8CU4mJVeHvP8dNYAmzbtm+O/7EMCIG+URjlfpdfUlbYu9eLNVkP8=
X-Received: by 2002:a9d:ec2:: with SMTP id 60mr967991otj.369.1569314883101;
 Tue, 24 Sep 2019 01:48:03 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 24 Sep 2019 10:47:51 +0200
X-Gmail-Original-Message-ID: <CAHmME9qeF2ScwZwqNwZ3oVYC8zDOt5Sa4UkYsn-q+SkG7JhFcw@mail.gmail.com>
Message-ID: <CAHmME9qeF2ScwZwqNwZ3oVYC8zDOt5Sa4UkYsn-q+SkG7JhFcw@mail.gmail.com>
Subject: breakage in policy routing on 5.3 and 5.3.1
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

Hi folks,

FYI, upstream Linux broke aspects policy routing in 5.3. This isn't
specific to WireGuard, but rather the policy routing engine in
general, but users of the wg-quick(8) bash script for configuring
networks might run into this if they're routing a default route and
have IPv6, because the bash script makes use of policy routing.

I sent two patches upstream to fix bugs introduced with 5.3:
https://lore.kernel.org/netdev/20190923144612.29668-1-Jason@zx2c4.com/
https://lore.kernel.org/netdev/20190924073615.31704-1-Jason@zx2c4.com/

The latter one appears to mitigate the problem, as confirmed by Arch
Linux users: https://bugs.archlinux.org/task/63870

I'll update this thread when we know more from the netdev mailing list.

Thanks,
Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
