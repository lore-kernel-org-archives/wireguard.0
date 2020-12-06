Return-Path: <SRS0=YY6m=FK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A29C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Dec 2020 04:45:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6811B22D06
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Dec 2020 04:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6811B22D06
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=msfjarvis.dev
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c43be06;
	Sun, 6 Dec 2020 04:37:54 +0000 (UTC)
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6fca0852
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 6 Dec 2020 04:37:51 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=L1QEBOoLvGzNr0T2OKkiGzVM19NzPdziq1fSxE25sG2tcbDYpPubAV8I9ULNhnqBqAlw/Nv2G2vMH1QRPUwMYchGif2iuSAVzTZqBpbutFFyGx8H4uLFk7xeeKEyEhSO0cBNxxLaH9mqN65SQf0yU2LVDqJ9hWwwcwlFmZ/xP1fz8YVXPwAbuFCpmKM6HFKWPoM146V0/WLidgA2hNGsjhDCkFQSdVsNWTrQ5Nt2wbAtxB0ddWqH4PzI1duiKogkFL8cGN0/mBkc1yHOUBdKWEZ7amDHS/VW9IZ9rXNd/rrvlWLiMzfsYbFysIHRl2c/qfNZH5gz4k+WbXaJuk4VdA==;
 s=purelymail1; d=msfjarvis.dev; v=1;
 bh=BmV1zzfhcVAqshjjvWEAuH74u2TqIzMbyu5OWGPQgoY=; h=Received:From:To; 
DKIM-Signature: a=rsa-sha256;
 b=e4djQRjluDBQKSnVj0hef1neRCfd8gb2Xodo4/AARfn7tJ4aNbMGfUCLPgc0SgrA2nVQDfRVMeUVJHzLfWFLnvg39n1ELLad8Cgp3JvA211XFZdBGCZDYDHy77/FjqzwAW/YWuj6r2xrXEDCqHiuMYvRTnTirhAe0rbA5PdxS6jp/mqidofp25RNhev9S7Y+wjFzhBOGL6UhhIFXjS4fehbZ1kHKabQissZTBaGU7FbjfFixA7THQQ7jDaCZXVOhZbsk4y9+DO5Of8XW60F+jaisWO+NwYq3KxrzYJ64jH9EQEkPcnsEnFBSCGRGd8562BDnqPu+ug0vd7Wn0uwqbg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=BmV1zzfhcVAqshjjvWEAuH74u2TqIzMbyu5OWGPQgoY=;
 h=Feedback-ID:Received:From:To; 
Feedback-ID: 322:138:null:purelymail
X-Pm-Original-To: wireguard@lists.zx2c4.com
Received: by ip-172-30-0-247.ec2.internal (JAMES SMTP Server ) with ESMTPA ID
 -1857039794; Sun, 06 Dec 2020 04:44:43 +0000 (UTC)
Date: Sun, 6 Dec 2020 10:14:39 +0530
From: Harsh Shandilya <me@msfjarvis.dev>
To: Justin McAfee <justinamcafee@gmail.com>
Cc: "=?utf-8?Q?wireguard=40lists.zx2c4.com?=" <wireguard@lists.zx2c4.com>
Message-ID: <A82B7B54-997F-4AC3-9FBD-8EE342E8C1F6@getmailspring.com>
In-Reply-To: <CAFf4X80AwvFEaA5R9DYC9MxCLwh4j-fevZW1+eobTJiMT2Xfzg@mail.gmail.com>
References: <CAFf4X80AwvFEaA5R9DYC9MxCLwh4j-fevZW1+eobTJiMT2Xfzg@mail.gmail.com>
Subject: Re: Android Notification Panel Removed in Android 10
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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


Hey Justin,

On Nov 30 2020, at 2:23 am, Justin McAfee <justinamcafee@gmail.com> wrote:

> It appears that myself and others have noticed that Android 10 has
> removed the VPN status and connection details from the top-down
> notifications UI.
> 
> If a VPN is active, the Key icon appears, but pulling down the
> Notifications bar shows nothing.

That's right, because it was moved further up into the Quick Settings
panel. If you pull again you will see a 'Network is being monitored'
warning below the quick settings tiles, clicking which will take you to
VPN settings.

> 
> This used to be a quick and easy way to verify WG connectivity, active
> tunnel, and amount of bandwidth utilized.
> 
> This can still be accomplished but is done by long pressing the
> wireguard toggle in the quick settings (or opening the wireguard
> application) then selecting the active tunnel and viewing the transfer
> details on the bottom.
> 
> I'm sure this will come up again, but wanted to share with you all.
> 
> Thanks for all the work Jason, et al. put into this project. Its
> greatly appreciated.
> 
> 
> - AV

Cheers,
Harsh
