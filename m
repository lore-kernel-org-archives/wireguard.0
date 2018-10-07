Return-Path: <SRS0=x3Nk=MT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4003FC64EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 16:24:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80F0B204EC
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 16:23:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGkn8S9T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80F0B204EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f46dc80;
	Sun, 7 Oct 2018 16:23:17 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cea28812
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 16:23:15 +0000 (UTC)
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ac7164a8
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 16:23:15 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q5-v6so18204271wrw.12
 for <wireguard@lists.zx2c4.com>; Sun, 07 Oct 2018 09:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:cc:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VYMWHkaSCuw/x/IOZs36sovCnyG1suKu3XlUOg7eiE8=;
 b=GGkn8S9TAh+ezcjwUEF9Bc2V0PglZ77sJPzGF91vAyPK+Bo2UDvGGOEYfj7iOhH3/q
 KnzbkxlH22JS/uO7QluEVCuUHaFJ8OEgWxV0wvxjKuUovE/kUeYxoyZl+SurpQbmLGXD
 E7vcCiqRM7NKMRyuaFSxe93+8sI7IIQotr9VQVL1vB3y5KCcCXh/y2+fCh732WBzBMIL
 F4Oyfn+2bWaKNE3dV7mkp3a3hohAMl8lYNzluz0xRCX7gBLNvenEaqI9fdOtXgd50h/4
 r0h8cSxt+DrqR07pHTFU1GXV7Zjo5wtBlHUPWJ4D0kEJp5hTPExB2gI45TZafpxS3Ou5
 FttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:cc:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VYMWHkaSCuw/x/IOZs36sovCnyG1suKu3XlUOg7eiE8=;
 b=RsmZtZ5MlQUcBennNj2GreKcP5CByumY+v3SO96SwPIDfT1lzzCZhhTkjIDApcNsTL
 VPsMoi8R9g3zzrnI7fldkeCkTPChBVUFhhykgnq8JPy029oGToHbpup9mAjIcEKXxrR7
 zRBqbn6BehOxMjfnOyVm2yZvGCBX9vRIantD0fHsO/jU+CD0BD+TTpbXRD6RY2CLXrMl
 Ywg+fWhRV1MUQd6nzvY0HHB7h3nmYfm5iQ+GV0gvsNSs5Ow49bdzAuLVciCz2s2BtNZT
 y7qUXjQUbYx/8Zawc0FyVj9B5aQLVAPtiyrnqoSXKBvHhFCNNj8acrfozGr5kfffb8VV
 S9rQ==
X-Gm-Message-State: ABuFfogbJ83CB5COszAmDQkBwkHNJn5er644kWtubSSyYN6ujqDj8rp0
 Qp9tFUT5Kcqqw1/TRrpbIKA=
X-Google-Smtp-Source: ACcGV634dp1bP3Z4wdlhjlfyO4Tin7hJP24eTFPzNa+118q5Wl9tt9W0c550CryQEpt5A3Q2+63enw==
X-Received: by 2002:a5d:5601:: with SMTP id
 l1-v6mr14433822wrv.209.1538929435223; 
 Sun, 07 Oct 2018 09:23:55 -0700 (PDT)
Received: from ?IPv6:2003:c5:5f2a:9600:2289:84ff:fe70:d494?
 (p200300C55F2A9600228984FFFE70D494.dip0.t-ipconnect.de.
 [2003:c5:5f2a:9600:2289:84ff:fe70:d494])
 by smtp.googlemail.com with ESMTPSA id
 o130-v6sm3324361wmd.11.2018.10.07.09.23.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Oct 2018 09:23:54 -0700 (PDT)
Subject: Re: [PATCH v4 08/12] netlink: allow modification of transit net
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <20181007141139.26310-1-ju.orth@gmail.com>
 <20181007141139.26310-9-ju.orth@gmail.com>
From: Julian Orth <ju.orth@gmail.com>
Message-ID: <1cffa02d-15bd-97cc-d760-8c6f73799326@gmail.com>
Date: Sun, 7 Oct 2018 18:23:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181007141139.26310-9-ju.orth@gmail.com>
Content-Language: en-US
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

On 10/7/18 4:11 PM, Julian Orth wrote:
> +static int set_socket(struct wireguard_device *wg, struct nlattr **attrs)
>  {
[...]
>  
> -	ret = test_socket_net_capable(wg->transit_net);
> +	ret = test_socket_net_capable(net ? : wg->transit_net);

This is wrong. The capability is checked even if the user hasn't provided any
of the socket attributes. Instead we must check for the capability iff at
least one of the three attributes is provided. It's not sufficient to move the
check below

> +	if (wg->incoming_port == port && (!net || wg->transit_net == net))
> +		goto out;

because this would allow an unprivileged caller to find the port and transit
namespace by trial and error.

I'll fix this in the next version.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
