Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A61C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 16:52:09 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 205486103C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 16:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 205486103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7f71278e;
	Wed, 22 Sep 2021 16:50:36 +0000 (UTC)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [2607:f8b0:4864:20::52b])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5b98ff7f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 16:50:32 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id r2so3305353pgl.10
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 09:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=ief5IIudUEYwYK1KUK6BWHECgl8Jb2wqrnGUclS72I4=;
 b=Ve5Cp7/06a7x8beqvzSKEt7tLhxjJsrA0VGRUsRqArJx0rewkP0EiQe/ikr/C3UIly
 n/88NcXDlbL+M4sm0Akg7CVFtCK6lbcWWnwpXo7MbXt2h7jZIGLNe0lCBi3pRgGxoCg0
 BMETfLkahzFkgJHSlnnC9jO+vjvfmX0xou6X6YG1dURXFVTOwyB+w2S3VAODKiSv5+mq
 wlJEPPJ6yY9ewmiE9u7EYMbjKF7+F8Rv4eLepU/ojNrrBzxRsf+rArvaFp9BmACpaq2k
 hBUMK2UPqU5JeFguzqbOepUSEhmgByAjF3YHebwn+ghC1ocj0aWr+y41x1n6cndQMW7Y
 O1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=ief5IIudUEYwYK1KUK6BWHECgl8Jb2wqrnGUclS72I4=;
 b=k95u4OXUm5W8YGh1TK79kFm29GlrRAM4UimFwBDNThxnjNQOGH5QErbNBhLxvYsriT
 xIadP/49rng9igw907q+XXn/O0pn9NEKo7OV2+p1B5LJAG+akLlP6bqV7Su+TEHk/l/+
 tP0os5biiOKlZMMjz4nybXO7wyxbZUx8NzNuf7/Ncvo8xiGQPJS+uNgKxolP33OZyDai
 uLiHMB9AjzYk4CDtruBeQoww9we+rVBAHKTMQZOp/w7o6fq5hz9gxWXTVoSIHt/qxlYB
 tidWDeCEUe1yLDzoEIB+4Iln+W7hsEi4jDazIohMddBawYgXIeGR/7i31e8soZJ3zFe3
 B/jA==
X-Gm-Message-State: AOAM533D1yyGBZ3p/1YNDKhuoW78Q3vpfxScbRoCR/g6AsT/NzJLNlCY
 vmFN9GH6BP3TJl5C4yRHdm4=
X-Google-Smtp-Source: ABdhPJxzra6bQkXUDonAZ7zlbq40kdwR62u7/ge7tOoEaX8nibjcItkk6vTM4aRZQisfcg8x9likAQ==
X-Received: by 2002:a05:6a00:148d:b0:440:4e92:798f with SMTP id
 v13-20020a056a00148d00b004404e92798fmr132038pfu.17.1632329430579; 
 Wed, 22 Sep 2021 09:50:30 -0700 (PDT)
Received: from smtpclient.apple (216-19-179-128.dyn.novuscom.net.
 [216.19.179.128])
 by smtp.gmail.com with ESMTPSA id p2sm3511912pgd.84.2021.09.22.09.50.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Sep 2021 09:50:29 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: WireGuard Configurations Gone After iOS 15 Upgrade
From: Miguel Arroz <miguel.arroz@gmail.com>
In-Reply-To: <96bcc87f-7de1-05a4-641a-27ffac7b052d@attglobal.net>
Date: Wed, 22 Sep 2021 09:50:29 -0700
Cc: Anatoli <me@anatoli.ws>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Roopesh Chander S <roop@roopc.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <DA133F84-7C21-4234-97DB-FFEDF79D1607@gmail.com>
References: <95105bdf-8442-4c7c-dcc8-719b0784bced@attglobal.net>
 <CAHmME9qQZMb4ajHKHY8w-b8_9BNv8YM9YKyNO9U9RH0_thrCPw@mail.gmail.com>
 <49d1235b-1ed8-68f6-33bf-574ac0ad40e0@anatoli.ws>
 <CAHmME9q58QCUEY7vqhX767wPtqCPr23gmXgSS_bvbfvNZva=SQ@mail.gmail.com>
 <96bcc87f-7de1-05a4-641a-27ffac7b052d@attglobal.net>
To: stunnel@attglobal.net,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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

Hi,

  I have two devices upgraded to iOS 15, an iPhone and iPad. Both had a =
tunnel configured with on-demand set. The behaviour was the same on =
both: the tunnel worked, but the app couldn=E2=80=99t show information, =
the exact way Eddie described. When I click the Edit button, I see all =
the fields blank, and the peer is gone, just like if I was creating a =
new configuration from scratch.

  I tried the following on the iPhone:

  - Turned the tunnel off using the switch in the app. As soon as it =
tried to turn itself on again (due to the on-demand flag), it showed an =
error and the tunnel could not be brought back up (I don=E2=80=99t =
remember the exact wording of the error alert).
  - I deleted the tunnel configuration, and created one from scratch. =
Everything is working now. The tunnel works, and the app can read the =
configuration. I rebooted the iPhone to make sure it could reload =
everything afterwards, and it did.

  I still have the iPad in the original state.

  The log is essentially a repetition of the following line: "Unable to =
open config from keychain: -25300=E2=80=9D.

  I=E2=80=99m not sure if a local build made by me would help debugging =
this, as if I recall correctly from the Keychain API, the app group key =
(kSecAttrAccessGroup) is dependent on the team and bundle IDs (enforced =
by the code signing and runtime verification process), so I doubt I can =
build something that will be able to access the keychain that is already =
there. The only valid test would be building and installing it on iOS 14 =
and then upgrading to iOS 15, or distributing a beta version using =
TestFlight using the official team ID.

  Regards,

Miguel Arroz


> On Sep 22, 2021, at 8:23 AM, Eddie <stunnel@attglobal.net> wrote:
>=20
> On 9/21/2021 9:50 PM, Jason A. Donenfeld wrote:
>> Hi,
>>=20
>> I'm not able to reproduce the bug quite yet, but I'd like to get a
>> better idea of what the bug is. Can you confirm that after =
reimporting
>> configs into iOS 15, they work just fine? And the issue is just in =
the
>> 14->15 flow? If this is correct, I see two issues:
> I haven't tried re-importing anything yet, in case you needed more =
information before trying that.
>> 1. Something goes wrong with the keychain from 14->15 and the app
>> loses authorization.
>>=20
>> 2. When the app can't open a keychain item, it deletes the VPN
>> profile? Or does it just gray it out? If it's deleting it, that's
>> wrong; it ought to just remain disabled until it's readable again.
> If I select one of the tunnels, all I see on the "Edit" page is the =
status slider and the on demand status.  The section under INTERFACE is =
completely missing.  Selecting Edit brings up the screen you would see =
when creating a new tunnel, with all parameters showing (in grey) =
Required, Automatic, Optional, etc.  There are no values from the =
original configuration shown.
>> Jason
>>=20

