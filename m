Return-Path: <SRS0=oxb/=FZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A6C1C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Dec 2020 00:51:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 624A621D7F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Dec 2020 00:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 624A621D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3331cbf4;
	Mon, 21 Dec 2020 00:42:30 +0000 (UTC)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9d27e334
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Dec 2020 00:42:28 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id ce23so11138893ejb.8
 for <wireguard@lists.zx2c4.com>; Sun, 20 Dec 2020 16:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=3vIpQV0RqUXvI6zc39Qj00Ye3INZwA+g01RjN2bH7Ic=;
 b=MBz64Any4EvKIIPzKH84nvB3AQtIpPy1hqq2Byi5xU/0wnNR93m2R931tIGf/G/lju
 wBh8LwXzeiIikec70iLgO+piDoiCqyRkhsq44v6O4PvX886JJpFSGpiMo5DjiS+37sEX
 BVjtdHgCqA0MjKa3sFaYn2OMUCIfL14t2s9pMCPiKHf2EPK5GbYx6TJuz+R04H2ahZOy
 rvwHNde4IXUwJGHubu5b3DKlU8gPk1g+b66vE2QMQYjrv6vuTRUuoXirdmNpEcCchrRY
 prKrdJjE892T/kOrWZpQLGble9hlTvxgd4rPL2qybNdWsaJ13oBVvCDp/FzL8ljIhAbJ
 zi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=3vIpQV0RqUXvI6zc39Qj00Ye3INZwA+g01RjN2bH7Ic=;
 b=RI7BOji7wzwrZjF/Rhn6LmwsCylc6UaoCXKuA0q8BHxItDRjQi9mH6Owopo/ruUW4r
 6vZh7A5LU577vDMqnVjpshn+O7fqg6Lxg+Y3FkSQbXuBaZROVtT4aMApng3hd7siD9tn
 me4q2Ym9EgqsoFVaJmBgxfnuBb8i1INwMr2g1eve2E5TFrIFPb82rnfaKfrrQetFuvn/
 jwyL6BImeHDhyrioO+WJ9WEk3aINZ7cuURP8k/ClgpQ3DOKpD9Q3RRpBRXAHS9cLHKOP
 QgPGMll/ALYAtxmMeli+dN8ic30jNxF3FX98OlmZjGk2VcOsEopoT6SOMlsrI+61rSiM
 jOJg==
X-Gm-Message-State: AOAM533ePfb9wDMRp/YeMc8UR2b8ukTKLxZ/iaS4VADv93ZEvlvjLWNZ
 qZ1wjNMrhU6fCO+avhl1rBSdHWmNZb5PMzZW6unSf2poTQ0=
X-Google-Smtp-Source: ABdhPJyn9mQXteMK+9N/+3EFCBLnCTHhi51skmm2EOMkRMois1Y5L4aERwE3dCJkJ02kMCeux+S0bi443UexpLzQozk=
X-Received: by 2002:a17:906:3a98:: with SMTP id
 y24mr12901855ejd.436.1608511885810; 
 Sun, 20 Dec 2020 16:51:25 -0800 (PST)
MIME-Version: 1.0
References: <CAF-5T9FDVTqPGsS=FcMMyWy2W6O1w7ShdhEEsGUAaQ+fnTMnVg@mail.gmail.com>
 <9B2F58B7-92A3-425E-9B28-DF715B5B5503@tomcsanyi.net>
In-Reply-To: <9B2F58B7-92A3-425E-9B28-DF715B5B5503@tomcsanyi.net>
From: Ronan Lucio <ronanlucio@gmail.com>
Date: Mon, 21 Dec 2020 13:51:14 +1300
Message-ID: <CAF-5T9GDLTTrcgmGcT=YaLbUmEHSmNyE6_X6Xcvof3bcc6HXEg@mail.gmail.com>
Subject: Re: Best practices for adding hosts
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Domi,

Right, it's not on the latest version. Actually, I used to run the
system version, so I can set it to automate unattended-updated.
Anyway, no problem updating it... ;-)

I tried executing it manually and got this:

    $ sudo wg syncconf wg0 <(exec /usr/bin/wg-quick strip wg0)>
    -bash: syntax error near unexpected token `newline'

Any clue?

Thank you,
Ronan

On Mon, Dec 21, 2020 at 1:01 PM Tomcsanyi, Domonkos <domi@tomcsanyi.net> wr=
ote:
>
> Hi Ronan,
>
> There should be a reload option, check the changelog from August this yea=
r:
>
> https://lists.zx2c4.com/pipermail/wireguard/2020-August/005780.html
>
> Maybe you are not running the latest version? In that case just take the =
command from the patch and run it manually.
>
> Kind regards,
> Domi
>
>
> 21.12.2020 d=C3=A1tummal, 0:11 id=C5=91pontban Ronan Lucio <ronanlucio@gm=
ail.com> =C3=ADrta:
>
> =EF=BB=BFHi,
>
> I have a wireguard VPN server, and it's working gracefully, thanks for th=
at.
> I'd like to ask you how can I add more peers without having to restart wg=
.
>
> So far I use to add new peers to the "wg0.conf" file and execute a
> "systemctl restart wg-quick@wg0".
> The problem is all peers go down when I do it, and there's no
> "systemctl reload" option.
>
> If possible, I'd like to keep all configs on config files, so it's
> possible to automate configuration via ansible.
>
> Thanks,
> Ronan
