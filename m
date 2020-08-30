Return-Path: <SRS0=dNI2=CI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CD8C433E2
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 30 Aug 2020 09:55:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6B3320757
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 30 Aug 2020 09:55:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bukn-net.20150623.gappssmtp.com header.i=@bukn-net.20150623.gappssmtp.com header.b="uAhd5thk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6B3320757
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bukn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3dacc2b9;
	Sun, 30 Aug 2020 09:27:37 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 81232bf2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 30 Aug 2020 09:27:34 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id c15so3074800wrs.11
 for <wireguard@lists.zx2c4.com>; Sun, 30 Aug 2020 02:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bukn-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=kyXJPoG7DXeozP7CN1eieLKj16C3N6WNsqe9AUG3um4=;
 b=uAhd5thkIjQS6Nwe7qp03fOsFHm3wXKbMiCXUkbLdXwwTncvWGwOBf5OgWTJdQnqZk
 I12ht37ybuSTT0fggTlIIcbl5Fa31e4qQ8YvkYDG8sBrnmUqUujJJcaDrSqC2A5gPV8W
 2uGxXvK9C5Wqk9MDjwGip7wjvgFtqUMBsWOdiPfIwV34+vmYN2Io0Vpa4vXPKt8r9wnP
 09fCQKKwaBd00Z0up8SfQF6iueZCHJfONTIGoCNDB3bmfTcmd8UdDqfMaqAUbbFjvyRw
 QtqUIj3LGfgV7Hu5ylp4dOAfPaew/ibhKes6aM07lEjaReo+3X8apfQsD9ag17N5lEAT
 YEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=kyXJPoG7DXeozP7CN1eieLKj16C3N6WNsqe9AUG3um4=;
 b=UAb6P3yroTNTjCtPqcRAc+nEl5TSnK9w2dYOezDXq1QzBN3AfsopuDCGpxU9TF/xWh
 133+io+oRQ211D4X9UrqjxDNBZX1WWcjLTO1qfrsnquQs42QERmNRT1sFXjtqsdQ29Dk
 Nn4EYJaKYKrFdghtLVWsIkyVHM9gPFe5ty6dsR9KOj4LmSiwdMg6QNuSRTxoeprIula5
 4SfUao/tG05o/GVDxfRd54DY07MoVgvzw3EaI1EbN7w9AphyK5NLJGqyZrKb2Ax4rNVk
 liE+4FCkoxD0XpzDOUOuiiTnXyfsfRYKiZDhaYpXmwfNba641Sy/F0heMNDPvNL/Q63s
 8tHQ==
X-Gm-Message-State: AOAM530b/ELwTwC+hjRNBnoWbmlCggfnfVkB7T2TZ5LZqjOusrqHHNjZ
 fqhZLkEOrC1pyLjN+tscHLLjS74Vll1EnhRs
X-Google-Smtp-Source: ABdhPJyDiOhGv5Ggec0QhXzkTh1OpIMFD1wGte0xGvlqytfI2o45qPND4Rv5xDU+qXmosqxebV1eJw==
X-Received: by 2002:a5d:660d:: with SMTP id n13mr6878346wru.52.1598781314406; 
 Sun, 30 Aug 2020 02:55:14 -0700 (PDT)
Received: from XPS13 ([2a02:8011:8003:20:a181:63e5:bafc:6a04])
 by smtp.gmail.com with ESMTPSA id h8sm6816036wrw.68.2020.08.30.02.55.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 30 Aug 2020 02:55:13 -0700 (PDT)
From: "Aaron Bolton" <aaron@bukn.net>
To: "'Eric Light'" <eric@ericlight.com>
Cc: <wireguard@lists.zx2c4.com>
References: <f4484f4c-d744-48ad-b78f-c6005936d60e@www.fastmail.com>
 <CA+oXxS0r9iMFC32SHweKEiersLVxNQrxopQs+EEsomwGyNGZgw@mail.gmail.com>
 <f6af6006-10fa-40bf-a7b2-bd01b323e85d@www.fastmail.com>
In-Reply-To: <f6af6006-10fa-40bf-a7b2-bd01b323e85d@www.fastmail.com>
Subject: RE: AllowedIPs
Date: Sun, 30 Aug 2020 10:55:12 +0100
Message-ID: <001b01d67eb3$a7d0e7e0$f772b7a0$@bukn.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ7vW28p4j4q45lsb61vzRo9yZBugIX7ScfAYzPNVKn6MWtIA==
Content-Language: en-gb
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

What would be best way to bring up and down the wireguard interface =
without using wg-quick=20

-----Original Message-----
From: Eric Light <eric@ericlight.com>=20
Sent: 30 August 2020 10:01
To: Aaron Bolton <aaron@bukn.net>
Cc: wireguard@lists.zx2c4.com
Subject: Re: AllowedIPs

Ah yep, I haven't done that before, but Quagga has made many appearance =
on this list... And you're right, that's pretty much the time when folks =
stop working with wg-quick!  :-D=20

Good luck!

E

--------------------------------------------
Q: Why is this email five sentences or less?
A: http://five.sentenc.es

On Sun, 30 Aug 2020, at 20:56, Aaron Bolton wrote:
> Yes, this does thanks
>=20
> I plan on using Quagga for BGP over WireGuard tunnels so I guess I=20
> need to avoid wg-quick if that makes changes to the routing table and=20
> firewall as I want to manage those my self
>=20
> > On 30 Aug 2020, at 00:16, Eric Light <eric@ericlight.com> wrote:
> >
> > =EF=BB=BFI believe it's both, in a way.
> >
> > As far as wg is concerned, the AllowedIPs is effectively an ACL. =20
> > Any traffic hitting your wireguard interface from an IP not within=20
> > the AllowedIPs will either be dropped on decryption, or won't even=20
> > be decrypted.  (It's one of these, but I can't remember which)
> >
> > On top of that, wg-quick interprets the AllowedIPs string and does =
other things, such as adding appropriate network routing (the second =
part of your guess), as well as modifying any client firewall rules to =
permit the traffic.
> >
> > Hope this helps  :)
> >
> > E
> >
> > --------------------------------------------
> > Q: Why is this email five sentences or less?
> > A: http://five.sentenc.es
> >
> >> On Sun, 30 Aug 2020, at 04:07, Aaron Bolton wrote:
> >> I=E2=80=99m trying to understand AllowedIPs better is it =
effectively a ACL=20
> >> that day what is allowed down the tunnel or is it mechanism to=20
> >> configure what addresses get routed down the tunnel?
> >>
> >> Thanks in advance
> >>
>

