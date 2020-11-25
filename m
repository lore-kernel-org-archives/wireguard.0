Return-Path: <SRS0=pGg3=E7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21455C56202
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Nov 2020 11:46:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE953206D9
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Nov 2020 11:46:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="xSXN15oZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE953206D9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 22a29ab6;
	Wed, 25 Nov 2020 11:40:12 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id dfbbd182
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Nov 2020 11:40:10 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6d9213a7
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Nov 2020 11:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=HUPYhR4dj8UQ2CsYiwFhL5OL+LE=; b=xSXN15
 oZ9vdQff0l2q8cOYz5YbSvW7lKA0xLJdrFPSio695XYO2FW3j6ZsI3gHhy4jrVIQ
 Z/ih6Ig5dAT22BbgWCAnh5fOy61b56CnxrwTulSDBP+HKmbmW/wuzbyJs1FsxoBg
 KboGFWTN/hpSk03Cun8GJoQXYxlw05EUmvHjHMxDcF7xcjNC/KE7CMbd5jjwxb3C
 x6rcMYZ8U2XL+qBHUGEW7gye/wkAdTakrLsUkchuNQzUn0xUQGfwwtIimqjRiYhD
 VspN0l1aBrYjcVPQ0HARfkXQKIVdB7Hz0qdg4ZoLYQtnL59+wHsEzBt9LwseLEVV
 lxzjAPr4h+Vo5a2w==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e842de5a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Nov 2020 11:40:56 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id x25so2525323qkj.3
 for <wireguard@lists.zx2c4.com>; Wed, 25 Nov 2020 03:45:48 -0800 (PST)
X-Gm-Message-State: AOAM531xpiUj6DdLH0geRO7UoKSPf2kI9AeKlNLZK96EkuIyi26Hp9xi
 lA+V8aKMZt0d+pYJWYIUJLI3Pp1zQaRFw/idnXE=
X-Google-Smtp-Source: ABdhPJz52VMnlHLjqgB86UURc3DBizi8qVpIqC8EdVROJTsbJI6xb4K21r9S66HRQnD2j3wZCX5B4WMs2cusJWb7wlo=
X-Received: by 2002:a25:d047:: with SMTP id h68mr3332345ybg.49.1606304748190; 
 Wed, 25 Nov 2020 03:45:48 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9qAjqF-p=AHrzpmO+KnFjSADMkqpYmOn+TRY9q04aBFMQ@mail.gmail.com>
 <C7C6HAUS055X.339KNR4ZAROGW@enhorning>
 <CAHmME9rp_nDjP6d_yki4LPP2pr1BejWcD7FQ5-A9MXZ9ORxZvg@mail.gmail.com>
In-Reply-To: <CAHmME9rp_nDjP6d_yki4LPP2pr1BejWcD7FQ5-A9MXZ9ORxZvg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 25 Nov 2020 12:45:37 +0100
X-Gmail-Original-Message-ID: <CAHmME9oMFQtePYt37+4eyOn23mwHwP2UGxQi=SaJk9J3p1zCpw@mail.gmail.com>
Message-ID: <CAHmME9oMFQtePYt37+4eyOn23mwHwP2UGxQi=SaJk9J3p1zCpw@mail.gmail.com>
Subject: Re: Using WireGuard on Windows as non-admin - proper solution?
To: Riccardo Paolo Bestetti <pbl@bestov.io>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: multipart/mixed; boundary="000000000000ead86c05b4ecf722"
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

--000000000000ead86c05b4ecf722
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 25, 2020 at 11:30 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On 11/25/20, Riccardo Paolo Bestetti <pbl@bestov.io> wrote:
> > On Wed Nov 25, 2020 at 2:08 AM CET, Jason A. Donenfeld wrote:
> >> Hi Riccardo,
> >>
> >> Interesting consideration. I didn't know that.
> > I didn't know that either until I tried to deploy WireGuard on a laptop
> > yesterday! It seems not to be documented anywhere.
> >
> > The group has been around since Windows XP afaik, however I have no idea
> > whether the associated licesing chicanery has also been around that long.
> >
> >>
> >> Can you not add that group manually need be?
> > I'm not an expert on Windows, but a quick lookup on the net suggests you
> > cannot create a local group with a specific SID.
>
> I'm not convinced this is the case. We're talking about a local group.
> Surely there's some on-disk representation of available groups and
> associations, no? This line of inquiry needs to be fully exhausted
> before we even consider alternatives.
>
> Has Microsoft documented this limitation?

Well, I made Network Configuration Operators work just fine on Windows
10 Home edition. Here are the steps I followed, which I'm sure I could
compress into a single powershell script or executable need be:

1. Download psexec from the sysinternals page:
https://docs.microsoft.com/en-us/sysinternals/downloads/psexec
2. Download nco.reg from the attachment in this email.
3. Open up an administrator console and type `psexec -i -s regedit`.
4. Choose File->Import and select the nco.reg file.
5. Add your user to the group like usual (e.g. `Add-LocalGroupMember
-Group "Network Configuration Operators" -Member MrDerp`).

I've confirmed that this works fine with the limited operator ui on
WireGuard for Windows 0.3.1.

Jason

--000000000000ead86c05b4ecf722
Content-Type: text/x-ms-regedit; charset="UTF-16LE"; name="nco.reg"
Content-Disposition: attachment; filename="nco.reg"
Content-Transfer-Encoding: base64
Content-ID: <f_khxccl6a0>
X-Attachment-Id: f_khxccl6a0

//5XAGkAbgBkAG8AdwBzACAAUgBlAGcAaQBzAHQAcgB5ACAARQBkAGkAdABvAHIAIABWAGUAcgBz
AGkAbwBuACAANQAuADAAMAANAAoADQAKAFsASABLAEUAWQBfAEwATwBDAEEATABfAE0AQQBDAEgA
SQBOAEUAXABTAEEATQBcAFMAQQBNAFwARABvAG0AYQBpAG4AcwBcAEIAdQBpAGwAdABpAG4AXABB
AGwAaQBhAHMAZQBzAFwAMAAwADAAMAAwADIAMgBDAF0ADQAKACIAQwAiAD0AaABlAHgAOgAyAGMA
LAAwADIALAAwADAALAAwADAALAAwADAALAAwADAALAAwADAALAAwADAALABlADgALAAwADAALAAw
ADAALAAwADAALAAwADMALAAwADAALAAwADEALAAwADAALABlADgALAAwADAALAAwADAALAAwADAA
LAAzAGUALAAwADAALAAwADAALABcAA0ACgAgACAAMAAwACwAMAAwACwAMAAwACwAMAAwACwAMAAw
ACwAMgA4ACwAMAAxACwAMAAwACwAMAAwACwAZAA4ACwAMAAwACwAMAAwACwAMAAwACwAMAAwACwA
MAAwACwAMAAwACwAMAAwACwAMAAwACwAMAAyACwAMAAwACwAMAAwACwAMQBjACwAMAAwACwAMAAw
ACwAMAAwACwAXAANAAoAIAAgADAAMQAsADAAMAAsADAAMAAsADAAMAAsADAAMQAsADAAMAAsADEA
NAAsADgAMAAsAGMAOAAsADAAMAAsADAAMAAsADAAMAAsAGQAOAAsADAAMAAsADAAMAAsADAAMAAs
ADEANAAsADAAMAAsADAAMAAsADAAMAAsADQANAAsADAAMAAsADAAMAAsADAAMAAsADAAMgAsAFwA
DQAKACAAIAAwADAALAAzADAALAAwADAALAAwADIALAAwADAALAAwADAALAAwADAALAAwADIALABj
ADAALAAxADQALAAwADAALAAxADMALAAwADAALAAwADUALAAwADEALAAwADEALAAwADEALAAwADAA
LAAwADAALAAwADAALAAwADAALAAwADAALAAwADEALAAwADAALAAwADAALABcAA0ACgAgACAAMAAw
ACwAMAAwACwAMAAyACwAYwAwACwAMQA0ACwAMAAwACwAZgBmACwAZgBmACwAMQBmACwAMAAwACwA
MAAxACwAMAAxACwAMAAwACwAMAAwACwAMAAwACwAMAAwACwAMAAwACwAMAA1ACwAMAA3ACwAMAAw
ACwAMAAwACwAMAAwACwAMAAyACwAMAAwACwAOAA0ACwAXAANAAoAIAAgADAAMAAsADAANAAsADAA
MAAsADAAMAAsADAAMAAsADAAMAAsADAAMAAsADEANAAsADAAMAAsADAAYwAsADAAMAAsADAAMgAs
ADAAMAAsADAAMQAsADAAMQAsADAAMAAsADAAMAAsADAAMAAsADAAMAAsADAAMAAsADAAMQAsADAA
MAAsADAAMAAsADAAMAAsADAAMAAsAFwADQAKACAAIAAwADAALAAwADAALAAxADgALAAwADAALAAx
AGYALAAwADAALAAwAGYALAAwADAALAAwADEALAAwADIALAAwADAALAAwADAALAAwADAALAAwADAA
LAAwADAALAAwADUALAAyADAALAAwADAALAAwADAALAAwADAALAAyADAALAAwADIALAAwADAALAAw
ADAALAAwADAALABcAA0ACgAgACAAMAAwACwAMQA4ACwAMAAwACwAMQBmACwAMAAwACwAMABmACwA
MAAwACwAMAAxACwAMAAyACwAMAAwACwAMAAwACwAMAAwACwAMAAwACwAMAAwACwAMAA1ACwAMgAw
ACwAMAAwACwAMAAwACwAMAAwACwAMgA0ACwAMAAyACwAMAAwACwAMAAwACwAMAAwACwAMAAwACwA
XAANAAoAIAAgADMAOAAsADAAMAAsADAAYwAsADAAMAAsADAAMgAsADAAMAAsADAAMQAsADAAYQAs
ADAAMAAsADAAMAAsADAAMAAsADAAMAAsADAAMAAsADAAZgAsADAAMwAsADAAMAAsADAAMAAsADAA
MAAsADAAMAAsADAANAAsADAAMAAsADAAMAAsAGQAZQAsAGEAMgAsADIAOAAsAFwADQAKACAAIAA2
ADcALAAyADEALAAzAGUALABkADIALABhAGYALAAxADkALABhAGQALAA1AGQALAA3ADkALABiADAA
LABjADEALAAwADcALAAyADkALAAyADcALAA1ADYALABmAGMALAAyADAALABkADgALABhAGQALAA2
ADYALABmADYALAAxADAALABmADIALAA2ADgALABmAGEALABcAA0ACgAgACAAZABmACwAMgBhACwA
ZgA4ACwAMABmACwAMAAxACwAMAAyACwAMAAwACwAMAAwACwAMAAwACwAMAAwACwAMAAwACwAMAA1
ACwAMgAwACwAMAAwACwAMAAwACwAMAAwACwAMgAwACwAMAAyACwAMAAwACwAMAAwACwAMAAxACwA
MAAyACwAMAAwACwAMAAwACwAMAAwACwAXAANAAoAIAAgADAAMAAsADAAMAAsADAANQAsADIAMAAs
ADAAMAAsADAAMAAsADAAMAAsADIAMAAsADAAMgAsADAAMAAsADAAMAAsADQAZQAsADAAMAAsADYA
NQAsADAAMAAsADcANAAsADAAMAAsADcANwAsADAAMAAsADYAZgAsADAAMAAsADcAMgAsADAAMAAs
ADYAYgAsADAAMAAsAFwADQAKACAAIAAyADAALAAwADAALAA0ADMALAAwADAALAA2AGYALAAwADAA
LAA2AGUALAAwADAALAA2ADYALAAwADAALAA2ADkALAAwADAALAA2ADcALAAwADAALAA3ADUALAAw
ADAALAA3ADIALAAwADAALAA2ADEALAAwADAALAA3ADQALAAwADAALAA2ADkALAAwADAALAA2AGYA
LABcAA0ACgAgACAAMAAwACwANgBlACwAMAAwACwAMgAwACwAMAAwACwANABmACwAMAAwACwANwAw
ACwAMAAwACwANgA1ACwAMAAwACwANwAyACwAMAAwACwANgAxACwAMAAwACwANwA0ACwAMAAwACwA
NgBmACwAMAAwACwANwAyACwAMAAwACwANwAzACwAMAAwACwAMAAwACwAMAAwACwAXAANAAoAIAAg
ADQAZAAsADAAMAAsADYANQAsADAAMAAsADYAZAAsADAAMAAsADYAMgAsADAAMAAsADYANQAsADAA
MAAsADcAMgAsADAAMAAsADcAMwAsADAAMAAsADIAMAAsADAAMAAsADYAOQAsADAAMAAsADYAZQAs
ADAAMAAsADIAMAAsADAAMAAsADcANAAsADAAMAAsADYAOAAsAFwADQAKACAAIAAwADAALAA2ADkA
LAAwADAALAA3ADMALAAwADAALAAyADAALAAwADAALAA2ADcALAAwADAALAA3ADIALAAwADAALAA2
AGYALAAwADAALAA3ADUALAAwADAALAA3ADAALAAwADAALAAyADAALAAwADAALAA2ADMALAAwADAA
LAA2ADEALAAwADAALAA2AGUALAAwADAALABcAA0ACgAgACAAMgAwACwAMAAwACwANgA4ACwAMAAw
ACwANgAxACwAMAAwACwANwA2ACwAMAAwACwANgA1ACwAMAAwACwAMgAwACwAMAAwACwANwAzACwA
MAAwACwANgBmACwAMAAwACwANgBkACwAMAAwACwANgA1ACwAMAAwACwAMgAwACwAMAAwACwANgAx
ACwAMAAwACwANgA0ACwAXAANAAoAIAAgADAAMAAsADYAZAAsADAAMAAsADYAOQAsADAAMAAsADYA
ZQAsADAAMAAsADYAOQAsADAAMAAsADcAMwAsADAAMAAsADcANAAsADAAMAAsADcAMgAsADAAMAAs
ADYAMQAsADAAMAAsADcANAAsADAAMAAsADYAOQAsADAAMAAsADcANgAsADAAMAAsADYANQAsADAA
MAAsAFwADQAKACAAIAAyADAALAAwADAALAA3ADAALAAwADAALAA3ADIALAAwADAALAA2ADkALAAw
ADAALAA3ADYALAAwADAALAA2ADkALAAwADAALAA2AGMALAAwADAALAA2ADUALAAwADAALAA2ADcA
LAAwADAALAA2ADUALAAwADAALAA3ADMALAAwADAALAAyADAALAAwADAALAA3ADQALABcAA0ACgAg
ACAAMAAwACwANgBmACwAMAAwACwAMgAwACwAMAAwACwANgBkACwAMAAwACwANgAxACwAMAAwACwA
NgBlACwAMAAwACwANgAxACwAMAAwACwANgA3ACwAMAAwACwANgA1ACwAMAAwACwAMgAwACwAMAAw
ACwANgAzACwAMAAwACwANgBmACwAMAAwACwANgBlACwAMAAwACwAXAANAAoAIAAgADYANgAsADAA
MAAsADYAOQAsADAAMAAsADYANwAsADAAMAAsADcANQAsADAAMAAsADcAMgAsADAAMAAsADYAMQAs
ADAAMAAsADcANAAsADAAMAAsADYAOQAsADAAMAAsADYAZgAsADAAMAAsADYAZQAsADAAMAAsADIA
MAAsADAAMAAsADYAZgAsADAAMAAsADYANgAsAFwADQAKACAAIAAwADAALAAyADAALAAwADAALAA2
AGUALAAwADAALAA2ADUALAAwADAALAA3ADQALAAwADAALAA3ADcALAAwADAALAA2AGYALAAwADAA
LAA3ADIALAAwADAALAA2AGIALAAwADAALAA2ADkALAAwADAALAA2AGUALAAwADAALAA2ADcALAAw
ADAALAAyADAALAAwADAALABcAA0ACgAgACAANgA2ACwAMAAwACwANgA1ACwAMAAwACwANgAxACwA
MAAwACwANwA0ACwAMAAwACwANwA1ACwAMAAwACwANwAyACwAMAAwACwANgA1ACwAMAAwACwANwAz
ACwAMAAwACwAMAAxACwAMAA1ACwAMAAwACwAMAAwACwAMAAwACwAMAAwACwAMAAwACwAMAA1ACwA
MQA1ACwAXAANAAoAIAAgADAAMAAsADAAMAAsADAAMAAsAGEAOAAsADkAMwAsAGQAMQAsADQANgAs
ADEANgAsAGYAZQAsADgAOQAsAGEANwAsADUANgAsAGUAYwAsADkANgAsADkANwAsAGUAZAAsADAA
MwAsADAAMAAsADAAMAANAAoADQAKAFsASABLAEUAWQBfAEwATwBDAEEATABfAE0AQQBDAEgASQBO
AEUAXABTAEEATQBcAFMAQQBNAFwARABvAG0AYQBpAG4AcwBcAEIAdQBpAGwAdABpAG4AXABBAGwA
aQBhAHMAZQBzAFwATgBhAG0AZQBzAFwATgBlAHQAdwBvAHIAawAgAEMAbwBuAGYAaQBnAHUAcgBh
AHQAaQBvAG4AIABPAHAAZQByAGEAdABvAHIAcwBdAA0ACgBAAD0AaABlAHgAKAAyADIAYwApADoA
DQAKAA0ACgA=
--000000000000ead86c05b4ecf722--
