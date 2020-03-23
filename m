Return-Path: <SRS0=CBQl=5I=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B3FC54EEB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Mar 2020 15:34:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D07920409
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Mar 2020 15:34:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8AUFf4S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D07920409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 24c5b69b;
	Mon, 23 Mar 2020 15:27:25 +0000 (UTC)
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [2607:f8b0:4864:20::e34])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a1587754
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Mar 2020 15:27:23 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id s10so592418vsi.9
 for <wireguard@lists.zx2c4.com>; Mon, 23 Mar 2020 08:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+w4lUYQ9PHk5JoDpJGGvCRm8UMKwj+/9CrH8E/llqSI=;
 b=A8AUFf4S9V1RGMXMZXwAbPtJG3KuQKIJIJ1luOJkU9OT+UxKMsKjJkSQSF2MozsQaZ
 8jeIFOK/j3G1FAXI4wsOip5D35F+7iK7dhrmWtqxbycdSrbh4Ts6/D0EkTAwevy0IX7V
 j3LrDxKNZ1WeSB6r/c9h8J0XZkdIoSQ13WbLUJDPHLbCG9YZ328g/hVV8vZA6OwPvu7O
 CzkZBglPm5Bmdu1WtOU1oFtW7/S0ww5+CDwIV0S+h8Tw03+ihjp4eDArVm1bmOs3W51W
 OkpOhFcq0PaWgWKN4/Omer14t/rYAtD2lCuo4wUFCUxsEa2FZm036OrBJ0/JVBX/xG1h
 +shg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+w4lUYQ9PHk5JoDpJGGvCRm8UMKwj+/9CrH8E/llqSI=;
 b=SSfFR1STsbK/63WFmttLoTsOPcDas5PQzcK2td8eofBK+h6scG21jcvR3OypnvaDdJ
 gx9sJ2lpnI1/96dsm5XsIONov4SAGCsG78Cxe1z0Nm885EeOnc6LZ14YIyJPdXpYPe6G
 swlT4VwBl6qaHmNIoZNi9iL0J+zp9wVKs/mxAR40XljFaGCoKB7kGXXPFnoc9n9JQ06u
 sf+sI3YhijYLsSq0dmuvNlGOCLAvSrIiQPILcylyGHR+tt1D1KGY7wIa+nIqwCjbqOSv
 1aoYcJp7H2M3bZL5FDZF4sYb0rKr8iRaOz/TkYMeJObfwK7h6OGxPm7fMeEo40JzqXTk
 swFw==
X-Gm-Message-State: ANhLgQ3CdfkAzLUhOAXWDIKWfpS1muxH6g81tHzBO5FQNMPgS+Ip+ssy
 LELrym9WwsumxeObB/in1mGCoKNsf6hAMGohRaQ=
X-Google-Smtp-Source: ADFU+vtFaso+vR05E6Wibbak10R+aHXeLio16P7wShJmBASYWeUS/XHhlCeA6hJDub5mI4r5XydlPNWZ5gL5M6+H5IQ=
X-Received: by 2002:a67:2701:: with SMTP id n1mr15594816vsn.103.1584977663301; 
 Mon, 23 Mar 2020 08:34:23 -0700 (PDT)
MIME-Version: 1.0
References: <7273dde5-290a-7657-1c4e-3397db01038b@electromail.org>
 <CAHmME9qd6-Q+XNPeC0xNg+1Dgrc71dwimJ2m5ES5YP_qDRmG=Q@mail.gmail.com>
 <CAHmME9r_DdK36d+Eh8_JwntDnVn_axHNPf93XcXikroPPoBjcw@mail.gmail.com>
 <CAA2ss9GtgnqXYC9ew6_RtA-VtyvVa2Bi3UUb1nUPH8gd7J-F4A@mail.gmail.com>
 <CAHmME9qA_cjndBLzcENgboHdw6+pt5ac-jtY7YimT4622Suz6g@mail.gmail.com>
 <CALpmF+GMqwu70_ZXui-6a8cs-erkhGFWSnqXjHGjaWk8JMRKbw@mail.gmail.com>
In-Reply-To: <CALpmF+GMqwu70_ZXui-6a8cs-erkhGFWSnqXjHGjaWk8JMRKbw@mail.gmail.com>
From: Eiji Tanioka <tanioka404@gmail.com>
Date: Tue, 24 Mar 2020 00:34:10 +0900
Message-ID: <CAA2ss9HyQ7mWD6uw5xK_1+C2Qc2CJf7B-Bt3uWnwqE_pA7VQQw@mail.gmail.com>
Subject: Re: using wireguard intents from tasker?
To: Harsh Shandilya <me@msfjarvis.dev>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Thanks Harsh!

I will check my translations and approve if it's OK.

2020=E5=B9=B43=E6=9C=8823=E6=97=A5(=E6=9C=88) 14:54 Harsh Shandilya <me@msf=
jarvis.dev>:
>
> On Mon, 23 Mar 2020 at 10:49, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > On Sun, Mar 22, 2020 at 11:11 PM Eiji Tanioka <tanioka404@gmail.com> wr=
ote:
> > > Which is more appropriate to provide translation for this feature,
> > > Crowdin or Patch?
>
> Please prefer Crowdin where possible. I've made you a proofreader for
> Japanese as well so that you can approve translations.
