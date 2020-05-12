Return-Path: <SRS0=yjuW=62=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F5D5C54E4B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 12 May 2020 06:58:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9AE020752
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 12 May 2020 06:58:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eeiYoYJv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9AE020752
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f5d81b62;
	Tue, 12 May 2020 06:43:43 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0535e33e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 May 2020 06:43:41 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id b26so9615841lfa.5
 for <wireguard@lists.zx2c4.com>; Mon, 11 May 2020 23:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5k0ohXy5gVPEwdskyRChhHM++TW93d62W27X++MsJ2Y=;
 b=eeiYoYJvBMBHVCsivBDq0wY82QDQptzYkEfjMMm3mihoBogmsMLhUnZ/EjY0V06BYo
 2O3uS1h1q4AnXb0JqGFncSHWHygviGc6/aAZ0Wh4WAXaFD/P9JMa0V0BebZcPxMTWVLn
 lJFQoOtf5b5ryDJELW1HrZnZk8XezL2XBYOciL9/0PDoPjTIqI4oqO2xhrng4dVj/OjQ
 LtHecoHsrEQ76QiurGwXxsex8ikdPfpzpGqrTfpgxPbT3ps8fGHhL3AzAtMRkmD34rC5
 uMrtC123VS2s43WfpMRATcygkxll0k1cJ097z7eIKq6ZPtz8dCJo2nfhB8dHMXqax29V
 xK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5k0ohXy5gVPEwdskyRChhHM++TW93d62W27X++MsJ2Y=;
 b=QNR+G34OJ5StvTpsxvZ8CIVdPOcziHY/XUteMm4mzIM33Gj9e0M0/FKVycWyBzpamO
 pbqcQa5ucRpE5LQO9J2WG59mh58tlBJSJhqD+YV9stWim6ZeCr4HY4pA9PQr3ME4OFnl
 jGqJvv9RXY+/kOp7y/CJiXkUYX46NWVTvWjExoRPda/BaDTAKqqqYzEoLGagxrk41Zid
 34xW+WJIUsQ2AV453s2clgy5aao+ZK0fsXCrHu1lkwaYZ5CVK0/BqpqIx1bIXsl45kNu
 PclKntPWlQ/9QvkR4BJWBp36MDzZKx/FcF0ncc0tbnb+3o7z/YGKyYvqCjCnFz8nQOrb
 w7Hg==
X-Gm-Message-State: AOAM530N4mrhlR5aW3agUNS2WPcOcoMrUs8mMEmCcDjj8/U+jKYrBva2
 za28kimYeoUH2z2wbBCRMtaedCxIphzCDHZmIxaqW881PzI=
X-Google-Smtp-Source: ABdhPJxF+3T8nT+HmlKhxPJbhps6Zndwv07otuMxx0hfUjgc0bC7I1WLt17Ie1f90swu3+eCtp1k3nPgWy+UVR4hn/8=
X-Received: by 2002:ac2:5999:: with SMTP id w25mr13191542lfn.196.1589266624892; 
 Mon, 11 May 2020 23:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmhVkoE_fL59VJqqXoGHX_S3E9+h=KwyNchWSBrEfPHrpNyoQ@mail.gmail.com>
 <71c12e22-c7b6-9753-cc44-aac0f51592ff@pallas.us>
 <CAKmhVkrRbb_KncDjhM6gMcJRpCrK6WcB1Ed=WfVhScDHw96Gjw@mail.gmail.com>
 <CAHmME9qv2R1CBFAQ1xqM3eOtegLaZi=f7cfA26JS=8bGTLpPFg@mail.gmail.com>
 <9c64d009-4c24-425f-9126-ba93279c208e@www.fastmail.com>
 <CAHmME9rbKP4zB5nWG-9vf+2ZepXm+Gqii=qjQ8cnG0O+Dhu2tQ@mail.gmail.com>
 <CADGd2Dq3-EMBqA6bSKbR=C-pTZToPxv1xkM4BvYGh910T_e1Tg@mail.gmail.com>
 <CAHmME9q0mr_nF7rsWfFmNtAr6+6uv1yA=j6oJAoKZVXamH--zw@mail.gmail.com>
 <f88c4fdf-ff31-a489-cb58-c02309016b13@pallas.us>
In-Reply-To: <f88c4fdf-ff31-a489-cb58-c02309016b13@pallas.us>
From: Dimitar Vassilev <dimitar.vassilev@gmail.com>
Date: Tue, 12 May 2020 09:56:53 +0300
Message-ID: <CAF+AZZULw_O3wjeEkSnWsXOKs_uddr9=a0-04OroKNhsSnKqSw@mail.gmail.com>
Subject: Re: WireGuard over WireGuard
To: Derrick Lyndon Pallas <derrick@pallas.us>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi all,

for my enlightenment can you please advise in which situation such
setups are useful?

Thanks!


=D0=9D=D0=B0 =D1=87=D1=82, 7.05.2020 =D0=B3. =D0=B2 4:01 Derrick Lyndon Pal=
las <derrick@pallas.us> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0:
>
> Note for the list: IPv6 has a minimum of 1280, which means 1360 in the
> outer layer. ~Derrick
>
>
> On 5/6/20 4:54 PM, Jason A. Donenfeld wrote:
> > On Wed, May 6, 2020 at 5:28 PM John Lauro <johnalauro@gmail.com> wrote:
> >> Wireguard is defaulting to 1420 MTU, the ethernet adapter is 1500 MTU,
> >> and I have IPv6 completely disabled.
> >>
> >> Can/should the MTU of wireguard be bumped to 1440?
> > You could if you wanted. But if you don't do it perfectly on all sides
> > with total uniformity and clearheadedness about your network design,
> > you'll run into subtle problems.
