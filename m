Return-Path: <SRS0=uuIP=E5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF933C63697
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Nov 2020 19:53:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0379B20717
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Nov 2020 19:53:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZrvHyCZc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0379B20717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa0710ef;
	Mon, 23 Nov 2020 19:48:08 +0000 (UTC)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 21920c81
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Nov 2020 19:48:05 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id l5so18363976edq.11
 for <wireguard@lists.zx2c4.com>; Mon, 23 Nov 2020 11:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/0mxC7q6UA6ROcwxer9Lc3FeZuIzPQ8dpnLszuV5JLk=;
 b=ZrvHyCZcGWN/iCdRJERJlroLrj7Qld02l79FLy578tNm7JBtd7gK2LIxkgJUDVSjFv
 O4IyWS3m96wgAa7kdhxi3be5Xvm3jLR4KZOxKgbzUKfCVIIjRHhOlBhkHotluetRQSGj
 pQGKZ315Cqrisyc+ctBVIsxZynaY0rKDzHJOf3CrUl/0YDNkBd1tSNjH+I44M/x9bVtu
 lEAv3s5c2fnEbfIW1iMNdfMfrah+ed2BiPWdsZvCB8CkbbHyDEVk2jIlelmiAA3XcN4y
 9sS56MR5jPv+T2tVNTJvPwfKmHan4/evl+qmkwXmls0DMBxLHRXm1Z89vDTwypP1GVUu
 ab4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/0mxC7q6UA6ROcwxer9Lc3FeZuIzPQ8dpnLszuV5JLk=;
 b=eqog7WMoxZsLeAgMu4PegX31QxmkzzKRaNWtL+qmdiAerEMBFSYVyJsOAi3fyXLWEZ
 JoUvj/toNPeTbnuRPJyajdOkP6wcrQTuK73OQQZMxvV/ytWw4x6aqloT8a4ZFrAzLHey
 jA/YME02YH+w/rt7pmtZNof4ZemphUOw/k2ix6WEHiUmpqIMKyaNoo7aZCpwlDg5rCfF
 op4EpjcVELtiWng9IjDG028GeFqJDcAMeWxaonElyIUeGR+cBFWYEAyVWkrh7CQBzlHV
 zWJZkGJ1itUpnCzW1t4dlhdE/zSQOOOBvzyI+un7KJSC2A/crCHHwUYrmayBeLw8nAcy
 5LDQ==
X-Gm-Message-State: AOAM532vaMFpY9SQmj4ZsJcPhq3GXK9r0jND1On/wxDF0LsSNSzMfFnt
 jhpFjNF0ajkeiHT0wT6WZZhEaNMDf/KP+hP2qDnma7fZJxtV1A==
X-Google-Smtp-Source: ABdhPJyKXW+eG2YEC0JoqKCaOyyzHJT5OsnM7+Eutirvokh7rt3jPrVJrRmB9N85YS3PnspIzLGceP8d9obxvJ4QAYg=
X-Received: by 2002:aa7:d7d7:: with SMTP id e23mr867514eds.78.1606161209535;
 Mon, 23 Nov 2020 11:53:29 -0800 (PST)
MIME-Version: 1.0
References: <CACnYWReJC+Ff8G+uWLW6i=rsR1w=O-6aDFBG-yd__ZuuRh83CA@mail.gmail.com>
 <CAHmME9qyVb7kuj+VYAaQRqZ-i_Mptr6_2BGGoz+wf5Ke4WXUMw@mail.gmail.com>
In-Reply-To: <CAHmME9qyVb7kuj+VYAaQRqZ-i_Mptr6_2BGGoz+wf5Ke4WXUMw@mail.gmail.com>
From: Ruben Di Battista <rubendibattista@gmail.com>
Date: Mon, 23 Nov 2020 20:53:18 +0100
Message-ID: <CACnYWRdj9ziO7dPvHscpiUNrQoBaENGHHOoyevrWFqU07vKpWg@mail.gmail.com>
Subject: Re: WSL2 and Wireguard
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

Ehi Jason!

Thanks for the detailed answer. I just checked on the new 0.3 and the
problem still persists. I'm not a network engineer, but I think it
might be useful if you can provide more details in the Github issue
(or the one I link in the second comment) that could help speed up the
process...

I guess it's a problem with their hyper-v networking adapter...

On Mon, Nov 23, 2020 at 5:51 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Ruben,
>
> On Mon, Nov 23, 2020 at 5:43 PM Ruben Di Battista
> <rubendibattista@gmail.com> wrote:
> >
> > Hello,
> >
> > I'm experiencing a problem with Wireguard and WSL2. If I activate my
> > tunnel and then I ping a machine on the VPN IP range from WSL2, I
> > don't get any response.
> >
> > However, if after activating Wireguard, I ping from cmd or PowerShell,
> > I successfully get the ping back and I'm able then also to ping from
> > WSL2.
> >
> > I'm not sure if this is related to Wireguard or WSL2, In any case I
> > reported the bug here: https://github.com/microsoft/WSL/issues/5810
> >
> > Is it a problem of my machine, a problem from WSL2 or Windows Wireguard=
?
>
> That's pretty weird. I've seen a few related bugs like that, where it
> seems like WSL will drop packets that don't meet some unusual stateful
> criteria. I don't know if they're trying to do some kind of connection
> tracking, or if the routing logic is partially broken for NdisMediumIP
> devices.
>
> I assume you're experiencing this using the latest WireGuard 0.3 [1]?
>
> To answer your direct question, though, I think this might be a WSL
> problem rather than a WireGuard problem. If that Github issue doesn't
> get any attention after some time, I can try to reverse engineer the
> hyper-v networking drivers to see what's going on, but as always with
> that kind of thing, no guarantees on its success.
>
> Jason
>
> [1] https://lists.zx2c4.com/pipermail/wireguard/2020-November/006075.html



--=20
          _
-.     .=C2=B4  |=E2=88=9E=E2=88=9E=E2=88=9E=E2=88=9E
  ',  ;    |=E2=88=9E=E2=88=9E=E2=88=9E=E2=88=9E=E2=88=9E=E2=88=9E
    =CB=9C=CB=9C       |=E2=88=9E=E2=88=9E=E2=88=9E=E2=88=9E=E2=88=9E=E2=88=
=9E=E2=88=9E=E2=88=9E=E2=88=9E RdB
    ,.,    |=E2=88=9E=E2=88=9E=E2=88=9E=E2=88=9E=E2=88=9E=E2=88=9E
  .'   '.  |=E2=88=9E=E2=88=9E=E2=88=9E=E2=88=9E
-'       `'
https://rdb.is
