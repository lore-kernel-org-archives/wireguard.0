Return-Path: <SRS0=ktKO=BC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D38E0C433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Jul 2020 18:03:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43D1720737
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Jul 2020 18:03:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUadjyS4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43D1720737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 02d21763;
	Thu, 23 Jul 2020 17:40:27 +0000 (UTC)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0266fe25
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Jul 2020 17:40:25 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id rk21so7376517ejb.2
 for <wireguard@lists.zx2c4.com>; Thu, 23 Jul 2020 11:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0dMuEH0aLf3g7YbRRJ8f9biDqjJjoizqjy7/6pVwxrY=;
 b=aUadjyS4OSgmoT3t5nR77thV8mqo2Xq4piF+PD/sTPHVCv4zHXKbTe5UnOI7CEDPU0
 2hkIDaJgss7XVaJa4fk9buI9Sv8R7icejrs/RZhbpntZbNjvn8JCGY7wa69EhYizGtg4
 WOZCcSqNvNMES2T/dYz1Mt6LdaWRlO8yTTqoBL0VnWyQwuVFyyb7wY8xqNoOn8OfzBdP
 KbmXQiGuPlXjleuapFZz8zN80GkKb5knga/auIop9kjbSWbXWWIlyS5ObO1XFEpKUBRM
 RfGRYfnm+xOFte+MGGl8tDZTxDCu75rX5fE/B4DoJITF/PoWB8yW4IgFagmw7M0oc1L6
 u6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0dMuEH0aLf3g7YbRRJ8f9biDqjJjoizqjy7/6pVwxrY=;
 b=SjdfvIZ7YeXhPhFCzdxPsB+3xbfHt026mQJERwk1cKDyy/AUZI9qyIPibAyTKjzg/R
 ZIkOJpDoCMiRL/qVK0FKRTV3FL6H56sDCvnT/Dt2LoQslwNBKqQA0rB8Y/XGidkLf1ND
 hMrCWgKgjt72nUivYWxN0ZAOLxv8Fqw5JFrj6tgx5XgBoBy874Y01xl0+aZMUM+6PaK0
 z1bbTCZO2WxSZXeXrCMCokT6RZXolrdk5CcU+GzltCPNODC4aIsXUGGO3p2p2oroP3gL
 SBzEVX1gmKikemZA8tH/MahYqxSsQ/6RWspfoAo/V/x/Q842HXM10FwXmyUGUxoA82aS
 hQ0w==
X-Gm-Message-State: AOAM533FZ0uRvIqahBbczAUzY4YeWC/0jSaCd3+9GRWoN3l1hszB9vcK
 2AzxE2Qvfh4GEep4zDAhaP0r5LMXz340F2rUWHY=
X-Google-Smtp-Source: ABdhPJytRCCTbNlpkyQbeVtB8OfZFD1FsDwDOi+Hb1ASYofAuSIc6nW+I0vtrfiACDJGkz90gWocaijw9hnjvttPTe8=
X-Received: by 2002:a17:906:5791:: with SMTP id
 k17mr2705221ejq.110.1595527392870; 
 Thu, 23 Jul 2020 11:03:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAONL4-JqcxN9gtjH+3GFOsfqM8AcoYdsL3Jvf4aWGG=aF0q+pQ@mail.gmail.com>
 <99D61A626FDA8A4B90A270669121BE10D0DE259A@PLANJAVA.amebis.doma>
In-Reply-To: <99D61A626FDA8A4B90A270669121BE10D0DE259A@PLANJAVA.amebis.doma>
From: Andrew Burkett <burkett.andrew@gmail.com>
Date: Thu, 23 Jul 2020 11:03:00 -0700
Message-ID: <CAONL4-J5tyHvt-yzFMhUW+oa6OtdBEhKxiH+ipbm_z+L+CCtuQ@mail.gmail.com>
Subject: Re: DNS Issues with Wireguard for Windows
To: Simon Rozman <simon@rozman.si>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

Thanks Simon, I didn't realize it always does that. I mistakenly
thought that was only when 0.0.0.0/0 was in allowed ips. Still a bit
odd that windows networking seems to break only when I put a
particular unrelated address in allowedips, but looking through the
wireguard-windows code now, I don't see how it can be wireguard's
fault.

Andrew

On Thu, Jul 23, 2020 at 5:01 AM Simon Rozman <simon@rozman.si> wrote:
>
> WireGuard for Windows adds a firewall rules to block all DNS traffic except to the DNS servers listed in the WireGuard config. This is by design (preventing data leakage).
>
> Regards,
> Simon
>
> > -----Original Message-----
> > From: WireGuard <wireguard-bounces@lists.zx2c4.com> On Behalf Of Andrew
> > Burkett
> > Sent: Saturday, July 11, 2020 1:31 AM
> > To: wireguard@lists.zx2c4.com
> > Subject: DNS Issues with Wireguard for Windows
> >
> > I was running into dns issues with wireguard on windows using the
> > released gui app. It seems like a bug with wireguard, but not sure if it
> > was actually something about my networking configs that messed it up. I
> > was able to work around the issue by changing the wireguard config (in a
> > way that seemed odd to me), but I thought it might be useful to share
> > what I was seeing in case its helpful to others or if it is in fact a
> > bug in wireguard. I'll share the configs at the bottom of the email, but
> > I'm just going to describe what I'm seeing first.
> >
> > My basic setup is I have wireguard running on a linux box functioning as
> > a server/router to a remote network. I've got a windows desktop
> > connecting to the linux box via wireguard. There are dns servers on the
> > remote network that I would like to use from the desktop. I added the
> > dns servers from the remote network to my desktop wireguard config.
> > Everything was working fine for awhile. At some point, my windows box
> > started complaining about not being connected to the internet. I was
> > able to pinpoint it with some confidence to dns requests failing when
> > wireguard was connected. Even though windows was complaining about not
> > having a network connection, my browser still worked though it seemed
> > slow so I assumed it was trying a dns server and then falling back to a
> > different one after a timeout (at least that was my guess). The "cause"
> > of the problem was adding
> > 192.168.7.12/32 to the AllowedIPs on the peer (the wireguard network in
> > my case is 10.98.1.0/24 and the rest of the network is under
> > 10.0.X.X) After adding it and waiting for a couple hours windows will
> > inevitably claim that there is no internet access from my network
> > adapter. Sometimes nslookup and ping still work fine, sometimes they
> > start to report errors. My solution that reliably fixes it is to add my
> > local dns server (which is my local router in this case
> > 192.168.86.1) to the dns section of the wireguard config, which seems
> > like an odd fix since I'm not actually sending local dns traffic to
> > wireguard.
> >
> > I couldn't figure out how to use wireshark to view wireguard traffic on
> > windows to see what's happening to the dns requests, nor do I know of
> > another way to view traffic (If someone wants to point me at how to do
> > that, or some other way to view network traffic on windows, I'm happy to
> > look at it).
> >
> > Anyway, thanks for the software. It's the best vpn software I've used by
> > a mile.
> >
> > Andrew
> >
> > My Local Gateway/DNS is 192.168.86.1
> > My Local IP is in 192.168.86.0/24 subnet
> >
> > Working Config 1
> >
> > [Interface]
> > PrivateKey = XXXXX
> > Address = 10.98.1.103/32
> > DNS = 10.0.X.X, 10.0.Y.Y
> >
> > [Peer]
> > PublicKey = XXXXXX
> > AllowedIPs = 10.0.0.0/16, 10.98.1.0/24
> > Endpoint = XXXXXXX
> >
> > Working Config 2
> >
> > [Interface]
> > PrivateKey = XXXXX
> > Address = 10.98.1.103/32
> > DNS = 10.0.X.X, 10.0.Y.Y , 192.168.86.1
> >
> > [Peer]
> > PublicKey = XXXXXX
> > AllowedIPs = 10.0.0.0/16, 10.98.1.0/24, 198.168.7.12/32 Endpoint =
> > XXXXXXX
> >
> > NonWorking Config
> >
> > [Interface]
> > PrivateKey = XXXXX
> > Address = 10.98.1.103/32
> > DNS = 10.0.X.X, 10.0.Y.Y
> >
> > [Peer]
> > PublicKey = XXXXXX
> > AllowedIPs = 10.0.0.0/16, 10.98.1.0/24, 198.168.7.12/32 Endpoint =
> > XXXXXXX
