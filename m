Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774F1C6FA82
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 22 Sep 2022 08:56:59 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 7071e8b0;
	Thu, 22 Sep 2022 08:56:57 +0000 (UTC)
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [2001:4860:4864:20::2d])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 8bcab42a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Sep 2022 08:56:54 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1278624b7c4so12892412fac.5
 for <wireguard@lists.zx2c4.com>; Thu, 22 Sep 2022 01:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=tQdzlSDOAs34bUbDmbCyFcrRPsBn/fL1scmgIhrTxl4=;
 b=JBDMnOr2eCPO5YWMWqsjbm+/+mCdqe/LteH88jV5ZiWgbVpeXWHnUyax1jwJjJUcNL
 njKBkXOo/zOaV4+n/KlgBccklPMepV65MAaCWrY1T7avl9+bJVn0wvQbmdeVycKWpK7s
 oJ48ZIhtAoEEmJSqokVlqp/Jh41grMQ7NSymDhsYcGi8ItfC2er0jqN0jGVOEGtm6Cp4
 ugK6TdjM2780geut0qkiwJ5iNEe29g4WFoFrcAc4iM+aaPUkH+8YyTmrK/VOWDxc5rR5
 /WMmvi5c9lrFPZtXJHB58jJcRzHvv9p0SAxOy5ftJA8KQYv0GXkEWTIc/xtPZRbg+oiH
 FtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=tQdzlSDOAs34bUbDmbCyFcrRPsBn/fL1scmgIhrTxl4=;
 b=yp7g//s+PXiRQylcykUtMJvTCOWOyrn6eg9uNEvEfCMHIAc0iuI+4DVCq6C7yzDvKR
 mji+gfDc+tNpQsRfTNZHnD9A7vZMTsue1W8fpY3bAxN7ApXg2sl26vJGewjuhPA0yi4N
 tFqX6c8dREfJW+jQFbIj4IC/Qf15rQSULM1IAeUtCtYeZ2qcq53lnwOUV7FslIJ/hDnI
 CX6cNsRl0ZzkE94dfBEyM2sVInZ+hB0V57uuiMJ32c7eLws15ZOD4YgfFqMiXlOb01Uh
 24CgoPsAvSM5oy4cu1ZxWp9lYV9BdBW4Vomz14j8uWsjmr5/Z7l39YbwJrMhzuq0AzD5
 nKKQ==
X-Gm-Message-State: ACrzQf0NwEF1rG5DX3GWAFxi36bt7eJk1tRbeCaADBt0LhEInHl6SGpV
 noXnWIeMUR/vMQsn+IkjyffGHM8mbIykACNS4y55S1RwKuUYvw==
X-Google-Smtp-Source: AMsMyM72D1dVjbN/5MBLgSSVwxArvRgaakiRauPYvQAJD9Idi9kzpTeApwFxiQi/nBxllYau8X3J8ZrkPJwBlpTggwk=
X-Received: by 2002:a05:6870:7390:b0:12b:e164:1249 with SMTP id
 z16-20020a056870739000b0012be1641249mr1348126oam.179.1663837013271; Thu, 22
 Sep 2022 01:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <CABBZOsks3ZnpcURYHSQcaWCe8ETY21zitPY5TvtTaAm38DT5EA@mail.gmail.com>
 <834CB179-958C-4C0E-8B17-9918C8A992FB@mullvad.net>
In-Reply-To: <834CB179-958C-4C0E-8B17-9918C8A992FB@mullvad.net>
From: Houman <houmie@gmail.com>
Date: Thu, 22 Sep 2022 09:56:17 +0100
Message-ID: <CABBZOs=9VVSDEGPw1eQWmusJotA5toLCn1-uNQeZ+moPthAOxg@mail.gmail.com>
Subject: Re: Wireguard iOS crashes after upgrading to XCode 14
To: Andrej Mihajlov <and@mullvad.net>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Andrej,

It works, well done!

A strange thing though, before your patch I was still able to connect
to the VPN server, if I changed the schema to Release instead of
Debug.  Now with your patch it also works under Debug schema, which is
fantastic.
What could be the technical reason that it still worked under Release?

And what will happen now, are you able to actually get this patch
released on the official repo? The repo hasn't been updated for a
year.  :-)

Thanks,
Houman


On Thu, 22 Sept 2022 at 09:31, Andrej Mihajlov <and@mullvad.net> wrote:
>
> Hi,
>
> I think we have a bug. If I am right, basically in both IPv4 and IPv6 extensions, withMemoryRebound takes capacity which is actually a number of instances of a given type (sockaddr_ variant) and not the byte size of a struct.
>
> Could you please patch your WireGuardKit with the following commit and see if it helps?
>
> https://git.zx2c4.com/wireguard-apple/commit/?h=am/fix-addrinfo-crash
>
> Best regards,
> Andrey Mikhaylov
>
> > On 13 Sep 2022, at 14:41, Houman <houmie@gmail.com> wrote:
> >
> > My existing Wireguard iOS implementation stopped working after
> > upgrading to Xcode 14 today.
> > When trying to connect to servers that support only IPv4, then it's
> > fine. But if the server supports both IPv6 and IPv4 then the tunnel
> > crashes:
> >
> > This IPv6 extension in
> > wireguard-apple/Sources/WireGuardKit/IPAddress+AddrInfo.swift crashes
> > with a Fatal Error at addrInfo.ai_addr.withMemoryRebound()
> >
> > The whole extension below:
> >
> > extension IPv6Address {
> >    init?(addrInfo: addrinfo) {
> >        guard addrInfo.ai_family == AF_INET6 else { return nil }
> >
> >        let addressData = addrInfo.ai_addr.withMemoryRebound(to:
> > sockaddr_in6.self, capacity: MemoryLayout<sockaddr_in6>.size) { ptr ->
> > Data in
> >            return Data(bytes: &ptr.pointee.sin6_addr, count:
> > MemoryLayout<in6_addr>.size)
> >        }
> >        self.init(addressData)
> >    }
> > }
> >
> > Has anyone else experienced this problem?
> >
> > Thanks,
>
