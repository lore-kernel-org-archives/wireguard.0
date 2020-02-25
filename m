Return-Path: <SRS0=8BwB=4N=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8671C35E03
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 14:51:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C6FD2064A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 14:51:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSWpnUjf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C6FD2064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a0875c8;
	Tue, 25 Feb 2020 14:47:34 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 97d17962
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 14:47:29 +0000 (UTC)
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 300bd2ff
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 14:47:29 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id d10so14328116ljl.9
 for <wireguard@lists.zx2c4.com>; Tue, 25 Feb 2020 06:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JfK2ivY9dnNuHDEnmydEMGheqJnaRCtKHwm5FELayhY=;
 b=iSWpnUjf3Ktbn+ervx0JcC61JI/j8jXEgH0gjQX9Ql6koS1PKvDvrMixwx1f4ATex7
 zUmTFDxgnKoS/+1jNcYbW+kes03eG0P8xd5QsN9QeWovGbTQPisr1TT0T10Qf8/GY7sX
 yRH+cfvEWfd71qv/VcRU8KB+P3P+noAwwm1vwcoNp6zan3euid0sSzEQWXKXOKzloafv
 6EVvqbmmvPuBwIoKKbVCFpA2KItFd9zegdYzsuIjOf1hSfsk/nnXcOGf0QsTYO4dGrWa
 42dNRX1K9K6fG363IUZLFVcKZ6GV9DWwbrFxgpH8Uhi3cd8U+1vIJhUORPlpOvpyUkgM
 OPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JfK2ivY9dnNuHDEnmydEMGheqJnaRCtKHwm5FELayhY=;
 b=kZxmstHirm3ptVeCGbpbevmb7fJ/lzOal1bGNSGiWNoWgAaqTM81tFaMv3yZHyMSzx
 jD5dg+epdp52EY7vKfoeIgkAYsZ2ACByGmZZkF57PJ/lXKRecykDLGvxTnUc9S4BYvc3
 6mHzQ37bXVVh3YRw0NTWZuibkwMbIO4ayJEFyIhuVXjXll1biR7NrUWkFsZ7XUYUf9PV
 DP6ymVGjQKfm6I8UBVUPKyndq2T4WOQlxERmfaKQdsdScxcT1CK3XVGrk6XsyvOdSAgk
 4CVnFjs/ys7nKOxvJ+6C4Fix2JLW0PHXVrdpCyMRBCP2TqxPO+U+oJruDHhoOib5TM77
 8uRw==
X-Gm-Message-State: APjAAAVFctenPJSEFKundCvTsZWtbyvhTzm/kDbPb++QX6qI2refR1GO
 vskYNtgnOjuXAuE7lzf3MEu9fOf7zSt02LfGzug=
X-Google-Smtp-Source: APXvYqyUaBFSjx4CcuH6tkfTb72rQzc/AWk04W4bdEIQAbRrjb7FXblVEyMP477UR+M5jJsWbJX7h92b/I6gQ1SB2VA=
X-Received: by 2002:a2e:b4ef:: with SMTP id s15mr35390961ljm.20.1582642258581; 
 Tue, 25 Feb 2020 06:50:58 -0800 (PST)
MIME-Version: 1.0
References: <20200217035701.28261-1-matt@oliver.net.au>
 <CAEQe3e=JMOwASvDGuC00uiYdTY_VaU0PnB285pU715i7g4uRaA@mail.gmail.com>
 <6631a080206c608c7b92cffab3f739c66a1ff1e8.camel@gmail.com>
 <219C0F7A-E7F7-46BD-9E38-09D620299053@barrys-emacs.org>
In-Reply-To: <219C0F7A-E7F7-46BD-9E38-09D620299053@barrys-emacs.org>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Tue, 25 Feb 2020 15:50:47 +0100
Message-ID: <CAKXLc7ca-9vN2bVLaWyPf3td0jCLWCWv3P+PNNcB4rs8pVhrjA@mail.gmail.com>
Subject: Re: [PATCH] wg show: Add json output
To: Barry Scott <barry@barrys-emacs.org>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Barry,

Please read the reply below with a smile, it is just friendly sarcasm
underlining my personal view.

On Tue, Feb 25, 2020 at 1:50 AM Barry Scott <barry@barrys-emacs.org> wrote:
> > On 23 Feb 2020, at 12:45, Arti Zirk <arti.zirk@gmail.com> wrote:
> >
> > On E, 2020-02-17 at 15:47 +1100, Matthew Oliver wrote:
> >> Someone asked about this in the IRC channel, so quickly wrote up a
> >> patch to add it. No pressure if you do/don't want to merge it :)
> >
> > If you have wireguard-tools package installed then it should be
> > possible to use the incldued wg-json script to do the same
> >
> >  sudo /usr/share/wireguard-tools/examples/json/wg-json
>
> When I built my tools in python on top of the wg command I was
> please to see a machine interface, but find the \t separated list
> of values odd to find in a modern app.
>
... and it doesn't support dark-mode for the matter! Neither has it
autoupdate script!
And no PDF documentation generated by doxygen! And no JNI !

May be it is just a simple & easy, robust tool that does one thing and
does it good and fast?

> I think it would be a good addition to have the JSON output
> without the need to use a contrib script. Many text commands
> output in JSON or XML for ease of interfacing.
>
So, sarcasm aside, I really think keeping it simple is better.
If you need JSON for some reason, use the script in contrib and patch
if it doesn't work as needed, or suggest another script or way,
without strapping a kitchen sink to the core.
And for tighter integration, use the Netlink API (uapi/wireguard.h) directly.

> The JSON would also provide a nice way to add more attributes
> in the future.
>
Adding "more attributes" is definitely not on the todo list, AFAIK,
and given that in the remote case of adding a secondary output format
(json) it may need to be backward compatible with the default text
output, this is not a reason.
In the sense that if we add a plugin for Alexa to explain a wg output,
auto-magically translating it of course, there is a high chance of it
being only a secondary priority (to the simple text output).

Cheers,
Kalin.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
