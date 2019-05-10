Return-Path: <SRS0=opgr=TK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78575C04A6B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 10 May 2019 16:18:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB11F2070D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 10 May 2019 16:18:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="udbA5CrD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB11F2070D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8fd98b04;
	Fri, 10 May 2019 16:18:54 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b9920e6a
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 May 2019 16:18:53 +0000 (UTC)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d941177e
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 May 2019 16:18:53 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id k8so5561523lja.8
 for <wireguard@lists.zx2c4.com>; Fri, 10 May 2019 09:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=TkUwZ/QJUzm/wo8A6jJ9ByupHfOa8ExYDs6cZVKbpUQ=;
 b=udbA5CrD3HGhN8rpUS2qL1dQNysw5Pu2j+/HpBDbbsEplscQcwW9KOdVeLLGj2hZlE
 kHV/pJnqMVcUHNJ2ZYrMr88F1mH1i/qjgJs2J5muGKV9w20NLUPkdoo3KAweSjfaQvsR
 lJzQkkrs0OAW3HU33mi2E5RQ3XWg4X1QttpeQGHybBoHdduTT0oGeWcnwDn8qDEQIuvK
 S6ZplC1nvy6i2dvYeQlNxEPbceJByeYVzith27PAHCsiEd1LPqZ3loJvcwMK9OAzROsW
 AzBGkxQlyR4S2sc1FNUoh+GzJ3iZCVXlx1IrYzyNTUGAQ/1o6FYJEbeOXuuPJUYxKRmL
 nawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=TkUwZ/QJUzm/wo8A6jJ9ByupHfOa8ExYDs6cZVKbpUQ=;
 b=mZKcjE08JyYEcENyZyuu1lNeG6dGL9E6YQkesrsDZSTfUqzAKP6Dsy4ZrO1qTBIRDY
 lP8THLym5wv9jvmRyqR70MGh0ilwONnFxeNaexLA2ghsC5ga7U8GVsHS85Pmd84fG4u5
 EFeq92Msd3dRfym/tF90EDcQ5gUvKZ709ozjttnI/U/Hc7bgeRyX2mFJ4b23YmX7OaCk
 MjfJo1YTgSkAmsorR73R4q4Ny1SEpZn9ahqpB5j0IJqK+RBaD4bP5WDkftO1Fdy1XgkX
 LypCEJjudvvGOp4gI5S2xWiiY2DzOa8NKRjjMzHZlrNwZwsoD+laRfppx9aYwcVh7XUC
 JIrA==
X-Gm-Message-State: APjAAAVrhbWApSnzFAkU0P7ByGy+1q+UOhpJjrkHsrke+dCQ1A2biNP4
 BwLxV/3EWPb411RjzuP6jTkoQgAN5w23dAojdW+TTQ==
X-Google-Smtp-Source: APXvYqzDJUMTF+7BU57wTmjvn1DTR7inpvQWPBUzVVQLxKqKO4UGkM/e4EeydlyEATgd1UR5ws7a5aPrJUfJqR7CQmg=
X-Received: by 2002:a2e:9094:: with SMTP id l20mr6541629ljg.60.1557505130276; 
 Fri, 10 May 2019 09:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190510115445.GA29887@sita-dell>
 <CAJ6XMjFxfm=0L2URLzn8pkZY1y4zU+mskgd7ykRKOjXSza4tSA@mail.gmail.com>
In-Reply-To: <CAJ6XMjFxfm=0L2URLzn8pkZY1y4zU+mskgd7ykRKOjXSza4tSA@mail.gmail.com>
From: Steve Dodd <steved424@gmail.com>
Date: Fri, 10 May 2019 17:18:39 +0100
Message-ID: <CAJ6XMjH23+k+hu0AighRFX4352O1r332mhd28p=+tw3n0T4+ZQ@mail.gmail.com>
Subject: Fwd: bypassing wireguard using firejail
To: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============3694485696384244121=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3694485696384244121==
Content-Type: multipart/alternative; boundary="00000000000006aaac05888aece6"

--00000000000006aaac05888aece6
Content-Type: text/plain; charset="UTF-8"

[sent to author only originally by mistake - I hate Gmail]

On Fri, 10 May 2019 at 12:56, Sitaram Chamarty <sitaramc@gmail.com> wrote:

> I am able to bypass the VPN by using firejail (which is a
> sandbox program to run untrusted applications).
>

I'm not 100% clear on your setup .. Have you got a network namespace set
up? If not, you haven't got much security anyway, I suspect. It turns out
it's not too hard .. you're welcome to my hacky scripts if you're
interested.

Not sure if firejail would still be able to escape a network namespace by
default, but I'm sure it's possible to drop a capability somewhere or
similar if it is.

S.

--00000000000006aaac05888aece6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote">[sent to author only originally=
 by mistake - I hate Gmail]</div><div class=3D"gmail_quote"><br><div dir=3D=
"ltr"><div dir=3D"ltr">On Fri, 10 May 2019 at 12:56, Sitaram Chamarty &lt;<=
a href=3D"mailto:sitaramc@gmail.com" target=3D"_blank">sitaramc@gmail.com</=
a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">I am able to bypass the VPN by using firejail (whi=
ch is a<br>
sandbox program to run untrusted applications).<br></blockquote><div><br></=
div><div>I&#39;m not 100% clear on your setup .. Have you got a network nam=
espace set up? If not, you haven&#39;t got much security anyway, I suspect.=
 It turns out it&#39;s not too hard .. you&#39;re welcome to my hacky scrip=
ts if you&#39;re interested.</div><div><br></div><div>Not sure if firejail =
would still be able to escape a network namespace by default, but I&#39;m s=
ure it&#39;s possible to drop a capability somewhere or similar if it is.</=
div><div><br></div><div>S.</div></div></div>
</div></div>

--00000000000006aaac05888aece6--

--===============3694485696384244121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3694485696384244121==--
